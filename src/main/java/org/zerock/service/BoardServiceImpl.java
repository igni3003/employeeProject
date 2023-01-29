package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.vo.board.BoardAttachVO;
import org.zerock.domain.vo.board.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.zerock.service.interfaces.BoardService;

@Service
@RequiredArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService {

	private final BoardMapper boardMapper;
	private final ReplyMapper replyMapper;
	private final BoardAttachMapper boardAttachMapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public BoardVO get(Long b_no) {
		return boardMapper.read(b_no);
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(Long b_no) {
		return boardAttachMapper.findByBno(b_no);
	}
	
    @Transactional
	@Override
	public void register(BoardVO board) {
		boardMapper.insert(board);
		log.info(board.getB_no());
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach -> {
				log.info("attachGetBn_no : " + attach.getB_no());
				attach.setB_no(board.getB_no());
				boardAttachMapper.insert(attach);
		});
	}

	@Override
	public boolean remove(Long b_no) {
		// work
		log.info("remove......." + b_no);
		boardAttachMapper.deleteAll(b_no);
		replyMapper.deleteAll(b_no);
		return boardMapper.delete(b_no) == 1;
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		boardAttachMapper.deleteAll(board.getB_no());
		boolean modifyResult = boardMapper.update(board) == 1;

		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0 ) {
			board.getAttachList().forEach(attach -> {
				attach.setB_no(board.getB_no());
				boardAttachMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}
}
