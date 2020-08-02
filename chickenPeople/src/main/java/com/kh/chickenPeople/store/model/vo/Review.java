package com.kh.chickenPeople.store.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1418946079234961578L;

	private int rev_num;
	private int user_rev_rate;
	private double avg_rev_rate;
	private String rev_pic;
	private Date rev_date;
	private String rev_cont;
	private String rev_re;
	private String user_id;
	private String ord_num;
	
	private int sto_num;

	public Review() {
		super();
	}

	public Review(int rev_num, int user_rev_rate, double avg_rev_rate, String rev_pic, Date rev_date, String rev_cont,
			String rev_re, String user_id, String ord_num, int sto_num) {
		super();
		this.rev_num = rev_num;
		this.user_rev_rate = user_rev_rate;
		this.avg_rev_rate = avg_rev_rate;
		this.rev_pic = rev_pic;
		this.rev_date = rev_date;
		this.rev_cont = rev_cont;
		this.rev_re = rev_re;
		this.user_id = user_id;
		this.ord_num = ord_num;
		this.sto_num = sto_num;
	}

	public int getRev_num() {
		return rev_num;
	}

	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}

	public int getUser_rev_rate() {
		return user_rev_rate;
	}

	public void setUser_rev_rate(int user_rev_rate) {
		this.user_rev_rate = user_rev_rate;
	}

	public double getAvg_rev_rete() {
		return avg_rev_rate;
	}

	public void setAvg_rev_rete(double avg_rev_rate) {
		this.avg_rev_rate = avg_rev_rate;
	}

	public String getRev_pic() {
		return rev_pic;
	}

	public void setRev_pic(String rev_pic) {
		this.rev_pic = rev_pic;
	}

	public Date getRev_date() {
		return rev_date;
	}

	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}

	public String getRev_cont() {
		return rev_cont;
	}

	public void setRev_cont(String rev_cont) {
		this.rev_cont = rev_cont;
	}

	public String getRev_re() {
		return rev_re;
	}

	public void setRev_re(String rev_re) {
		this.rev_re = rev_re;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Review [rev_num=" + rev_num + ", user_rev_rate=" + user_rev_rate + ", avg_rev_rete=" + avg_rev_rate
				+ ", rev_pic=" + rev_pic + ", rev_date=" + rev_date + ", rev_cont=" + rev_cont + ", rev_re=" + rev_re
				+ ", user_id=" + user_id + ", ord_num=" + ord_num + ", sto_num=" + sto_num + "]";
	}

	
}
