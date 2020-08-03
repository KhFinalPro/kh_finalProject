package com.kh.chickenPeople.systemAdmin.model.vo;

import java.io.Serializable;

public class BrandTotal implements Serializable {

	private static final long serialVersionUID = -4271693375982264666L;

	private String brandCode;			//브랜드 별
	private int payTotal;				//매출총합
	public BrandTotal() {
		super();
	}
	public BrandTotal(String brandCode, int payTotal) {
		super();
		this.brandCode = brandCode;
		this.payTotal = payTotal;
	}
	public String getBrand_Code() {
		return brandCode;
	}
	public void setBrand_Code(String brandCode) {
		this.brandCode = brandCode;
	}
	public int getPayTotal() {
		return payTotal;
	}
	public void setPayTotal(int payTotal) {
		this.payTotal = payTotal;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "BrandTotal [brand_Code=" + brandCode + ", payTotal=" + payTotal + "]";
	}

	
}
