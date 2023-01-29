package org.zerock.service.interfaces;

import java.util.List;

import org.zerock.domain.vo.title.TitleVO;

public interface TitleService {
	public List<TitleVO> getTitles(Long emp_no);

}
