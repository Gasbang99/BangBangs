package com.bbs.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class RentalShop {
	private int rentalShopId;
	private String rentalShopName;
	private double latitude;
	private double longitude;
	private String rentalShopAddress;

}
