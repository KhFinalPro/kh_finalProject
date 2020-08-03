package com.kh.chickenPeople.board.model.vo;

public class Picture {

	private int picNum; 
	private String oriFileName; 
	private String upFileName;
	private int bNum; 
	private String bContent;
	
	public Picture() {
		super();
	}

	public Picture(int picNum, String oriFileName, String upFileName, int bNum, String bContent) {
		super();
		this.picNum = picNum;
		this.oriFileName = oriFileName;
		this.upFileName = upFileName;
		this.bNum = bNum;
		this.bContent = bContent;
	}

	public int getPicNum() {
		return picNum;
	}

	public void setPicNum(int picNum) {
		this.picNum = picNum;
	}

	public String getOriFileName() {
		return oriFileName;
	}

	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}

	public String getUpFileName() {
		return upFileName;
	}

	public void setUpFileName(String upFileName) {
		this.upFileName = upFileName;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	@Override
	public String toString() {
		return "Picture [picNum=" + picNum + ", oriFileName=" + oriFileName + ", upFileName=" + upFileName + ", bNum="
				+ bNum + ", bContent=" + bContent + "]";
	} 
	
	

	
}
