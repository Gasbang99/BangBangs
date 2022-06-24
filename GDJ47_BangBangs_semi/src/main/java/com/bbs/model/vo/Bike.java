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
public class Bike {
	private int bikeId;
	private String bikeStatus;
	private Date bikeEnollDate;
	private int rentalShopId;
	private String rentalAvail;
	
}
