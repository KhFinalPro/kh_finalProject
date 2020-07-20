package com.kh.chickenPeople.tag.model.vo;

import java.io.Serializable;

public class Tag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7563596405450044485L;

	private int tag_num;
	private String tag_name;
	public Tag() {
	}
	public Tag(int tag_num, String tag_name) {
		this.tag_num = tag_num;
		this.tag_name = tag_name;
	}
	public int getTag_num() {
		return tag_num;
	}
	public void setTag_num(int tag_num) {
		this.tag_num = tag_num;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Tag [tag_num=" + tag_num + ", tag_name=" + tag_name + "]";
	}
	
	
}
