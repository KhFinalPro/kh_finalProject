package com.kh.chickenPeople.systemAdmin.model.vo;

import java.io.Serializable;

public class Coupon implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6589617009024817307L;
	
	
	private String coup_serial;	//쿠폰분류번호
	private String coup_name;	//쿠폰이름
	private String coup_cont;	//쿠폰내용
	private int coup_term;		//쿠폰기간
	private int coup_disc;		//할인금액
	private String coup_pic;	//쿠폰사진
	public Coupon() {
	}
	public Coupon(String coup_serial, String coup_name, String coup_cont, int coup_term, int coup_disc,
			String coup_pic) {
		this.coup_serial = coup_serial;
		this.coup_name = coup_name;
		this.coup_cont = coup_cont;
		this.coup_term = coup_term;
		this.coup_disc = coup_disc;
		this.coup_pic = coup_pic;
	}
	public String getCoup_serial() {
		return coup_serial;
	}
	public void setCoup_serial(String coup_serial) {
		this.coup_serial = coup_serial;
	}
	public String getCoup_name() {
		return coup_name;
	}
	public void setCoup_name(String coup_name) {
		this.coup_name = coup_name;
	}
	public String getCoup_cont() {
		return coup_cont;
	}
	public void setCoup_cont(String coup_cont) {
		this.coup_cont = coup_cont;
	}
	public int getCoup_term() {
		return coup_term;
	}
	public void setCoup_term(int coup_term) {
		this.coup_term = coup_term;
	}
	public int getCoup_disc() {
		return coup_disc;
	}
	public void setCoup_disc(int coup_disc) {
		this.coup_disc = coup_disc;
	}
	public String getCoup_pic() {
		return coup_pic;
	}
	public void setCoup_pic(String coup_pic) {
		this.coup_pic = coup_pic;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Coupon [coup_serial=" + coup_serial + ", coup_name=" + coup_name + ", coup_cont=" + coup_cont
				+ ", coup_term=" + coup_term + ", coup_disc=" + coup_disc + ", coup_pic=" + coup_pic + "]";
	}
	
	

}
