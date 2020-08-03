package com.kh.chickenPeople.store.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Store implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2328263205656290008L;

	private int sto_num;		//매장번호
	private String sto_name;	//매장이름
	private String sto_tel;		//매장전화번호
	private Date sto_open;		//오픈시간
	private Date sto_close;		//마감시간
	private String sto_addr;	//매장주소
	private String sto_intro;	//매장소개
	private String ord_limit;	//최소주문금액
	private String deli_time;	//배달시간
	private String enter_yn;	//입점유무
	private String open_yn;		//영업상태
	private String ceo_name;	//대표이름
	private String delivery;	//배달가능여부
	private String sto_email;	//이메일
	private String aprv_status;	//승인여뷰
	private String brand_code;	//브랜드코드
	private String user_id;		//매장고유아이디
	private double sto_lat;
	private double sto_lng;
	//브랜드관련
	private String brand_pic;
	private String brand_name;
	
	//별점
	private double rev_rate;
	
	//메뉴
	private int menu_num;
	private String menu_name;
	private int menu_price;
	private String menu_pic;
	private String menu_exp;
	private int cat_code;
	
	//메뉴 카테고리
	private String cat_name;
	
	
	public Store() {
	}


	//관리자 _ 점포 관리 생성자(계연)
	public Store(int sto_num, String sto_name, String sto_tel, Date sto_open, Date sto_close, String sto_addr,
			String sto_intro, String ord_limit, String deli_time, String enter_yn, String open_yn, String ceo_name,
			String delivery, String sto_email, String aprv_status, String brand_code, String user_id,
			String brand_name) {
		super();
		this.sto_num = sto_num;
		this.sto_name = sto_name;
		this.sto_tel = sto_tel;
		this.sto_open = sto_open;
		this.sto_close = sto_close;
		this.sto_addr = sto_addr;
		this.sto_intro = sto_intro;
		this.ord_limit = ord_limit;
		this.deli_time = deli_time;
		this.enter_yn = enter_yn;
		this.open_yn = open_yn;
		this.ceo_name = ceo_name;
		this.delivery = delivery;
		this.sto_email = sto_email;
		this.aprv_status = aprv_status;
		this.brand_code = brand_code;
		this.user_id = user_id;
		this.brand_name = brand_name;
	}


	public Store(int sto_num, String sto_name, String sto_tel, Date sto_open, Date sto_close, String sto_addr,
			String sto_intro, String ord_limit, String deli_time, String enter_yn, String open_yn, String ceo_name,
			String delivery, String sto_email, String aprv_status, String brand_code, String user_id, double sto_lat,
			double sto_lng, String brand_pic, String brand_name, double rev_rate, int menu_num, String menu_name,
			int menu_price, String menu_pic, String menu_exp, int cat_code, String cat_name) {
		super();
		this.sto_num = sto_num;
		this.sto_name = sto_name;
		this.sto_tel = sto_tel;
		this.sto_open = sto_open;
		this.sto_close = sto_close;
		this.sto_addr = sto_addr;
		this.sto_intro = sto_intro;
		this.ord_limit = ord_limit;
		this.deli_time = deli_time;
		this.enter_yn = enter_yn;
		this.open_yn = open_yn;
		this.ceo_name = ceo_name;
		this.delivery = delivery;
		this.sto_email = sto_email;
		this.aprv_status = aprv_status;
		this.brand_code = brand_code;
		this.user_id = user_id;
		this.sto_lat = sto_lat;
		this.sto_lng = sto_lng;
		this.brand_pic = brand_pic;
		this.brand_name = brand_name;
		this.rev_rate = rev_rate;
		this.menu_num = menu_num;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_pic = menu_pic;
		this.menu_exp = menu_exp;
		this.cat_code = cat_code;
		this.cat_name = cat_name;
	}


	public int getSto_num() {
		return sto_num;
	}


	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}


	public String getSto_name() {
		return sto_name;
	}


	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}


	public String getSto_tel() {
		return sto_tel;
	}


	public void setSto_tel(String sto_tel) {
		this.sto_tel = sto_tel;
	}


	public Date getSto_open() {
		return sto_open;
	}


	public void setSto_open(Date sto_open) {
		this.sto_open = sto_open;
	}


	public Date getSto_close() {
		return sto_close;
	}


	public void setSto_close(Date sto_close) {
		this.sto_close = sto_close;
	}


	public String getSto_addr() {
		return sto_addr;
	}


	public void setSto_addr(String sto_addr) {
		this.sto_addr = sto_addr;
	}


	public String getSto_intro() {
		return sto_intro;
	}


	public void setSto_intro(String sto_intro) {
		this.sto_intro = sto_intro;
	}


	public String getOrd_limit() {
		return ord_limit;
	}


	public void setOrd_limit(String ord_limit) {
		this.ord_limit = ord_limit;
	}


	public String getDeli_time() {
		return deli_time;
	}


	public void setDeli_time(String deli_time) {
		this.deli_time = deli_time;
	}


	public String getEnter_yn() {
		return enter_yn;
	}


	public void setEnter_yn(String enter_yn) {
		this.enter_yn = enter_yn;
	}


	public String getOpen_yn() {
		return open_yn;
	}


	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}


	public String getCeo_name() {
		return ceo_name;
	}


	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}


	public String getDelivery() {
		return delivery;
	}


	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}


	public String getSto_email() {
		return sto_email;
	}


	public void setSto_email(String sto_email) {
		this.sto_email = sto_email;
	}


	public String getAprv_status() {
		return aprv_status;
	}


	public void setAprv_status(String aprv_status) {
		this.aprv_status = aprv_status;
	}


	public String getBrand_code() {
		return brand_code;
	}


	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public double getSto_lat() {
		return sto_lat;
	}


	public void setSto_lat(double sto_lat) {
		this.sto_lat = sto_lat;
	}


	public double getSto_lng() {
		return sto_lng;
	}


	public void setSto_lng(double sto_lng) {
		this.sto_lng = sto_lng;
	}


	public String getBrand_pic() {
		return brand_pic;
	}


	public void setBrand_pic(String brand_pic) {
		this.brand_pic = brand_pic;
	}


	public String getBrand_name() {
		return brand_name;
	}


	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}


	public double getRev_rate() {
		return rev_rate;
	}


	public void setRev_rate(double rev_rate) {
		this.rev_rate = rev_rate;
	}


	public int getMenu_num() {
		return menu_num;
	}


	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}


	public String getMenu_name() {
		return menu_name;
	}


	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}


	public int getMenu_price() {
		return menu_price;
	}


	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}


	public String getMenu_pic() {
		return menu_pic;
	}


	public void setMenu_pic(String menu_pic) {
		this.menu_pic = menu_pic;
	}


	public String getMenu_exp() {
		return menu_exp;
	}


	public void setMenu_exp(String menu_exp) {
		this.menu_exp = menu_exp;
	}


	public int getCat_code() {
		return cat_code;
	}


	public void setCat_code(int cat_code) {
		this.cat_code = cat_code;
	}


	public String getCat_name() {
		return cat_name;
	}


	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Store [sto_num=" + sto_num + ", sto_name=" + sto_name + ", sto_tel=" + sto_tel + ", sto_open="
				+ sto_open + ", sto_close=" + sto_close + ", sto_addr=" + sto_addr + ", sto_intro=" + sto_intro
				+ ", ord_limit=" + ord_limit + ", deli_time=" + deli_time + ", enter_yn=" + enter_yn + ", open_yn="
				+ open_yn + ", ceo_name=" + ceo_name + ", delivery=" + delivery + ", sto_email=" + sto_email
				+ ", aprv_status=" + aprv_status + ", brand_code=" + brand_code + ", user_id=" + user_id + ", sto_lat="
				+ sto_lat + ", sto_lng=" + sto_lng + ", brand_pic=" + brand_pic + ", brand_name=" + brand_name
				+ ", rev_rate=" + rev_rate + ", menu_num=" + menu_num + ", menu_name=" + menu_name + ", menu_price="
				+ menu_price + ", menu_pic=" + menu_pic + ", menu_exp=" + menu_exp + ", cat_code=" + cat_code
				+ ", cat_name=" + cat_name + "]";
	}

	
	
	
}
