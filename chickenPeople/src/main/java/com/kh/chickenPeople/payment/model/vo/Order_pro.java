package com.kh.chickenPeople.payment.model.vo;

import java.io.Serializable;

public class Order_pro implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8487274298554098212L;

	private String  order_pro;
	private int sto_num;
	private int ord_price;
	public Order_pro() {
		super();
	}
	public Order_pro(String order_pro, int sto_num, int ord_price) {
		super();
		this.order_pro = order_pro;
		this.sto_num = sto_num;
		this.ord_price = ord_price;
	}
	public String getOrder_pro() {
		return order_pro;
	}
	public void setOrder_pro(String order_pro) {
		this.order_pro = order_pro;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}
	public int getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(int ord_price) {
		this.ord_price = ord_price;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Order_pro [order_pro=" + order_pro + ", sto_num=" + sto_num + ", ord_price=" + ord_price + "]";
	}
	
	
}
