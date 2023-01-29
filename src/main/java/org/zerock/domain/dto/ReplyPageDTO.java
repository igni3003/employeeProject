package org.zerock.domain.dto;

import java.util.List;

import org.zerock.domain.vo.common.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
	private int replyCnt;
	private List<ReplyVO> list;
}
