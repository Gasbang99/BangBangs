package com.bbs.payment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class PosessionTicket {
	private int psTicketId;
	private String psTicketActive;
	private Date psTicketActiveDate;
	private Date psTicketExpireDate;
	private String psTicketCode;
	private String memberId;
}
