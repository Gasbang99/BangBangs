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
   private String onLoan;
}