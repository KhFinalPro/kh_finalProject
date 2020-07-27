package com.kh.chickenPeople.main.model.vo;

import java.io.Serializable;

public class Search implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5324309770857866573L;

	public String search_category;
	public String search_input;
	public Search() {
		super();
	}
	public Search(String search_category, String search_input) {
		super();
		this.search_category = search_category;
		this.search_input = search_input;
	}
	public String getSearch_category() {
		return search_category;
	}
	public void setSearch_category(String search_category) {
		this.search_category = search_category;
	}
	public String getSearch_input() {
		return search_input;
	}
	public void setSearch_input(String search_input) {
		this.search_input = search_input;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Search [search_category=" + search_category + ", search_input=" + search_input + "]";
	}
	
	
}
