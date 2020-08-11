package com.kh.chickenPeople.chat.model.vo;

import java.io.Serializable;

public class ChattingMsg implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1836784940476220156L;

	private String chatMsg_no;
	private String chattingRoom_no;
	private String chat_msg;
	private String talker;
	private String send_time;
	public ChattingMsg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChattingMsg(String chatMsg_no, String chattingRoom_no, String chat_msg, String talker, String send_time) {
		super();
		this.chatMsg_no = chatMsg_no;
		this.chattingRoom_no = chattingRoom_no;
		this.chat_msg = chat_msg;
		this.talker = talker;
		this.send_time = send_time;
	}
	public String getChatMsg_no() {
		return chatMsg_no;
	}
	public void setChatMsg_no(String chatMsg_no) {
		this.chatMsg_no = chatMsg_no;
	}
	public String getChattingRoom_no() {
		return chattingRoom_no;
	}
	public void setChattingRoom_no(String chattingRoom_no) {
		this.chattingRoom_no = chattingRoom_no;
	}
	public String getChat_msg() {
		return chat_msg;
	}
	public void setChat_msg(String chat_msg) {
		this.chat_msg = chat_msg;
	}
	public String getTalker() {
		return talker;
	}
	public void setTalker(String talker) {
		this.talker = talker;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ChattingMsg [chatMsg_no=" + chatMsg_no + ", chattingRoom_no=" + chattingRoom_no + ", chat_msg="
				+ chat_msg + ", talker=" + talker + ", send_time=" + send_time + "]";
	}
	
	
}
