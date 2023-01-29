package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.vo.board.BoardVO;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper boardAttachMapper;
	
	@Test
	public void testGetList() {
		log.info("----------------------------------------------");
		boardMapper.getList().forEach(b -> log.info(b));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testInsert() {
		log.info("----------------------------------------------");
		BoardVO board = BoardVO.builder().emp_no(10002L).title("ASDF").content("QWER").build();
		boardMapper.insertSelectKey(board);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testDelete() {
		log.info("----------------------");
		boardMapper.delete(1L);
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = BoardVO.builder().b_no(2L).title("title").content("content").build();
		int result = boardMapper.update(vo);
		log.info("===========================================================");
		log.info("count.............." + result);
		log.info("===========================================================");
	}
	
	@Test
	public void testRead() {
		log.info(boardMapper.read(2L));
	}
	
	@Test
	public void testTotal() {
		Criteria cri = new Criteria();
		cri.setType("TC");
		cri.setKeyword("title");
		log.info(".........................Total:" + boardMapper.getTotalCount(cri));
	}
	
	@Test
	public void testGetListWithPaging() {
		Criteria cri = new Criteria();
		cri.setType("TC");
		cri.setKeyword("title");
		boardMapper.getListWithPaging(cri);
	}

	@Test
	public void testAttach() {
		log.info(boardAttachMapper.findByBno(45L));
	}
}
