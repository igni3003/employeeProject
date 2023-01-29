package org.zerock.service.interfaces;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.dto.ReplyPageDTO;
import org.zerock.domain.vo.common.ReplyVO;

public interface ReplyService {
	public ReplyPageDTO getListPage(Criteria cri, Long b_no);
	
	public List<ReplyVO> getList(Criteria cri, Long b_no);
	
	public int register(ReplyVO reply);
	
	public ReplyVO get(Long r_no);
	
	public int modify(ReplyVO reply);
	
	public int remove(Long r_no);
}
