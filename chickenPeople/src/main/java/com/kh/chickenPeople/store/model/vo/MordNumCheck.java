package com.kh.chickenPeople.store.model.vo;

import java.io.Serializable;

public class MordNumCheck implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2380213278338725311L;

	private int jumund_num;
	private int menu_num;
	private String menu_name;
	private int price;
	private int mord_num;
	public MordNumCheck() {
	}
	public MordNumCheck(int jumund_num, int menu_num, String menu_name, int price, int mord_num) {
		this.jumund_num = jumund_num;
		this.menu_num = menu_num;
		this.menu_name = menu_name;
		this.price = price;
		this.mord_num = mord_num;
	}
	
	public MordNumCheck(int menu_num, int price, String menu_name) {
		this.menu_num = menu_num;
		this.menu_name = menu_name;
		this.price = price;
	}
	public int getJumund_num() {
		return jumund_num;
	}
	public void setJumund_num(int jumund_num) {
		this.jumund_num = jumund_num;
	}
	public int getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
		return "MordNumCheck [jumund_num=" + jumund_num + ", menu_num=" + menu_num + ", menu_name=" + menu_name
				+ ", price=" + price + ", mord_num=" + mord_num + "]";
	}
	
	
	
}
