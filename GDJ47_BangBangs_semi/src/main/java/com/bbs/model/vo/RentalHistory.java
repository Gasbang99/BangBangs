package com.bbs.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class RentalHistory {
	private int rentalId;
	private	int bikeId;
	private String memberId;
	private Date rentalStartTime;
	private Date rentalReturnTime;
	private int rentalUsedTime;
}
