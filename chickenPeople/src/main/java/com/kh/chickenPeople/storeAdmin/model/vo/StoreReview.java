package com.kh.chickenPeople.storeAdmin.model.vo;

import java.io.Serializable;

public class StoreReview implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4675253282098884386L;
	
	private int revNum;			//리뷰번호 - 공유
	private int revRate;		//별점      - 공유
	private String revPic;		//리뷰사진
	private String revDate;		//리뷰등록날짜
	private String revCont;		//리뷰내용
	private String revRe;		//리뷰답변
	private String userId;		//리뷰작성자
	private String ordNum; 		//리뷰-주문번호
	private String ordDate;		//주문날짜
	
	//매장리뷰테이블
	private int stoNum;			//매장번호
	
	//sto_info테이블
	private String stoId;		//매장고유아이디(테이블상 userId)
	
	
	//order_pro 테이블
	private int ordPrice; 		//전체 주문 금액
	
	
	//jumun_detail테이블
	private int menuNum;		//메뉴코드
	private int mordNum;		//메뉴수량
	
	//menu 테이블
	private String menuName;	//메뉴이름
	private int menuPrice;		//메뉴가격
	
	
	//메뉴 합치기
	private String realMenu;	//메뉴 리스트 합
	
	
	
	
	
	public StoreReview() {
		super();
	}





	public StoreReview(int revNum, int revRate, String revPic, String revDate, String revCont, String revRe,
			String userId, String ordNum, String ordDate, int stoNum, String stoId, int ordPrice, int menuNum,
			int mordNum, String menuName, int menuPrice, String realMenu) {
		super();
		this.revNum = revNum;
		this.revRate = revRate;
		this.revPic = revPic;
		this.revDate = revDate;
		this.revCont = revCont;
		this.revRe = revRe;
		this.userId = userId;
		this.ordNum = ordNum;
		this.ordDate = ordDate;
		this.stoNum = stoNum;
		this.stoId = stoId;
		this.ordPrice = ordPrice;
		this.menuNum = menuNum;
		this.mordNum = mordNum;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.realMenu = realMenu;
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





	public String getUserId() {
		return userId;
	}





	public void setUserId(String userId) {
		this.userId = userId;
	}





	public String getOrdNum() {
		return ordNum;
	}





	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}





	public String getOrdDate() {
		return ordDate;
	}





	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}





	public int getStoNum() {
		return stoNum;
	}





	public void setStoNum(int stoNum) {
		this.stoNum = stoNum;
	}





	public String getStoId() {
		return stoId;
	}





	public void setStoId(String stoId) {
		this.stoId = stoId;
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





	public int getMenuPrice() {
		return menuPrice;
	}





	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}





	public String getRealMenu() {
		return realMenu;
	}





	public void setRealMenu(String realMenu) {
		this.realMenu = realMenu;
	}





	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	@Override
	public String toString() {
		return "StoreReview [revNum=" + revNum + ", revRate=" + revRate + ", revPic=" + revPic + ", revDate=" + revDate
				+ ", revCont=" + revCont + ", revRe=" + revRe + ", userId=" + userId + ", ordNum=" + ordNum
				+ ", ordDate=" + ordDate + ", stoNum=" + stoNum + ", stoId=" + stoId + ", ordPrice=" + ordPrice
				+ ", menuNum=" + menuNum + ", mordNum=" + mordNum + ", menuName=" + menuName + ", menuPrice="
				+ menuPrice + ", realMenu=" + realMenu + "]";
	}


	
	
}


