package com.bbs.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;
@Data
@Builder

public class IbBoard {

	private int ibPostNum;
	private String ibTitle;
	private Date ibEnrollDate;
	private String memberId;
	private String category;
	private String ibContent;
	private String IbBoardOriginalFilename;
	private String IbBoardRenamedFilename;
	
	
}
