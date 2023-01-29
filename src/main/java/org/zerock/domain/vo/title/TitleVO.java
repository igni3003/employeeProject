package org.zerock.domain.vo.title;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TitleVO {
	private Long emp_no;
	private String title;
	private Date from_date;
	private Date to_date;
}
