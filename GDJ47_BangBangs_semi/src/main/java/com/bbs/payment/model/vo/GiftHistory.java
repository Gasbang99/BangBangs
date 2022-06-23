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

public class GiftHistory {
	private String giftId;
	private String giveMemberId;
	private String takeMemberId;
	private Date sendDate;
	private String ticketCode;
}
