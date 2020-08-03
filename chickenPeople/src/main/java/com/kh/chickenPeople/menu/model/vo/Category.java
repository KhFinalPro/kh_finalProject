package com.kh.chickenPeople.menu.model.vo;

import java.io.Serializable;

public class Category implements Serializable{

	private static final long serialVersionUID = -2269441859129577029L;
	private String cat_Code;
	private String cat_Name;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(String cat_Code, String cat_Name) {
		super();
		this.cat_Code = cat_Code;
		this.cat_Name = cat_Name;
	}
	public String getCat_Code() {
		return cat_Code;
	}
	public void setCat_Code(String cat_Code) {
		this.cat_Code = cat_Code;
	}
	public String getCat_Name() {
		return cat_Name;
	}
	public void setCat_Name(String cat_Name) {
		this.cat_Name = cat_Name;
	}
	@Override
	public String toString() {
		return "Category [cat_Code=" + cat_Code + ", cat_Name=" + cat_Name + "]";
	}
	
	
}
