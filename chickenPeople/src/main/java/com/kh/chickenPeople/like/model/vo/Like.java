package com.kh.chickenPeople.like.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Like implements Serializable{


	private static final long serialVersionUID = 3174541755977138276L;
	
	
	//���Ѹ���
	private String userId;  	//ȸ�����̵� or 
	private int storeNo;  		//�����ȣ
	private String brandPic;	//�������
	private String stoBrand; 	//�귣���
	private String stoName;		//�����̸�
	private String ordLimit; 	//�ּ��ֹ��ݾ�
	private int revRate;		//���亰��
	private double dailyTReview;   //1�������հ�
	private String brandCode; 	//�귣���ڵ�
	
	//���ѱ�
	private int bNum;			//���߾� ��ȣ
	private String bWriter;		//���߾� �ۼ���
	private String bTitle;		//���߾� Ÿ��Ʋ
	private String bCont;		//���߾� ����
	private Date bDate;			//�ۼ���¥
	
	
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
