package com.kh.chickenPeople.bung.model.vo;

import java.io.Serializable;
import java.util.Arrays;

public class BungTag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5290740683585921524L;

	private int bung_num;
	private String user_id;
	private int tag_num;
	public BungTag() {
	}
	public BungTag(int bung_num, String user_id, int tag_num) {
		this.bung_num = bung_num;
		this.user_id = user_id;
		this.tag_num = tag_num;
	}
	public int getBung_num() {
		return bung_num;
	}
	public void setBung_num(int bung_num) {
		this.bung_num = bung_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTag_num() {
		return tag_num;
	}
	public void setTag_num(int tag_num) {
		this.tag_num = tag_num;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "BungTag [bung_num=" + bung_num + ", user_id=" + user_id + ", tag_num=" + tag_num + "]";
	}
	
	
	
}
