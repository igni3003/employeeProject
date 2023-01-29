package org.zerock.service.interfaces;

import org.zerock.domain.Criteria;
import org.zerock.domain.vo.board.BoardAttachVO;
import org.zerock.domain.vo.board.BoardVO;

import java.util.List;

public interface BoardService {
	/**
	 * 게시판 리스트
	 * @param cri : 페이징 VO
	 * @return : 게시판 리스트
	 */
	List<BoardVO> getList(Criteria cri);
	
	BoardVO get(Long b_no);

	void register(BoardVO board);

	boolean remove(Long b_no);

	boolean modify(BoardVO board);
	
	int getTotal(Criteria cri);

	/**
	 * 게시글 첨부파일 리스트 조회
	 * @param b_no: 게시글 번호(board_num)
	 * @return : 첨부파일 리스트
	 */
	List<BoardAttachVO> getAttachList(Long b_no);
}
