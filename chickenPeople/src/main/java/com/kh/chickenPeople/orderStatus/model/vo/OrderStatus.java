package com.kh.chickenPeople.orderStatus.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class OrderStatus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8976436174139922772L;
	
	
	private String ord_num;
	private String pay_date;
	private String pay_addr;
	private String pay_toal;
	private String ord_status;
	
	private int sto_num;
	private int menu_num;
	private String brand_code;
	private int mord_num;
	private String menu_name;
	private int menu_price;
	private String menu_pic;
	private String brand_pic;
	private String sto_addr;
	private double sto_lat;
	private double sto_lng;
	private double lat;
	private double lng;
	public OrderStatus() {
		super();
	}
	public OrderStatus(String ord_num, String pay_date, String pay_addr, String pay_toal, String ord_status, int sto_num,
			int menu_num, String brand_code, int mord_num, String menu_name, int menu_price, String menu_pic,
			String brand_pic, String sto_addr, double sto_lat, double sto_lng, double lat, double lng) {
		super();
		this.ord_num = ord_num;
		this.pay_date = pay_date;
		this.pay_addr = pay_addr;
		this.pay_toal = pay_toal;
		this.ord_status = ord_status;
		this.sto_num = sto_num;
		this.menu_num = menu_num;
		this.brand_code = brand_code;
		this.mord_num = mord_num;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_pic = menu_pic;
		this.brand_pic = brand_pic;
		this.sto_addr = sto_addr;
		this.sto_lat = sto_lat;
		this.sto_lng = sto_lng;
		this.lat = lat;
		this.lng = lng;
	}
	public String getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(String ord_num) {
		this.ord_num = ord_num;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_addr() {
		return pay_addr;
	}
	public void setPay_addr(String pay_addr) {
		this.pay_addr = pay_addr;
	}
	public String getPay_toal() {
		return pay_toal;
	}
	public void setPay_toal(String pay_toal) {
		this.pay_toal = pay_toal;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
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
	public int getMord_num() {
		return mord_num;
	}
	public void setMord_num(int mord_num) {
		this.mord_num = mord_num;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_pic() {
		return menu_pic;
	}
	public void setMenu_pic(String menu_pic) {
		this.menu_pic = menu_pic;
	}
	public String getBrand_pic() {
		return brand_pic;
	}
	public void setBrand_pic(String brand_pic) {
		this.brand_pic = brand_pic;
	}
	public String getSto_addr() {
		return sto_addr;
	}
	public void setSto_addr(String sto_addr) {
		this.sto_addr = sto_addr;
	}
	public double getSto_lat() {
		return sto_lat;
	}
	public void setSto_lat(double sto_lat) {
		this.sto_lat = sto_lat;
	}
	public double getSto_lng() {
		return sto_lng;
	}
	public void setSto_lng(double sto_lng) {
		this.sto_lng = sto_lng;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "OrderStatus [ord_num=" + ord_num + ", pay_date=" + pay_date + ", pay_addr=" + pay_addr + ", pay_toal="
				+ pay_toal + ", ord_status=" + ord_status + ", sto_num=" + sto_num + ", menu_num=" + menu_num
				+ ", brand_code=" + brand_code + ", mord_num=" + mord_num + ", menu_name=" + menu_name + ", menu_price="
				+ menu_price + ", menu_pic=" + menu_pic + ", brand_pic=" + brand_pic + ", sto_addr=" + sto_addr
				+ ", sto_lat=" + sto_lat + ", sto_lng=" + sto_lng + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
	
	
	

}
