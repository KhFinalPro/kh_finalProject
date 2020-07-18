package com.kh.chickenPeople.like.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Like implements Serializable{


	private static final long serialVersionUID = 3174541755977138276L;
	
	
	//찜한매장
	private String userId;  	//회원 or 매장(?)
	private int storeNo;  		//매장넘버
	private String brandPic;	//브랜드사진
	private String stoBrand; 	//브랜드
	private String stoName;		//매장이름
	private String ordLimit; 	//최소금액
	private int revRate;		//별점
	private double dailyTReview;   //1일평점
	private String brandCode; 	//브랜드코드
	
	//찜한 글
	private int bNum;			//맛잘알번호
	private String bWriter;		//작성자
	private String bTitle;		//맛잘알 제목
	private String bCont;		//맛잘알 내용
	private Date bDate;			//작성일
	
	
	/****************************************/
	
	
	
	
	public Like(String userId, int storeNo, String brandPic, String stoBrand, String stoName, String ordLimit,
			int revRate, double dailyTReview, String brandCode) {
		super();
		this.userId = userId;
		this.storeNo = storeNo;
		this.brandPic = brandPic;
		this.stoBrand = stoBrand;
		this.stoName = stoName;
		this.ordLimit = ordLimit;
		this.revRate = revRate;
		this.dailyTReview = dailyTReview;
		this.brandCode = brandCode;
	}

	
	

	public Like(int bNum, String bWriter, String bTitle, String bCont, Date bDate) {
		super();
		this.bNum = bNum;
		this.bWriter = bWriter;
		this.bTitle = bTitle;
		this.bCont = bCont;
		this.bDate = bDate;
	}




	public Like() {
		super();
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getStoreNo() {
		return storeNo;
	}


	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}


	public String getBrandPic() {
		return brandPic;
	}


	public void setBrandPic(String brandPic) {
		this.brandPic = brandPic;
	}


	public String getStoBrand() {
		return stoBrand;
	}


	public void setStoBrand(String stoBrand) {
		this.stoBrand = stoBrand;
	}


	public String getStoName() {
		return stoName;
	}


	public void setStoName(String stoName) {
		this.stoName = stoName;
	}


	public String getOrdLimit() {
		return ordLimit;
	}


	public void setOrdLimit(String ordLimit) {
		this.ordLimit = ordLimit;
	}


	public int getRevRate() {
		return revRate;
	}


	public void setRevRate(int revRate) {
		this.revRate = revRate;
	}


	public double getDailyTReview() {
		return dailyTReview;
	}


	public void setDailyTReview(double dailyTReview) {
		this.dailyTReview = dailyTReview;
	}


	public String getBrandCode() {
		return brandCode;
	}


	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
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




	public Date getbDate() {
		return bDate;
	}




	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}




	@Override
	public String toString() {
		return "Like [userId=" + userId + ", storeNo=" + storeNo + ", brandPic=" + brandPic + ", stoBrand=" + stoBrand
				+ ", stoName=" + stoName + ", ordLimit=" + ordLimit + ", revRate=" + revRate + ", dailyTReview="
				+ dailyTReview + ", brandCode=" + brandCode + ", bNum=" + bNum + ", bWriter=" + bWriter + ", bTitle="
				+ bTitle + ", bCont=" + bCont + ", bDate=" + bDate + "]";
	}




	
	
	
	
	
	
	
	







	
 
	
	

	
	
	
}
