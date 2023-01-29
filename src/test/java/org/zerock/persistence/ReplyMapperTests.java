package org.zerock.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.vo.common.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	@Test
	public void testRead() {
		ReplyVO reply = replyMapper.read(2L);
		log.info(reply);
	}
	
	@Test
	public void testInsert() {
			ReplyVO vo = new ReplyVO();
			vo.setB_no(2L);
			vo.setReply("테스트");
			vo.setEmp_no(10003L);
			replyMapper.insert(vo);
		}
	
	@Test
	public void testDelete() {
		int count = replyMapper.delete(9L);
		log.info(".............. delete result : " + count);
	}
	
	@Test
	public void testUpdate() {
		Long r_no = 8L;
		ReplyVO reply = replyMapper.read(r_no);
		reply.setReply("update reply.....");
		int count = replyMapper.update(reply);
		log.info("......update count : " + count);
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		cri.setPageNum(820);
		List<ReplyVO> replies = 
		replyMapper.getListWithPaging(cri, 1572827L);
		replies.forEach(r -> log.info(r));
	}
	
	@Test
	public void testTotal() {
		Long b_no = 2L;
		log.info(replyMapper.getCountByBno(b_no));
	}
	
}
