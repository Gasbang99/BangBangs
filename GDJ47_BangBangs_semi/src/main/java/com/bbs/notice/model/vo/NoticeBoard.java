package com.bbs.notice.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;
@Data
@Builder
public class NoticeBoard {
	private int noticeNum;
	private String noticeTitle;
	private Date noticeEnrollDate;
	private String noticeContent;
	private String IbBoardOriginalFilename;
	private String IbBoardRenamedFilename; 
}
