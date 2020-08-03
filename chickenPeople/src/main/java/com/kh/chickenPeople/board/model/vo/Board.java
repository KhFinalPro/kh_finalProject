package com.kh.chickenPeople.board.model.vo;

import java.sql.Date;

/**
 * @author User
 *
 */
public class Board {
	
	private int bNum;        //게시판번호	
	private String bWriter; 	//작성자
	private String bCate; 	//분류
	private String bTitle; 	//게시판제목
	private String bCont; 	//게시판내용
	private String bCount; 	//조회수
	private String bHit; 	//추천수
	private Date bDate;		//작성날짜
	private Date bDelDate;	//삭제날짜
	private Date bUpDate; 	//수정날짜
	private String bStatus;	//글삭제 여부
	
	public Board() {
		super();
	}
	public Board(int bNum, String bWriter, String bCate, String bTitle, String bCont, String bCount, String bHit,
			Date bDate, Date bDelDate, Date bUpDate, String bStatus) {
		super();
		this.bNum = bNum;
		this.bWriter = bWriter;
		this.bCate = bCate;
		this.bTitle = bTitle;
		this.bCont = bCont;
		this.bCount = bCount;
		this.bHit = bHit;
		this.bDate = bDate;
		this.bDelDate = bDelDate;
		this.bUpDate = bUpDate;
		this.bStatus = bStatus;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbCate() {
		return bCate;
	}
	public void setbCate(String bCate) {
		this.bCate = bCate;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbCont() {
		return bCont;
	}
	public void setbCont(String bCont) {
		this.bCont = bCont;
	}
	public String getbCount() {
		return bCount;
	}
	public void setbCount(String bCount) {
		this.bCount = bCount;
	}
	public String getbHit() {
		return bHit;
	}
	public void setbHit(String bHit) {
		this.bHit = bHit;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public Date getbDelDate() {
		return bDelDate;
	}
	public void setbDelDate(Date bDelDate) {
		this.bDelDate = bDelDate;
	}
	public Date getbUpDate() {
		return bUpDate;
	}
	public void setbUpDate(Date bUpDate) {
		this.bUpDate = bUpDate;
	}
	public String getbStatus() {
		return bStatus;
	}
	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}
	@Override
	public String toString() {
		return "Board [bNum=" + bNum + ", bWriter=" + bWriter + ", bCate=" + bCate + ", bTitle=" + bTitle + ", bCont="
				+ bCont + ", bCount=" + bCount + ", bHit=" + bHit + ", bDate=" + bDate + ", bDelDate=" + bDelDate
				+ ", bUpDate=" + bUpDate + ", bStatus=" + bStatus + "]";
	}
	
	
	
	
	
}
