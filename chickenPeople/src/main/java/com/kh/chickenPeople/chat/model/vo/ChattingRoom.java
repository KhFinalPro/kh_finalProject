package com.kh.chickenPeople.chat.model.vo;

import java.io.Serializable;

public class ChattingRoom implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3330449082950031164L;
	
	private int chattingRoom_no;
	private String client_name;
	
	public ChattingRoom() {}

	public ChattingRoom(int chattingRoom_no, String client_name) {
		super();
		this.chattingRoom_no = chattingRoom_no;
		this.client_name = client_name;
	}

	public int getChattingRoom_no() {
		return chattingRoom_no;
	}

	public void setChattingRoom_no(int chattingRoom_no) {
		this.chattingRoom_no = chattingRoom_no;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	@Override
	public String toString() {
		return "ChattingRoom [chattingRoom_no=" + chattingRoom_no + ", client_name=" + client_name + "]";
	}

	
	
}
