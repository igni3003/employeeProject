package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.vo.employee.EmployeeVO;

public interface EmployeeMapper {

	public List<EmployeeVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public int insertSelectKey(EmployeeVO emp);
	
	public EmployeeVO read(Long emp_no);
	
	public int update(EmployeeVO emp);

	public int retire(Long emp_no);
}
