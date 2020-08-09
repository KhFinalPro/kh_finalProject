package com.kh.chickenPeople.payment.model.vo;

import java.io.Serializable;

public class Jumun_detail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7689106223630119008L;

	private int menu_num;
	private String brand_code;
	private String ord_num;
	private int sto_num;
	private int mord_num;
	public Jumun_detail() {
	}
	public Jumun_detail(int menu_num, String brand_code, String ord_num, int sto_num, int mord_num) {
		this.menu_num = menu_num;
		this.brand_code = brand_code;
		this.ord_num = ord_num;
		this.sto_num = sto_num;
		this.mord_num = mord_num;
	}
	public int getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}
	public String getBrand_code() {
		return brand_code;
	}
	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
	}
	public String getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(String ord_num) {
		this.ord_num = ord_num;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}
	public int getMord_num() {
		return mord_num;
	}
	public void setMord_num(int mord_num) {
		this.mord_num = mord_num;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Jumun_detail [menu_num=" + menu_num + ", brand_code=" + brand_code + ", ord_num=" + ord_num
				+ ", sto_num=" + sto_num + ", mord_num=" + mord_num + "]";
	}
	
	
}
