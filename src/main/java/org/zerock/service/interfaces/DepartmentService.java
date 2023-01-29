package org.zerock.service.interfaces;

import java.util.List;

import org.zerock.domain.vo.depart.DepartmentVO;
import org.zerock.domain.vo.depart.DeptEmpVO;
import org.zerock.domain.vo.depart.DeptTitleVO;

public interface DepartmentService {

	public List<DepartmentVO> getDepartments();
	
	public List<DeptTitleVO> getDeptTitles(String dept_no);
	
	public List<DeptEmpVO> getDeptEmployee(Long emp_no);

}





