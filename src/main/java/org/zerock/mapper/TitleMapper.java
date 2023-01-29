package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.vo.title.TitleVO;

public interface TitleMapper {
	
	public int insert(TitleVO title);
	
	public List<TitleVO> getTitles(Long emp_no);

}
