package com.kh.chickenPeople.board.model.vo;

import java.sql.Date;

public class Board {
	
	public int bNum; 
	public String bWriter; 
	public String bCate; 
	public String bTitle; 
	public String bCont; 
	public int bHit; 
	public Date bDate; 
	public Date bDelDate; 
	public Date bUpDate; 
	public String bStatus;
	
	public Board() {
		super();
	}

	public Board(int bNum, String bWriter, String bCate, String bTitle, String bCont, int bHit, Date bDate,
			Date bDelDate, Date bUpDate, String bStatus) {
		super();
		this.bNum = bNum;
		this.bWriter = bWriter;
		this.bCate = bCate;
		this.bTitle = bTitle;
		this.bCont = bCont;
		this.bHit = bHit;
		this.bDate = bDate;
		this.bDelDate = bDelDate;
		this.bUpDate = bUpDate;
		this.bStatus = bStatus;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbCate() {
		return bCate;
	}

	public void setbCate(String bCate) {
		this.bCate = bCate;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbCont() {
		return bCont;
	}

	public void setbCont(String bCont) {
		this.bCont = bCont;
	}

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public Date getbDelDate() {
		return bDelDate;
	}

	public void setbDelDate(Date bDelDate) {
		this.bDelDate = bDelDate;
	}

	public Date getbUpDate() {
		return bUpDate;
	}

	public void setbUpDate(Date bUpDate) {
		this.bUpDate = bUpDate;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	@Override
	public String toString() {
		return "Board [bNum=" + bNum + ", bWriter=" + bWriter + ", bCate=" + bCate + ", bTitle=" + bTitle + ", bCont="
				+ bCont + ", bHit=" + bHit + ", bDate=" + bDate + ", bDelDate=" + bDelDate + ", bUpDate=" + bUpDate
				+ ", bStatus=" + bStatus + "]";
	} 
	
	
	
	
}
