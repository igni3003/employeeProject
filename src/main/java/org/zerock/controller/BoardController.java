package org.zerock.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.dto.PageDTO;
import org.zerock.domain.vo.board.BoardAttachVO;
import org.zerock.domain.vo.board.BoardVO;
import org.zerock.service.interfaces.BoardService;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@Log4j
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
	private final BoardService boardService;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list......" + cri);
		model.addAttribute("list", boardService.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, boardService.getTotal(cri)));
	}
	
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("b_no") Long b_no, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info(b_no);
		model.addAttribute("board", boardService.get(b_no));
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rtts) {
		log.info("register : " + board);

		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> {
				log.info(attach);
			});
		}
		boardService.register(board);
		rtts.addFlashAttribute("result", board.getB_no());
		return "redirect:/board/list";
	}

	@GetMapping("/register")
	public void register() {

	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
		log.info("modify.......................");
		log.info("modify......................." + board);
		
		if (boardService.modify(board)) {
			rtts.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("b_no") Long b_no, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
		log.info("remove.......................");
		
		List<BoardAttachVO> attaList 
		= boardService.getAttachList(b_no);
		
		if (boardService.remove(b_no)) {
			deleteFiles(attaList);
			rtts.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long b_no) {
		log.info("getAttachList!!!! : " + b_no);
		return new ResponseEntity<>(boardService.getAttachList(b_no), HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files...................");

		attachList.forEach(attach -> {
			try {
				String path = "C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_"
						+ attach.getFileName();
				Path file = Paths.get(path);
				Files.deleteIfExists(file);
				if (Files.probeContentType(file).startsWith("image")) {
					String thumNailPath = "C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFileName();
					Path thumNail = Paths.get(thumNailPath);
					Files.delete(thumNail);
				}
			} catch (Exception e) {
				log.error(e);
			}
		});

	}
}
	