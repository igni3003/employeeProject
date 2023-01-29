package org.zerock.domain.dto;

import lombok.Getter;
import lombok.ToString;
import org.zerock.domain.Criteria;

@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;

	Criteria cri;
	int total;

	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int readEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if(readEnd < this.endPage) {
			 this.endPage = readEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < readEnd;
	}

}

