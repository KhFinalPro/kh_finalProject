package com.kh.chickenPeople.reply.model.vo;

import java.sql.Date;

public class ReReply {
	
	public int rep2Num;
	public int rep1Num; 
	public String userId; 
	public String repCont; 
	public Date repDate; 
	public Date repUpDate; 
	public String repStatus;
	
	public ReReply() {
		super();
	}

	public ReReply(int rep2Num, int rep1Num, String userId, String repCont, Date repDate, Date repUpDate,
			String repStatus) {
		super();
		this.rep2Num = rep2Num;
		this.rep1Num = rep1Num;
		this.userId = userId;
		this.repCont = repCont;
		this.repDate = repDate;
		this.repUpDate = repUpDate;
		this.repStatus = repStatus;
	}

	public int getRep2Num() {
		return rep2Num;
	}

	public void setRep2Num(int rep2Num) {
		this.rep2Num = rep2Num;
	}

	public int getRep1Num() {
		return rep1Num;
	}

	public void setRep1Num(int rep1Num) {
		this.rep1Num = rep1Num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRepCont() {
		return repCont;
	}

	public void setRepCont(String repCont) {
		this.repCont = repCont;
	}

	public Date getRepDate() {
		return repDate;
	}

	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

	public Date getRepUpDate() {
		return repUpDate;
	}

	public void setRepUpDate(Date repUpDate) {
		this.repUpDate = repUpDate;
	}

	public String getRepStatus() {
		return repStatus;
	}

	public void setRepStatus(String repStatus) {
		this.repStatus = repStatus;
	}

	@Override
	public String toString() {
		return "ReReply [rep2Num=" + rep2Num + ", rep1Num=" + rep1Num + ", userId=" + userId + ", repCont=" + repCont
				+ ", repDate=" + repDate + ", repUpDate=" + repUpDate + ", repStatus=" + repStatus + "]";
	} 
	
	
	
	
	
}
