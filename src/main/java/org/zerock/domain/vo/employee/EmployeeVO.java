package org.zerock.domain.vo.employee;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmployeeVO {
	private Long emp_no;
	private String first_name;
	private String last_name;
	private String gender;
	
	private String dept_no;
	private String dept_name;
	private String title;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hire_date;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date retire_date;
}
