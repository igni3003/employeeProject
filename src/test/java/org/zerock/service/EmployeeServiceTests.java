package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.zerock.service.interfaces.EmployeeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EmployeeServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private EmployeeService employeeService;
	
	@Test
	public void getList() {
		Criteria cri = new Criteria();
		log.info(employeeService.getList(cri));
	}
	
	@Test
	public void getTotal() {
		Criteria cri = new Criteria();
		log.info("...............getTotal:"+employeeService.getTotal(cri));
	}

}
