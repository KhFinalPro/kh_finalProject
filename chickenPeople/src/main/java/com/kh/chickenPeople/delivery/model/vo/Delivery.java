package com.kh.chickenPeople.delivery.model.vo;

import java.io.Serializable;

public class Delivery implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -902266985304354073L;

	private int sto_num;
	private String sto_name;
	private String sto_addr;
	private String ord_limit;
	private String open_yn;
	private String delivery;
	private String user_id;
	private String brand_pic;
	private int rev_rate;
	private String menu_name;
	private double sto_lat;
	private double sto_lng;
	private double distance_user;
	public Delivery() {
	}
	public Delivery(int sto_num, String sto_name, String sto_addr, String ord_limit, String open_yn, String delivery,
			String user_id, String brand_pic, int rev_rate, String menu_name, double sto_lat, double sto_lng,
			double distance_user) {
		super();
		this.sto_num = sto_num;
		this.sto_name = sto_name;
		this.sto_addr = sto_addr;
		this.ord_limit = ord_limit;
		this.open_yn = open_yn;
		this.delivery = delivery;
		this.user_id = user_id;
		this.brand_pic = brand_pic;
		this.rev_rate = rev_rate;
		this.menu_name = menu_name;
		this.sto_lat = sto_lat;
		this.sto_lng = sto_lng;
		this.distance_user = distance_user;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public String getSto_addr() {
		return sto_addr;
	}
	public void setSto_addr(String sto_addr) {
		this.sto_addr = sto_addr;
	}
	public String getOrd_limit() {
		return ord_limit;
	}
	public void setOrd_limit(String ord_limit) {
		this.ord_limit = ord_limit;
	}
	public String getOpen_yn() {
		return open_yn;
	}
	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBrand_pic() {
		return brand_pic;
	}
	public void setBrand_pic(String brand_pic) {
		this.brand_pic = brand_pic;
	}
	public int getRev_rate() {
		return rev_rate;
	}
	public void setRev_rate(int rev_rate) {
		this.rev_rate = rev_rate;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
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
	public double getDistance_user() {
		return distance_user;
	}
	public void setDistance_user(double distance_user) {
		this.distance_user = distance_user;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Delivery [sto_num=" + sto_num + ", sto_name=" + sto_name + ", sto_addr=" + sto_addr + ", ord_limit="
				+ ord_limit + ", open_yn=" + open_yn + ", delivery=" + delivery + ", user_id=" + user_id
				+ ", brand_pic=" + brand_pic + ", rev_rate=" + rev_rate + ", menu_name=" + menu_name + ", sto_lat="
				+ sto_lat + ", sto_lng=" + sto_lng + ", distance_user=" + distance_user + "]";
	}
	
	
	
}
