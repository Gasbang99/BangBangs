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
public class Ticket {
	private String ticketCode;
	private String ticketName;
	private int timeLimit;
	private int dateLimit;
	private int ticketPrice;
}
