package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.vo.board.BoardAttachVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Long b_no);
	
	public void deleteAll(Long b_no);
}
