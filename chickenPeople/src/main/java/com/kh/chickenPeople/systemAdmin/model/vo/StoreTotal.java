package com.kh.chickenPeople.systemAdmin.model.vo;

import java.io.Serializable;

public class StoreTotal implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1198266112592670928L;

	private String sto_name;
	private String total_price;
	public StoreTotal() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreTotal(String sto_name, String total_price) {
		super();
		this.sto_name = sto_name;
		this.total_price = total_price;
	}
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	
	@Override
	public String toString() {
		return "StoreTotal [sto_name=" + sto_name + ", total_price=" + total_price + "]";
	}
	
	
}
