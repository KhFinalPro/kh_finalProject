package com.kh.chickenPeople.systemAdmin.model.vo;

import java.io.Serializable;

public class SiteTotal implements Serializable{

	private static final long serialVersionUID = 3102743983267329285L;

	private String pay_Date;
	private int pay_Total;
	public SiteTotal() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SiteTotal(String pay_Date, int pay_Total) {
		super();
		this.pay_Date = pay_Date;
		this.pay_Total = pay_Total;
	}
	public String getPay_Date() {
		return pay_Date;
	}
	public void setPay_Date(String pay_Date) {
		this.pay_Date = pay_Date;
	}
	public int getPay_Total() {
		return pay_Total;
	}
	public void setPay_Total(int pay_Total) {
		this.pay_Total = pay_Total;
	}
	@Override
	public String toString() {
		return "SiteTotal [pay_Date=" + pay_Date + ", pay_Total=" + pay_Total + "]";
	}
	
}
