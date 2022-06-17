package com.bbs.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


public class Member {
	
	private String member_id;
	private String member_password;
	private String member_name;
	private String gender;
	private int age;
	private String email;
	private String phone;
	private String address;
	private Date enroll_date;
	private String member_level;
	private int total_mileage;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String member_id, String member_password, String member_name, String gender, int age, String email,
			String phone, String address, Date enroll_date, String member_level, int total_mileage) {
		super();
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_name = member_name;
		this.gender = gender;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enroll_date = enroll_date;
		this.member_level = member_level;
		this.total_mileage = total_mileage;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

	public int getTotal_mileage() {
		return total_mileage;
	}

	public void setTotal_mileage(int total_mileage) {
		this.total_mileage = total_mileage;
	}

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_password=" + member_password + ", member_name="
				+ member_name + ", gender=" + gender + ", age=" + age + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", enroll_date=" + enroll_date + ", member_level=" + member_level
				+ ", total_mileage=" + total_mileage + "]";
	}

}
