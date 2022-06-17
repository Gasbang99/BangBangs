package com.bbs.model.vo;

import java.sql.Date;

import com.bbs.model.vo.BoardComment;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardComment {
	private int boardCommentNo;
	private int boardCommentLevel;
	private String boardCommentWriter;
	private int boardRef;
	private int boardCommentRef;
	private String boardCommentContent;
	private Date boardCommentDate;
}
