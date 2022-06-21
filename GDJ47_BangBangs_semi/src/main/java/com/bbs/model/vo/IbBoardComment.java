package com.bbs.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;
@Data
@Builder
public class IbBoardComment {
	private int IbCommentNum;
	private String IbCommentContent;
	private String IbCommentWriter;
	private int IbPostNum;
	private Date IbCommentEnrollDate;
}
