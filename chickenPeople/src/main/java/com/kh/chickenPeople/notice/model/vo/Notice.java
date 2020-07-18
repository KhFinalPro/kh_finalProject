package com.kh.chickenPeople.notice.model.vo;

import java.sql.Date;

public class Notice {

	
	
	public int nNum;      //공지사항번호
	public String nTitle; //제목
	public String nCont;  //게시판내용
	public String userId; //작성자
	public int nCount; 	  //조회수
	public Date nDate; 	  //게시날짜
	public Date nDelDate; //삭제날짜
	public Date nUpDate;  //수정날짜
	public String nStatus;//삭제여부
	
	public Notice() {
		super();
	}

	public Notice(int nNum, String nTitle, String nCont, String userId, int nCount, Date nDate, Date nDelDate,
			Date nUpDate, String nStatus) {
		super();
		this.nNum = nNum;
		this.nTitle = nTitle;
		this.nCont = nCont;
		this.userId = userId;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
		return "Notice [nNum=" + nNum + ", nTitle=" + nTitle + ", nCont=" + nCont + ", userId=" + userId + ", nCount="
				+ nCount + ", nDate=" + nDate + ", nDelDate=" + nDelDate + ", nUpDate=" + nUpDate + ", nStatus="
				+ nStatus + "]";
	}

	
	
}
