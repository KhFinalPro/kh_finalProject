package com.kh.chickenPeople.brand.model.vo;

import java.io.Serializable;

public class Brand implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4211123053219988695L;

	
	private String brand_code;
	private String brand_pic;
	private String sto_brand;
	public Brand() {
	}
	public Brand(String brand_code, String brand_pic, String sto_brand) {
		this.brand_code = brand_code;
		this.brand_pic = brand_pic;
		this.sto_brand = sto_brand;
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
	public String getSto_brand() {
		return sto_brand;
	}
	public void setSto_brand(String sto_brand) {
		this.sto_brand = sto_brand;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Brand [brand_code=" + brand_code + ", brand_pic=" + brand_pic + ", sto_brand=" + sto_brand + "]";
	}
	
	
}
