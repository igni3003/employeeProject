package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.dto.ReplyPageDTO;
import org.zerock.domain.vo.common.ReplyVO;
import org.zerock.service.interfaces.ReplyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController // REST + Controller
@RequestMapping("/replies/*")
@RequiredArgsConstructor
@Log4j
public class ReplyController {
	private final ReplyService replyService;

	@RequestMapping(
			value = "/{r_no}", 
			consumes = "application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE }, 
			method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("r_no") Long r_no) {
		vo.setR_no(r_no);
		
		return (replyService.modify(vo) == 1) 
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping(value = "/{r_no}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("r_no") Long r_no) {
		log.info("remove : " + r_no);
		return replyService.remove(r_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/{r_no}", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("r_no") Long r_no) {
		return new ResponseEntity<>(replyService.get(r_no), HttpStatus.OK);
	}

	@GetMapping(value = "/pages/{b_no}/{page}", 
			produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("b_no") Long b_no) {
		log.info(".............." + page);
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(replyService.getListPage(cri, b_no), HttpStatus.OK);
	}

	@PostMapping(value = "/new", 
			consumes = "application/json", 
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO reply) {
		log.info("ReplyVO" + reply);

		int insertCount = replyService.register(reply);

		return (insertCount == 1) ? new ResponseEntity<>("sucess", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
