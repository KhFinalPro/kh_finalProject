package com.kh.chickenPeople.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable{

	
	private static final long serialVersionUID = 8398868683002324124L;
	
	private int msgNo;
	private String sendId;
	private String rcvId;
	private String sendDate;
	private String msgTitle;
	private String msgContents;
	private String msgStatus;
	
	
	
	
	
	public Message() {
		super();
	}





	public Message(int msgNo, String sendId, String rcvId, String sendDate, String msgTitle, String msgContents,
			String msgStatus) {
		super();
		this.msgNo = msgNo;
		this.sendId = sendId;
		this.rcvId = rcvId;
		this.sendDate = sendDate;
		this.msgTitle = msgTitle;
		this.msgContents = msgContents;
		this.msgStatus = msgStatus;
	}





	public int getMsgNo() {
		return msgNo;
	}





	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}





	public String getSendId() {
		return sendId;
	}





	public void setSendId(String sendId) {
		this.sendId = sendId;
	}





	public String getRcvId() {
		return rcvId;
	}





	public void setRcvId(String rcvId) {
		this.rcvId = rcvId;
	}





	public String getSendDate() {
		return sendDate;
	}





	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}





	public String getMsgTitle() {
		return msgTitle;
	}





	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}





	public String getMsgContents() {
		return msgContents;
	}





	public void setMsgContents(String msgContents) {
		this.msgContents = msgContents;
	}





	public String getMsgStatus() {
		return msgStatus;
	}





	public void setMsgStatus(String msgStatus) {
		this.msgStatus = msgStatus;
	}





	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", sendId=" + sendId + ", rcvId=" + rcvId + ", sendDate=" + sendDate
				+ ", msgTitle=" + msgTitle + ", msgContents=" + msgContents + ", msgStatus=" + msgStatus + "]";
	}





	
	
	
	
	

}
