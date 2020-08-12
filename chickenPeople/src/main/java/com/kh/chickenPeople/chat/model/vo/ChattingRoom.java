package com.kh.chickenPeople.chat.model.vo;

import java.io.Serializable;

public class ChattingRoom implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3330449082950031164L;
	
	private String chattingRoom_no;
	private String client_name;
	private String client_id;
	private String cs_id;
	private String chat_status;
	
	
	public ChattingRoom() {}

	
	public ChattingRoom(String chattingRoom_no, String client_id) {
		super();
		this.chattingRoom_no = chattingRoom_no;
		this.client_id = client_id;
	}


	public ChattingRoom(String chattingRoom_no, String client_name, String cs_id) {
		super();
		this.chattingRoom_no = chattingRoom_no;
		this.client_name = client_name;
		this.cs_id = cs_id;
	}

	



	public ChattingRoom(String chattingRoom_no, String client_name, String client_id, String cs_id) {
		super();
		this.chattingRoom_no = chattingRoom_no;
		this.client_name = client_name;
		this.client_id = client_id;
		this.cs_id = cs_id;
	}

	

	public ChattingRoom(String chattingRoom_no, String client_name, String client_id, String cs_id,
			String chat_status) {
		super();
		this.chattingRoom_no = chattingRoom_no;
		this.client_name = client_name;
		this.client_id = client_id;
		this.cs_id = cs_id;
		this.chat_status = chat_status;
	}


	public String getChattingRoom_no() {
		return chattingRoom_no;
	}


	public void setChattingRoom_no(String chattingRoom_no) {
		this.chattingRoom_no = chattingRoom_no;
	}


	public String getClient_name() {
		return client_name;
	}


	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}


	public String getClient_id() {
		return client_id;
	}


	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}


	public String getCs_id() {
		return cs_id;
	}


	public void setCs_id(String cs_id) {
		this.cs_id = cs_id;
	}


	public String getChat_status() {
		return chat_status;
	}


	public void setChat_status(String chat_status) {
		this.chat_status = chat_status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "ChattingRoom [chattingRoom_no=" + chattingRoom_no + ", client_name=" + client_name + ", client_id="
				+ client_id + ", cs_id=" + cs_id + ", chat_status=" + chat_status + "]";
	}




	
	
	
	
	
}
