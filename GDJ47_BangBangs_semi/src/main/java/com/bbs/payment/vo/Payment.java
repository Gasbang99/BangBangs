package com.bbs.payment.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Payment {
	private String ticketCode;
	private String ticketName;
	private Date timeLimit;
	private Date dateLimit;
}
