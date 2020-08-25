package com.kh.chickenPeople.storeAdmin.storeInfo.model.vo;

import java.io.Serializable;

public class StoreInfo implements Serializable {

	
	private int stoNum;
	private String userPwd;
	private String stoName;
	private String stoTel;
	private String stoOpen;
	private String stoClose;
	private String stoAddr;
	private String stoIntro;
	private String ordLimit;
	private String deliTime;
	private String enterYN;
	private String ceoName;
	private String deliver;
	private String stoEmail;
	private String applyStatus;
	private String userId;
	private String brandCode;
	private String openYN;
	private String brandName;
	private String brandPic;

	
	
	
	public StoreInfo() {
		super();
	}




	public StoreInfo(int stoNum, String userPwd, String stoName, String stoTel, String stoOpen, String stoClose,
			String stoAddr, String stoIntro, String ordLimit, String deliTime, String enterYN, String ceoName,
			String deliver, String stoEmail, String applyStatus, String userId, String brandCode, String openYN,
			String brandName, String brandPic) {
		super();
		this.stoNum = stoNum;
		this.userPwd = userPwd;
		this.stoName = stoName;
		this.stoTel = stoTel;
		this.stoOpen = stoOpen;
		this.stoClose = stoClose;
		this.stoAddr = stoAddr;
		this.stoIntro = stoIntro;
		this.ordLimit = ordLimit;
		this.deliTime = deliTime;
		this.enterYN = enterYN;
		this.ceoName = ceoName;
		this.deliver = deliver;
		this.stoEmail = stoEmail;
		this.applyStatus = applyStatus;
		this.userId = userId;
		this.brandCode = brandCode;
		this.openYN = openYN;
		this.brandName = brandName;
		this.brandPic = brandPic;
	}




	public int getStoNum() {
		return stoNum;
	}




	public void setStoNum(int stoNum) {
		this.stoNum = stoNum;
	}




	public String getUserPwd() {
		return userPwd;
	}




	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}




	public String getStoName() {
		return stoName;
	}




	public void setStoName(String stoName) {
		this.stoName = stoName;
	}




	public String getStoTel() {
		return stoTel;
	}




	public void setStoTel(String stoTel) {
		this.stoTel = stoTel;
	}




	public String getStoOpen() {
		return stoOpen;
	}




	public void setStoOpen(String stoOpen) {
		this.stoOpen = stoOpen;
	}




	public String getStoClose() {
		return stoClose;
	}




	public void setStoClose(String stoClose) {
		this.stoClose = stoClose;
	}




	public String getStoAddr() {
		return stoAddr;
	}




	public void setStoAddr(String stoAddr) {
		this.stoAddr = stoAddr;
	}




	public String getStoIntro() {
		return stoIntro;
	}




	public void setStoIntro(String stoIntro) {
		this.stoIntro = stoIntro;
	}




	public String getOrdLimit() {
		return ordLimit;
	}




	public void setOrdLimit(String ordLimit) {
		this.ordLimit = ordLimit;
	}




	public String getDeliTime() {
		return deliTime;
	}




	public void setDeliTime(String deliTime) {
		this.deliTime = deliTime;
	}




	public String getEnterYN() {
		return enterYN;
	}




	public void setEnterYN(String enterYN) {
		this.enterYN = enterYN;
	}




	public String getCeoName() {
		return ceoName;
	}




	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}




	public String getDeliver() {
		return deliver;
	}




	public void setDeliver(String deliver) {
		this.deliver = deliver;
	}




	public String getStoEmail() {
		return stoEmail;
	}




	public void setStoEmail(String stoEmail) {
		this.stoEmail = stoEmail;
	}




	public String getApplyStatus() {
		return applyStatus;
	}




	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public String getBrandCode() {
		return brandCode;
	}




	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}




	public String getOpenYN() {
		return openYN;
	}




	public void setOpenYN(String openYN) {
		this.openYN = openYN;
	}




	public String getBrandName() {
		return brandName;
	}




	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}




	public String getBrandPic() {
		return brandPic;
	}




	public void setBrandPic(String brandPic) {
		this.brandPic = brandPic;
	}




	@Override
	public String toString() {
		return "StoreInfo [stoNum=" + stoNum + ", userPwd=" + userPwd + ", stoName=" + stoName + ", stoTel=" + stoTel
				+ ", stoOpen=" + stoOpen + ", stoClose=" + stoClose + ", stoAddr=" + stoAddr + ", stoIntro=" + stoIntro
				+ ", ordLimit=" + ordLimit + ", deliTime=" + deliTime + ", enterYN=" + enterYN + ", ceoName=" + ceoName
				+ ", deliver=" + deliver + ", stoEmail=" + stoEmail + ", applyStatus=" + applyStatus + ", userId="
				+ userId + ", brandCode=" + brandCode + ", openYN=" + openYN + ", brandName=" + brandName
				+ ", brandPic=" + brandPic + "]";
	}




	
	
}
