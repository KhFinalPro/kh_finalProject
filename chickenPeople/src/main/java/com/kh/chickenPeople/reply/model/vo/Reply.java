package com.kh.chickenPeople.reply.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reply  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2485726081396703170L;
	private int rep1_num; 
	private String user_id;
	private int b_num;
	private String rep_cont;
	private String rep_date;
	private Date rep_upDate;
	private String rep_status;
	
	
	public Reply() {
	}


	public Reply(int rep1_num, String user_id, int b_num, String rep_cont, String rep_date, Date rep_upDate,
			String rep_status) {
		this.rep1_num = rep1_num;
		this.user_id = user_id;
		this.b_num = b_num;
		this.rep_cont = rep_cont;
		this.rep_date = rep_date;
		this.rep_upDate = rep_upDate;
		this.rep_status = rep_status;
	}


	public int getRep1_num() {
		return rep1_num;
	}


	public void setRep1_num(int rep1_num) {
		this.rep1_num = rep1_num;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getB_num() {
		return b_num;
	}


	public void setB_num(int b_num) {
		this.b_num = b_num;
	}


	public String getRep_cont() {
		return rep_cont;
	}


	public void setRep_cont(String rep_cont) {
		this.rep_cont = rep_cont;
	}


	public String getRep_date() {
		return rep_date;
	}


	public void setRep_date(String rep_date) {
		this.rep_date = rep_date;
	}


	public Date getRep_upDate() {
		return rep_upDate;
	}


	public void setRep_upDate(Date rep_upDate) {
		this.rep_upDate = rep_upDate;
	}


	public String getRep_status() {
		return rep_status;
	}


	public void setRep_status(String rep_status) {
		this.rep_status = rep_status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Reply [rep1_num=" + rep1_num + ", user_id=" + user_id + ", b_num=" + b_num + ", rep_cont=" + rep_cont
				+ ", rep_date=" + rep_date + ", rep_upDate=" + rep_upDate + ", rep_status=" + rep_status + "]";
	}
	
	
	
	
}
