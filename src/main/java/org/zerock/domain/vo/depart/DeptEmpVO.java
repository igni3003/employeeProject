package org.zerock.domain.vo.depart;

import java.util.Date;

import com.fasterxml.jackson.annotation.JacksonAnnotationsInside;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DeptEmpVO {
	private Long emp_no;
	private String dept_no;
	
	private String dept_name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date from_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date to_date;

}







