package org.zerock.domain.vo.board;

import lombok.Data;

@Data
public class BoardAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long b_no;
	
}
