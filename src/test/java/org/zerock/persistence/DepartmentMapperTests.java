package org.zerock.persistence;

import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.vo.depart.DepartmentVO;
import org.zerock.domain.vo.depart.DeptEmpVO;
import org.zerock.mapper.DepartmentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DepartmentMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private DepartmentMapper departmentMapper;
	
	@Test
	public void testGetDepartments() {
		List<DepartmentVO> list = 
	departmentMapper.getDepartments();
		list.forEach(d -> {
			log.info(d);
		});
	}
	
	@Test
	public void testInsertDeptEmp() {
		Calendar cal = Calendar.getInstance();
//		cal.set(0, 0, 0);
		DeptEmpVO emp = 
		DeptEmpVO.builder()
		.emp_no(10001L)
		.dept_no("d001")
		.from_date(cal.getTime())
		.build();
		
		departmentMapper.insertDeptEmployee(emp);
		
	}
	
	@Test
	public void testDeptEmployee() {
		Long emp_no = 499992L;
		List<DeptEmpVO> list = departmentMapper.getDeptEmployee(emp_no);
		list.forEach(emp -> {
			log.info(emp);
		});
	}
	
	@Test
	public void testEqCurrentDept() {
		DeptEmpVO vo = DeptEmpVO.builder().dept_no("d004").emp_no(100010L).build();
		int result = departmentMapper.eqCurrentDept(vo);
		log.info("eqCurrentDept : " + result);
	}
	
}









