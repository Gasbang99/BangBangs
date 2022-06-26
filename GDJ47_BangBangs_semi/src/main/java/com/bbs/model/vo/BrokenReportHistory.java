package com.bbs.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class BrokenReportHistory {
	private int brokenReportId;
	private String brokenReportTitle;
	private String brokenReportContent;
	private int bikeId;
	private String memberId;
	private Date brokenReportEnrollDate;

}
