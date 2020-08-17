package com.kh.chickenPeople.storeAdmin.dashboard.model.vo;

import java.io.Serializable;

public class Dashboard implements Serializable {


	private static final long serialVersionUID = 8052060633775029461L;

	
	private int ordPrice; //토탈금액
	private String stoNum; // 스토어넘버
	private String ordNum; // 오더넘버
	
	//전체매출, 전체주문건, 평균평점, 좋아요수, 누적 치킨 판매량
	private int totalIncome;
	private int totalOrder;
	private Double ageRate;
	private int stoLikes;
	private int totalChicken;
	
	//top3메뉴
	private int menuCount;
	private String menuName;
	private int menuNum;
	
	
	//월별매출
	private int customer; //커스터머수
	private String payDate; //페이 날짜
	private int payTotal; //페이 토탈
	
	//단골고객
	private int vipCount;
	private String vipName;
	private int rowNum;
	
	
	
	
	public Dashboard() {
		super();
	}




	public Dashboard(int ordPrice, String stoNum, String ordNum, int totalIncome, int totalOrder, Double ageRate,
			int stoLikes, int totalChicken, int menuCount, String menuName, int menuNum, int customer, String payDate,
			int payTotal, int vipCount, String vipName, int rowNum) {
		super();
		this.ordPrice = ordPrice;
		this.stoNum = stoNum;
		this.ordNum = ordNum;
		this.totalIncome = totalIncome;
		this.totalOrder = totalOrder;
		this.ageRate = ageRate;
		this.stoLikes = stoLikes;
		this.totalChicken = totalChicken;
		this.menuCount = menuCount;
		this.menuName = menuName;
		this.menuNum = menuNum;
		this.customer = customer;
		this.payDate = payDate;
		this.payTotal = payTotal;
		this.vipCount = vipCount;
		this.vipName = vipName;
		this.rowNum = rowNum;
	}




	public int getOrdPrice() {
		return ordPrice;
	}




	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}




	public String getStoNum() {
		return stoNum;
	}




	public void setStoNum(String stoNum) {
		this.stoNum = stoNum;
	}




	public String getOrdNum() {
		return ordNum;
	}




	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}




	public int getTotalIncome() {
		return totalIncome;
	}




	public void setTotalIncome(int totalIncome) {
		this.totalIncome = totalIncome;
	}




	public int getTotalOrder() {
		return totalOrder;
	}




	public void setTotalOrder(int totalOrder) {
		this.totalOrder = totalOrder;
	}




	public Double getAgeRate() {
		return ageRate;
	}




	public void setAgeRate(Double ageRate) {
		this.ageRate = ageRate;
	}




	public int getStoLikes() {
		return stoLikes;
	}




	public void setStoLikes(int stoLikes) {
		this.stoLikes = stoLikes;
	}




	public int getTotalChicken() {
		return totalChicken;
	}




	public void setTotalChicken(int totalChicken) {
		this.totalChicken = totalChicken;
	}




	public int getMenuCount() {
		return menuCount;
	}




	public void setMenuCount(int menuCount) {
		this.menuCount = menuCount;
	}




	public String getMenuName() {
		return menuName;
	}




	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}




	public int getMenuNum() {
		return menuNum;
	}




	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}




	public int getCustomer() {
		return customer;
	}




	public void setCustomer(int customer) {
		this.customer = customer;
	}




	public String getPayDate() {
		return payDate;
	}




	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}




	public int getPayTotal() {
		return payTotal;
	}




	public void setPayTotal(int payTotal) {
		this.payTotal = payTotal;
	}




	public int getVipCount() {
		return vipCount;
	}




	public void setVipCount(int vipCount) {
		this.vipCount = vipCount;
	}




	public String getVipName() {
		return vipName;
	}




	public void setVipName(String vipName) {
		this.vipName = vipName;
	}




	public int getRowNum() {
		return rowNum;
	}




	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	@Override
	public String toString() {
		return "Dashboard [ordPrice=" + ordPrice + ", stoNum=" + stoNum + ", ordNum=" + ordNum + ", totalIncome="
				+ totalIncome + ", totalOrder=" + totalOrder + ", ageRate=" + ageRate + ", stoLikes=" + stoLikes
				+ ", totalChicken=" + totalChicken + ", menuCount=" + menuCount + ", menuName=" + menuName
				+ ", menuNum=" + menuNum + ", customer=" + customer + ", payDate=" + payDate + ", payTotal=" + payTotal
				+ ", vipCount=" + vipCount + ", vipName=" + vipName + ", rowNum=" + rowNum + "]";
	}




	
}
