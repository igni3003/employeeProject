package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.vo.common.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("b_no") Long b_no);

	public int getCountByBno(Long b_no);
	
	public int insert(ReplyVO reply);

	public ReplyVO read(Long r_no);

	public int delete(Long r_no);
	
	public int deleteAll(Long b_no);

	public int update(ReplyVO reply);
}
