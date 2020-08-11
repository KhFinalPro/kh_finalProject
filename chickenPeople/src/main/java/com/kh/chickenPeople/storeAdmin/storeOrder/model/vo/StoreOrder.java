package com.kh.chickenPeople.storeAdmin.storeOrder.model.vo;

import java.io.Serializable;

public class StoreOrder implements Serializable {
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6258105550120534377L;
	
	private String ordNum;
	private String payDate;
	private String payRcv;
	private String payMsg;
	private int payToal;
	private String userId;
	private String payMethod;
	
	private int menuNum;
	private String menuName;
	private int menuPrice;
	private String ordStatus;
	
	private String stoNum;
	
	private String realMenu; //메뉴리스트 합

	
	

	public StoreOrder() {
		super();
	}




	public StoreOrder(String ordNum, String payDate, String payRcv, String payMsg, int payToal, String userId,
			String payMethod, int menuNum, String menuName, int menuPrice, String ordStatus, String stoNum,
			String realMenu) {
		super();
		this.ordNum = ordNum;
		this.payDate = payDate;
		this.payRcv = payRcv;
		this.payMsg = payMsg;
		this.payToal = payToal;
		this.userId = userId;
		this.payMethod = payMethod;
		this.menuNum = menuNum;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.ordStatus = ordStatus;
		this.stoNum = stoNum;
		this.realMenu = realMenu;
	}




	public String getOrdNum() {
		return ordNum;
	}




	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}




	public String getPayDate() {
		return payDate;
	}




	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}




	public String getPayRcv() {
		return payRcv;
	}




	public void setPayRcv(String payRcv) {
		this.payRcv = payRcv;
	}




	public String getPayMsg() {
		return payMsg;
	}




	public void setPayMsg(String payMsg) {
		this.payMsg = payMsg;
	}




	public int getPayToal() {
		return payToal;
	}




	public void setPayToal(int payToal) {
		this.payToal = payToal;
	}




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public String getPayMethod() {
		return payMethod;
	}




	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}




	public int getMenuNum() {
		return menuNum;
	}




	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
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




	public String getOrdStatus() {
		return ordStatus;
	}




	public void setOrdStatus(String ordStatus) {
		this.ordStatus = ordStatus;
	}




	public String getStoNum() {
		return stoNum;
	}




	public void setStoNum(String stoNum) {
		this.stoNum = stoNum;
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
		return "StoreOrder [ordNum=" + ordNum + ", payDate=" + payDate + ", payRcv=" + payRcv + ", payMsg=" + payMsg
				+ ", payToal=" + payToal + ", userId=" + userId + ", payMethod=" + payMethod + ", menuNum=" + menuNum
				+ ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", ordStatus=" + ordStatus + ", stoNum="
				+ stoNum + ", realMenu=" + realMenu + "]";
	}




	




}
