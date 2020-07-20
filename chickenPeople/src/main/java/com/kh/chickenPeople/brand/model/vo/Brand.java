package com.kh.chickenPeople.brand.model.vo;

import java.io.Serializable;

public class Brand implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4211123053219988695L;

	
	private String brand_code;
	private String brand_pic;
	private String brand_name;
	public Brand() {
	}
	public Brand(String brand_code, String brand_pic, String brand_name) {
		this.brand_code = brand_code;
		this.brand_pic = brand_pic;
		this.brand_name = brand_name;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Brand [brand_code=" + brand_code + ", brand_pic=" + brand_pic + ", brand_name=" + brand_name + "]";
	}
	
	
	
}
