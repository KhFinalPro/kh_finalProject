package com.kh.chickenPeople.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Jumun implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -441671975932941588L;
	
	private String ord_num;
	private String ord_status;
	private Date ord_date;
	private String ord_cencel;
	private String pay_status;
	private String user_id;
	public Jumun() {
		super();
	}
	public Jumun(String ord_num, String ord_status, Date ord_date, String ord_cencel, String pay_status,
			String user_id) {
		super();
		this.ord_num = ord_num;
		this.ord_status = ord_status;
		this.ord_date = ord_date;
		this.ord_cencel = ord_cencel;
		this.pay_status = pay_status;
		this.user_id = user_id;
	}
	public String getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(String ord_num) {
		this.ord_num = ord_num;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_cencel() {
		return ord_cencel;
	}
	public void setOrd_cencel(String ord_cencel) {
		this.ord_cencel = ord_cencel;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Jumun [ord_num=" + ord_num + ", ord_status=" + ord_status + ", ord_date=" + ord_date + ", ord_cencel="
				+ ord_cencel + ", pay_status=" + pay_status + ", user_id=" + user_id + "]";
	}
	
	

}
