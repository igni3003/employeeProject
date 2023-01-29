package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.vo.depart.DepartmentVO;
import org.zerock.domain.vo.depart.DeptEmpVO;
import org.zerock.domain.vo.depart.DeptTitleVO;

public interface DepartmentMapper {
	
	@Select("SELECT * FROM departments ORDER BY dept_no ASC")
	public List<DepartmentVO> getDepartments();
	
	public List<DeptTitleVO> getDeptTitles(String dept_no);
	
	public List<DeptEmpVO> getDeptEmployee(Long emp_no);
	
	public int insertDeptEmployee(DeptEmpVO emp);
	
	public int eqCurrentDept(DeptEmpVO emp);
}













