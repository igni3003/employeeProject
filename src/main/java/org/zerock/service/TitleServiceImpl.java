package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.vo.title.TitleVO;
import org.zerock.mapper.TitleMapper;

import lombok.RequiredArgsConstructor;
import org.zerock.service.interfaces.TitleService;

@Service
@RequiredArgsConstructor
public class TitleServiceImpl implements TitleService {
	private final TitleMapper titleMapper;

	@Override
	public List<TitleVO> getTitles(Long emp_no) {
		return titleMapper.getTitles(emp_no);
	}
}
