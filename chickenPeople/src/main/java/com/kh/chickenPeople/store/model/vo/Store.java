package com.kh.chickenPeople.store.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Store implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2328263205656290008L;

	private int sto_num;
	private String sto_name;
	private String sto_tel;
	private Date sto_open;
	private Date sto_close;
	private String sto_addr;
	private String sto_intro;
	private String ord_limit;
	private String deli_time;
	private String enter_yn;
	private String open_yn;
	private String ceo_name;
	private String delivery;
	private String sto_email;
	private String aprv_status;
	private String brand_code;
	private String user_id;
	
	//브랜드관련
	private String brand_pic;
	private String sto_brand;
	public Store() {
	}
	public Store(int sto_num, String sto_name, String sto_tel, Date sto_open, Date sto_close, String sto_addr,
			String sto_intro, String ord_limit, String deli_time, String enter_yn, String open_yn, String ceo_name,
			String delivery, String sto_email, String aprv_status, String brand_code, String user_id, String brand_pic,
			String sto_brand) {
		this.sto_num = sto_num;
		this.sto_name = sto_name;
		this.sto_tel = sto_tel;
		this.sto_open = sto_open;
		this.sto_close = sto_close;
		this.sto_addr = sto_addr;
		this.sto_intro = sto_intro;
		this.ord_limit = ord_limit;
		this.deli_time = deli_time;
		this.enter_yn = enter_yn;
		this.open_yn = open_yn;
		this.ceo_name = ceo_name;
		this.delivery = delivery;
		this.sto_email = sto_email;
		this.aprv_status = aprv_status;
		this.brand_code = brand_code;
		this.user_id = user_id;
		this.brand_pic = brand_pic;
		this.sto_brand = sto_brand;
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
	public String getSto_tel() {
		return sto_tel;
	}
	public void setSto_tel(String sto_tel) {
		this.sto_tel = sto_tel;
	}
	public Date getSto_open() {
		return sto_open;
	}
	public void setSto_open(Date sto_open) {
		this.sto_open = sto_open;
	}
	public Date getSto_close() {
		return sto_close;
	}
	public void setSto_close(Date sto_close) {
		this.sto_close = sto_close;
	}
	public String getSto_addr() {
		return sto_addr;
	}
	public void setSto_addr(String sto_addr) {
		this.sto_addr = sto_addr;
	}
	public String getSto_intro() {
		return sto_intro;
	}
	public void setSto_intro(String sto_intro) {
		this.sto_intro = sto_intro;
	}
	public String getOrd_limit() {
		return ord_limit;
	}
	public void setOrd_limit(String ord_limit) {
		this.ord_limit = ord_limit;
	}
	public String getDeli_time() {
		return deli_time;
	}
	public void setDeli_time(String deli_time) {
		this.deli_time = deli_time;
	}
	public String getEnter_yn() {
		return enter_yn;
	}
	public void setEnter_yn(String enter_yn) {
		this.enter_yn = enter_yn;
	}
	public String getOpen_yn() {
		return open_yn;
	}
	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getSto_email() {
		return sto_email;
	}
	public void setSto_email(String sto_email) {
		this.sto_email = sto_email;
	}
	public String getAprv_status() {
		return aprv_status;
	}
	public void setAprv_status(String aprv_status) {
		this.aprv_status = aprv_status;
	}
	public String getBrand_code() {
		return brand_code;
	}
	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
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
		return "Store [sto_num=" + sto_num + ", sto_name=" + sto_name + ", sto_tel=" + sto_tel + ", sto_open="
				+ sto_open + ", sto_close=" + sto_close + ", sto_addr=" + sto_addr + ", sto_intro=" + sto_intro
				+ ", ord_limit=" + ord_limit + ", deli_time=" + deli_time + ", enter_yn=" + enter_yn + ", open_yn="
				+ open_yn + ", ceo_name=" + ceo_name + ", delivery=" + delivery + ", sto_email=" + sto_email
				+ ", aprv_status=" + aprv_status + ", brand_code=" + brand_code + ", user_id=" + user_id
				+ ", brand_pic=" + brand_pic + ", sto_brand=" + sto_brand + "]";
	}
}
