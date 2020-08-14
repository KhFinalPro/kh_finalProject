package com.kh.chickenPeople.store.model.vo;

import java.io.Serializable;

public class StoreLabel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3483277958233531904L;
	private String menuName;
	private String menuId;
	
	public StoreLabel() {
		super();
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "StoreLabel [menuName=" + menuName + ", menuId=" + menuId + "]";
	}

	
	
	
}
