package com.bbs.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Member {
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String gender;
	private String birthday;
	private String email;
	private String address;
	private String phone;
	private Date enrollDate;
	private String memberLevel;
	private int totalMileage;
}
