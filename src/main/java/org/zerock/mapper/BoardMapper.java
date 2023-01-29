package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.vo.board.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList();

	public BoardVO read(Long b_no);

	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);

	public int delete(Long b_no);

	public int update(BoardVO board);

	public int getTotalCount(Criteria cri);
	
	public List<BoardVO> getListWithPaging(Criteria cri);

	public void updateReplyCnt(@Param("b_no") Long b_no, @Param("amount") int amount);
}
