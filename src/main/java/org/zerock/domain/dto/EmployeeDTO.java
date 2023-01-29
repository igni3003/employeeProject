package org.zerock.domain.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.zerock.domain.vo.depart.DeptEmpVO;
import org.zerock.domain.vo.employee.EmployeeVO;
import org.zerock.domain.vo.title.TitleVO;

import lombok.Data;

@Data
public class EmployeeDTO {
	private Long emp_no;
	private String first_name;
	private String last_name;
	private String gender;

	private String dept_no;
	private String title;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hire_date;
	
	public EmployeeVO toEmployeeVO() {
		return EmployeeVO.builder()
		.emp_no(emp_no)
		.first_name(first_name)
		.last_name(last_name)
		.gender(gender)
		.birth_date(birth_date)
		.hire_date(hire_date)
		.title(title)
		.dept_no(dept_no)
		.build();
	}
	
	public DeptEmpVO toDeptEmpVO() {
		return DeptEmpVO.builder()
				.emp_no(emp_no)
				.dept_no(dept_no)
				.from_date(hire_date)
				.build();
	}
	
	public TitleVO toTitleVO() {
		return TitleVO.builder()
				.emp_no(emp_no)
				.title(title)
				.from_date(hire_date)
				.build();
	}

}




