package org.zerock.domain.vo.common;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long r_no;
	private Long b_no;
	private Long emp_no;
	private String reply;
	
	private Date reply_date;
	private Date update_date;
}
