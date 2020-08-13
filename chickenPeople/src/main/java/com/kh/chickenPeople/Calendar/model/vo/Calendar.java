package com.kh.chickenPeople.Calendar.model.vo;

import java.io.Serializable;

public class Calendar implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3412249856410709424L;

	//캘린더에 뿌릴 주문내역에 필요한 것
	private String ordNum; 		//주문번호
	private String ordStatus; 	//주문상태
	private String ordDate; 	//주문날짜
	private String userId;		//주문한 사람
	
	private int stoNum; 		//매장번호
	private int ordPrice; 		//주문 전체금액
	
	private int menuNum; 		//메뉴코드
	private String brandCode;	//브랜드코드
	private int mordNum;		//메뉴수량
	
	private String menuName;	//메뉴이름
	private String menuPrice; 	//메뉴가격
	
	private String brandName;	//브랜드이름
	private String stoName;		//매장이름
	
	
	//리뷰에 필요한것
	private int revNum;			//리뷰번호
	private int revRate;		//별점
	private String revPic;		//리뷰사진
	private String revDate;		//리뷰등록날짜
	private String revCont;		//리뷰내용
	private String revRe;		//리뷰답변
	

	
	
	
	public Calendar() {
		super();
	}





	public Calendar(String ordNum, String ordStatus, String ordDate, String userId, int stoNum, int ordPrice,
			int menuNum, String brandCode, int mordNum, String menuName, String menuPrice, String brandName,
			String stoName, int revNum, int revRate, String revPic, String revDate, String revCont, String revRe) {
		super();
		this.ordNum = ordNum;
		this.ordStatus = ordStatus;
		this.ordDate = ordDate;
		this.userId = userId;
		this.stoNum = stoNum;
		this.ordPrice = ordPrice;
		this.menuNum = menuNum;
		this.brandCode = brandCode;
		this.mordNum = mordNum;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.brandName = brandName;
		this.stoName = stoName;
		this.revNum = revNum;
		this.revRate = revRate;
		this.revPic = revPic;
		this.revDate = revDate;
		this.revCont = revCont;
		this.revRe = revRe;
	}





	public String getOrdNum() {
		return ordNum;
	}





	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}





	public String getOrdStatus() {
		return ordStatus;
	}





	public void setOrdStatus(String ordStatus) {
		this.ordStatus = ordStatus;
	}





	public String getOrdDate() {
		return ordDate;
	}





	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}





	public String getUserId() {
		return userId;
	}





	public void setUserId(String userId) {
		this.userId = userId;
	}





	public int getStoNum() {
		return stoNum;
	}





	public void setStoNum(int stoNum) {
		this.stoNum = stoNum;
	}





	public int getOrdPrice() {
		return ordPrice;
	}





	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}





	public int getMenuNum() {
		return menuNum;
	}





	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}





	public String getBrandCode() {
		return brandCode;
	}





	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}





	public int getMordNum() {
		return mordNum;
	}





	public void setMordNum(int mordNum) {
		this.mordNum = mordNum;
	}





	public String getMenuName() {
		return menuName;
	}





	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}





	public String getMenuPrice() {
		return menuPrice;
	}





	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}





	public String getBrandName() {
		return brandName;
	}





	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}





	public String getStoName() {
		return stoName;
	}





	public void setStoName(String stoName) {
		this.stoName = stoName;
	}





	public int getRevNum() {
		return revNum;
	}





	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}





	public int getRevRate() {
		return revRate;
	}





	public void setRevRate(int revRate) {
		this.revRate = revRate;
	}





	public String getRevPic() {
		return revPic;
	}





	public void setRevPic(String revPic) {
		this.revPic = revPic;
	}





	public String getRevDate() {
		return revDate;
	}





	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}





	public String getRevCont() {
		return revCont;
	}





	public void setRevCont(String revCont) {
		this.revCont = revCont;
	}





	public String getRevRe() {
		return revRe;
	}





	public void setRevRe(String revRe) {
		this.revRe = revRe;
	}





	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	@Override
	public String toString() {
		return "Calendar [ordNum=" + ordNum + ", ordStatus=" + ordStatus + ", ordDate=" + ordDate + ", userId=" + userId
				+ ", stoNum=" + stoNum + ", ordPrice=" + ordPrice + ", menuNum=" + menuNum + ", brandCode=" + brandCode
				+ ", mordNum=" + mordNum + ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", brandName="
				+ brandName + ", stoName=" + stoName + ", revNum=" + revNum + ", revRate=" + revRate + ", revPic="
				+ revPic + ", revDate=" + revDate + ", revCont=" + revCont + ", revRe=" + revRe + "]";
	}




	}
