package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.vo.depart.DepartmentVO;
import org.zerock.domain.vo.depart.DeptEmpVO;
import org.zerock.domain.vo.depart.DeptTitleVO;
import org.zerock.mapper.DepartmentMapper;

import lombok.RequiredArgsConstructor;
import org.zerock.service.interfaces.DepartmentService;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {
	
	private final DepartmentMapper departmentMapper;
	
	@Override
	public List<DepartmentVO> getDepartments() {
		return departmentMapper.getDepartments();
	}
	
	@Override
	public List<DeptTitleVO> getDeptTitles(String dept_no) {
		return departmentMapper.getDeptTitles(dept_no);
	}
	
	@Override
	public List<DeptEmpVO> getDeptEmployee(Long emp_no) {
		return departmentMapper.getDeptEmployee(emp_no);
	}
	
	
}
