package com.kh.chickenPeople.systemAdmin.model.vo;

import java.io.Serializable;

public class SearchStatus implements Serializable{

	private static final long serialVersionUID = 4281051484114839013L;

	private String searchName;
	private String searchStatus;
	private String searchCategory;
	
	public SearchStatus() {
	}
	

	public SearchStatus(String searchName, String searchStatus) {
		super();
		this.searchName = searchName;
		this.searchStatus = searchStatus;
	}


	public SearchStatus(String searchName, String searchStatus, String searchCategory) {
		super();
		this.searchName = searchName;
		this.searchStatus = searchStatus;
		this.searchCategory = searchCategory;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(String searchStatus) {
		this.searchStatus = searchStatus;
	}

	public String getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SearchStatus [searchName=" + searchName + ", searchStatus=" + searchStatus + ", searchCategory="
				+ searchCategory + "]";
	}
	
	
	
}
