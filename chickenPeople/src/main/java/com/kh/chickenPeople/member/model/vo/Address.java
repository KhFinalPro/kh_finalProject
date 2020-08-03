package com.kh.chickenPeople.member.model.vo;

import java.io.Serializable;

public class Address implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3716531772814019326L;

	private int addr_num;
	private String user_id;
	private String post_code;
	private String address;
	private double lat;
	private double lng;
	public Address() {
	}
	public Address(int addr_num, String user_id, String post_code, String address, double lat, double lng) {
		super();
		this.addr_num = addr_num;
		this.user_id = user_id;
		this.post_code = post_code;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
	}
	
	
	public Address(String user_id, String post_code, String address, double lat, double lng) {
		super();
		this.user_id = user_id;
		this.post_code = post_code;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
	}
	public int getAddr_num() {
		return addr_num;
	}
	public void setAddr_num(int addr_num) {
		this.addr_num = addr_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
		return "Address [addr_num=" + addr_num + ", user_id=" + user_id + ", post_code=" + post_code + ", address="
				+ address + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
	
}
