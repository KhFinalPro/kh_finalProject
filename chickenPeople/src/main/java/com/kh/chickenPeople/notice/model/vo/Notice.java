package com.kh.chickenPeople.notice.model.vo;

import java.sql.Date;

public class Notice {

	public int nNum;	   //공지번호
	public String userId;  //아이디
	public String nTitle;  //공지제목
	public String nCont;   //공지사항내용
	public String nWriter; //작성자
	public int nCount; 	   //조회수
	public Date nDate; 	   //작성날짜
	public Date nDelDate;  //삭제날짜
	public Date nUpDate;   //수정날짜
	public String nStatus; //삭제 여부

	
	public Notice() {
		super();
	}

	public Notice(int nNum, String userId, String nTitle, String nCont, String nWriter, int nCount, Date nDate,
			Date nDelDate, Date nUpDate, String nStatus) {
		super();
		this.nNum = nNum;
		this.userId = userId;
		this.nTitle = nTitle;
		this.nCont = nCont;
		this.nWriter = nWriter;
		this.nCount = nCount;
		this.nDate = nDate;
		this.nDelDate = nDelDate;
		this.nUpDate = nUpDate;
		this.nStatus = nStatus;
	}

	public int getnNum() {
		return nNum;
	}

	public void setnNum(int nNum) {
		this.nNum = nNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnCont() {
		return nCont;
	}

	public void setnCont(String nCont) {
		this.nCont = nCont;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public Date getnDelDate() {
		return nDelDate;
	}

	public void setnDelDate(Date nDelDate) {
		this.nDelDate = nDelDate;
	}

	public Date getnUpDate() {
		return nUpDate;
	}

	public void setnUpDate(Date nUpDate) {
		this.nUpDate = nUpDate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nNum=" + nNum + ", userId=" + userId + ", nTitle=" + nTitle + ", nCont=" + nCont + ", nWriter="
				+ nWriter + ", nCount=" + nCount + ", nDate=" + nDate + ", nDelDate=" + nDelDate + ", nUpDate="
				+ nUpDate + ", nStatus=" + nStatus + "]";
	}
	
	
	
}
