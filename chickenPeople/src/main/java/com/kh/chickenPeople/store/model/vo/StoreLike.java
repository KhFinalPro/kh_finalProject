package com.kh.chickenPeople.store.model.vo;

import java.io.Serializable;

public class StoreLike implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8814438801146289673L;
	
	private String id;
	private int sto_num;
	public StoreLike() {
		super();
	}
	public StoreLike(String id, int sto_num) {
		super();
		this.id = id;
		this.sto_num = sto_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "StoreLike [id=" + id + ", sto_num=" + sto_num + "]";
	}
	
	
}
