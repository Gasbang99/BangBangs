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
public class PurchaseHistory {
	private int purchaseId;
	private String purchaseMethod;
	private int paymentAmount;
	private Date purchaseDate;
	private int mileageSave;
	private int mileageDeduction;
	private String ticketCode;
	private String memberId;
}
