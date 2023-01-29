package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.dto.EmployeeDTO;
import org.zerock.domain.vo.depart.DeptEmpVO;
import org.zerock.domain.vo.employee.EmployeeVO;
import org.zerock.mapper.DepartmentMapper;
import org.zerock.mapper.EmployeeMapper;
import org.zerock.mapper.TitleMapper;

import lombok.RequiredArgsConstructor;
import org.zerock.service.interfaces.EmployeeService;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {
	
	private final EmployeeMapper employeeMapper;
	private final DepartmentMapper departmentMapper;
	private final TitleMapper titleMapper;
	
	@Override
	public List<EmployeeVO> getList(Criteria cri) {
		return employeeMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return employeeMapper.getTotalCount(cri);
	}
	
	@Transactional
	@Override
	public int register(EmployeeDTO dto) {
		EmployeeVO vo = dto.toEmployeeVO();
		employeeMapper.insertSelectKey(vo);
		dto.setEmp_no(vo.getEmp_no());
		departmentMapper.insertDeptEmployee(dto.toDeptEmpVO());
		return titleMapper.insert(dto.toTitleVO());
	}
	
	@Transactional
	@Override
	public int modify(EmployeeDTO dto) {
		employeeMapper.update(dto.toEmployeeVO());
		DeptEmpVO deptEmpVO = dto.toDeptEmpVO();
		if(departmentMapper.eqCurrentDept(deptEmpVO) == 0) {
			//deptEmpVO.setFrom_date(null);
				
		}
		return 0;
	}
	
	@Override
	public EmployeeVO get(Long emp_no) {
		return employeeMapper.read(emp_no);
	}

	@Transactional
	@Override
	public int retire(Long emp_no) {
		return employeeMapper.retire(emp_no);
	}
}







