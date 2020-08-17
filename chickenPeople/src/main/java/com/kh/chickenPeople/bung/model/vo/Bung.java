package com.kh.chickenPeople.bung.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Bung implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5226365867593380863L;
	
	
	private int bung_num; 		//번개번호
	private String user_id;		//등록자아이디
	private String bung_title;	//번개제목
	private String bung_date;	//번개일시
	private String bung_addr;	//번개주소
	private int bung_p_no;		//인원수
	private String bung_int;	//소개글
	private int bung_hit;		//조회수
	private int bung_like;		//좋아요
	private int bung_chat;		//채팅인원수
	private String bung_img;	//이미지
	private String bung_brd;	//번개브랜드
	private String bung_status;	//번개현황
	private String pic;			//프로필 사진
	
//	//태그관련
//	private int tag_num;
//	private String tag_name;
	
	public Bung() {
		super();
	}

	public Bung(int bung_num, String user_id, String bung_title, String bung_date, String bung_addr, int bung_p_no,
			String bung_int, int bung_hit, int bung_like, int bung_chat, String bung_img, String bung_brd,
			String bung_status, String pic) {
		this.bung_num = bung_num;
		this.user_id = user_id;
		this.bung_title = bung_title;
		this.bung_date = bung_date;
		this.bung_addr = bung_addr;
		this.bung_p_no = bung_p_no;
		this.bung_int = bung_int;
		this.bung_hit = bung_hit;
		this.bung_like = bung_like;
		this.bung_chat = bung_chat;
		this.bung_img = bung_img;
		this.bung_brd = bung_brd;
		this.bung_status = bung_status;
		this.pic = pic;
	}

	public int getBung_num() {
		return bung_num;
	}

	public void setBung_num(int bung_num) {
		this.bung_num = bung_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBung_title() {
		return bung_title;
	}

	public void setBung_title(String bung_title) {
		this.bung_title = bung_title;
	}

	public String getBung_date() {
		return bung_date;
	}

	public void setBung_date(String bung_date) {
		this.bung_date = bung_date;
	}

	public String getBung_addr() {
		return bung_addr;
	}

	public void setBung_addr(String bung_addr) {
		this.bung_addr = bung_addr;
	}

	public int getBung_p_no() {
		return bung_p_no;
	}

	public void setBung_p_no(int bung_p_no) {
		this.bung_p_no = bung_p_no;
	}

	public String getBung_int() {
		return bung_int;
	}

	public void setBung_int(String bung_int) {
		this.bung_int = bung_int;
	}

	public int getBung_hit() {
		return bung_hit;
	}

	public void setBung_hit(int bung_hit) {
		this.bung_hit = bung_hit;
	}

	public int getBung_like() {
		return bung_like;
	}

	public void setBung_like(int bung_like) {
		this.bung_like = bung_like;
	}

	public int getBung_chat() {
		return bung_chat;
	}

	public void setBung_chat(int bung_chat) {
		this.bung_chat = bung_chat;
	}

	public String getBung_img() {
		return bung_img;
	}

	public void setBung_img(String bung_img) {
		this.bung_img = bung_img;
	}

	public String getBung_brd() {
		return bung_brd;
	}

	public void setBung_brd(String bung_brd) {
		this.bung_brd = bung_brd;
	}

	public String getBung_status() {
		return bung_status;
	}

	public void setBung_status(String bung_status) {
		this.bung_status = bung_status;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Bung [bung_num=" + bung_num + ", user_id=" + user_id + ", bung_title=" + bung_title + ", bung_date="
				+ bung_date + ", bung_addr=" + bung_addr + ", bung_p_no=" + bung_p_no + ", bung_int=" + bung_int
				+ ", bung_hit=" + bung_hit + ", bung_like=" + bung_like + ", bung_chat=" + bung_chat + ", bung_img="
				+ bung_img + ", bung_brd=" + bung_brd + ", bung_status=" + bung_status + ", pic=" + pic + "]";
	}

	
	
	

}
