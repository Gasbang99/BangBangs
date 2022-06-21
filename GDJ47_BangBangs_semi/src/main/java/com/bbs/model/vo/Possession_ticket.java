package com.bbs.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class Possession_ticket {
	private int psTicketId;
	private String psTicketAct;
	private Date psTicketActDate;
	private Date psTicketExpDate;
	private String psTicketCode;
	private String memberId;
	
}
