package com.kh.chickenPeople.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

public class Payment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3107650948390241954L;

	//currval
	private int currval;
	
	//payment
	private String ord_num;
	private String pay_date;
	private String pay_rcv;
	private String pay_addr;
	private String pay_tel;
	private String pay_msg;
	private int pay_toal;
	private String coup_num;
	private String user_id;
	private String pay_method;
	private double user_lat;
	private double user_lng;
	
	//주문
	private String ord_status;
	private String ord_cancel;
	private String pay_status;
	private Date delivery_time;	//배달중하면 표시하기
	
	//주문상품
	private int sto_num;
	private int ord_price;
	
	//주문상세
	private int[] menu_numArr;
	private int menu_num;
	private String brand_code;
	private int mord_num;
	public Payment() {
		super();
	}
	public Payment(int currval, String ord_num, String pay_date, String pay_rcv, String pay_addr, String pay_tel,
			String pay_msg, int pay_toal, String coup_num, String user_id, String pay_method, double user_lat,
			double user_lng, String ord_status, String ord_cancel, String pay_status, Date delivery_time, int sto_num,
			int ord_price, int[] menu_numArr, int menu_num, String brand_code, int mord_num) {
		this.currval = currval;
		this.ord_num = ord_num;
		this.pay_date = pay_date;
		this.pay_rcv = pay_rcv;
		this.pay_addr = pay_addr;
		this.pay_tel = pay_tel;
		this.pay_msg = pay_msg;
		this.pay_toal = pay_toal;
		this.coup_num = coup_num;
		this.user_id = user_id;
		this.pay_method = pay_method;
		this.user_lat = user_lat;
		this.user_lng = user_lng;
		this.ord_status = ord_status;
		this.ord_cancel = ord_cancel;
		this.pay_status = pay_status;
		this.delivery_time = delivery_time;
		this.sto_num = sto_num;
		this.ord_price = ord_price;
		this.menu_numArr = menu_numArr;
		this.menu_num = menu_num;
		this.brand_code = brand_code;
		this.mord_num = mord_num;
	}
	public int getCurrval() {
		return currval;
	}
	public void setCurrval(int currval) {
		this.currval = currval;
	}
	public String getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(String ord_num) {
		this.ord_num = ord_num;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_rcv() {
		return pay_rcv;
	}
	public void setPay_rcv(String pay_rcv) {
		this.pay_rcv = pay_rcv;
	}
	public String getPay_addr() {
		return pay_addr;
	}
	public void setPay_addr(String pay_addr) {
		this.pay_addr = pay_addr;
	}
	public String getPay_tel() {
		return pay_tel;
	}
	public void setPay_tel(String pay_tel) {
		this.pay_tel = pay_tel;
	}
	public String getPay_msg() {
		return pay_msg;
	}
	public void setPay_msg(String pay_msg) {
		this.pay_msg = pay_msg;
	}
	public int getPay_toal() {
		return pay_toal;
	}
	public void setPay_toal(int pay_toal) {
		this.pay_toal = pay_toal;
	}
	public String getCoup_num() {
		return coup_num;
	}
	public void setCoup_num(String coup_num) {
		this.coup_num = coup_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public double getUser_lat() {
		return user_lat;
	}
	public void setUser_lat(double user_lat) {
		this.user_lat = user_lat;
	}
	public double getUser_lng() {
		return user_lng;
	}
	public void setUser_lng(double user_lng) {
		this.user_lng = user_lng;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public String getOrd_cancel() {
		return ord_cancel;
	}
	public void setOrd_cancel(String ord_cancel) {
		this.ord_cancel = ord_cancel;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public Date getDelivery_time() {
		return delivery_time;
	}
	public void setDelivery_time(Date delivery_time) {
		this.delivery_time = delivery_time;
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
	public int[] getMenu_numArr() {
		return menu_numArr;
	}
	public void setMenu_numArr(int[] menu_numArr) {
		this.menu_numArr = menu_numArr;
	}
	public int getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}
	public String getBrand_code() {
		return brand_code;
	}
	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
	}
	public int getMord_num() {
		return mord_num;
	}
	public void setMord_num(int mord_num) {
		this.mord_num = mord_num;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Payment [currval=" + currval + ", ord_num=" + ord_num + ", pay_date=" + pay_date + ", pay_rcv="
				+ pay_rcv + ", pay_addr=" + pay_addr + ", pay_tel=" + pay_tel + ", pay_msg=" + pay_msg + ", pay_toal="
				+ pay_toal + ", coup_num=" + coup_num + ", user_id=" + user_id + ", pay_method=" + pay_method
				+ ", user_lat=" + user_lat + ", user_lng=" + user_lng + ", ord_status=" + ord_status + ", ord_cancel="
				+ ord_cancel + ", pay_status=" + pay_status + ", delivery_time=" + delivery_time + ", sto_num="
				+ sto_num + ", ord_price=" + ord_price + ", menu_numArr=" + Arrays.toString(menu_numArr) + ", menu_num="
				+ menu_num + ", brand_code=" + brand_code + ", mord_num=" + mord_num + "]";
	}
	
	
	
}
