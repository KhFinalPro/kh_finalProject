package com.kh.chickenPeople.brand.model.vo;

import java.io.Serializable;

public class Brand implements Serializable{

	private static final long serialVersionUID = 4211123053219988695L;

	
	private String brand_code;			//브랜드 코드
	private String brand_pic;			//브랜드 사진
	private String brand_name;			//브랜드 이름
	private String brand_yn;			//입점 유무
	private int brand_count;			//입점 매장 수
	
	public Brand() {
	}

	public Brand(String brand_code, String brand_pic, String brand_name) {
		super();
		this.brand_code = brand_code;
		this.brand_pic = brand_pic;
		this.brand_name = brand_name;
	}

	public Brand(String brand_code, String brand_pic, String brand_name, String brand_yn) {
		super();
		this.brand_code = brand_code;
		this.brand_pic = brand_pic;
		this.brand_name = brand_name;
		this.brand_yn = brand_yn;
	}

	public Brand(String brand_code, String brand_pic, String brand_name, String brand_yn, int brand_count) {
		super();
		this.brand_code = brand_code;
		this.brand_pic = brand_pic;
		this.brand_name = brand_name;
		this.brand_yn = brand_yn;
		this.brand_count = brand_count;
	}

	public String getBrand_code() {
		return brand_code;
	}

	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
	}

	public String getBrand_pic() {
		return brand_pic;
	}

	public void setBrand_pic(String brand_pic) {
		this.brand_pic = brand_pic;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getBrand_yn() {
		return brand_yn;
	}

	public void setBrand_yn(String brand_yn) {
		this.brand_yn = brand_yn;
	}

	public int getBrand_count() {
		return brand_count;
	}

	public void setBrand_count(int brand_count) {
		this.brand_count = brand_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Brand [brand_code=" + brand_code + ", brand_pic=" + brand_pic + ", brand_name=" + brand_name
				+ ", brand_yn=" + brand_yn + ", brand_count=" + brand_count + "]";
	}

	
	
	
	
	
}
