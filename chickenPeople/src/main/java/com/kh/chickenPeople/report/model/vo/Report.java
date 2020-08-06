package com.kh.chickenPeople.report.model.vo;

import java.io.Serializable;

public class Report implements Serializable{

	private static final long serialVersionUID = -604034420908487988L;
	
	private int rpt_Num;					//신고번호
	private int br_Num;						//게시글 번호
	private String content;					//신고 원인
	private String rpt_Date;				//신고일
	private String user_Id;					//사용자
	private String br_Content;				//카테고리 구분
	private String br_Code;					//카테고리 코드
	private String rpt_Content;				//신고 사유 구분
	private String rpt_Code;				//신고 사유 코드
	private String rpt_Status;				//신고 처리상태
	
	public Report() {}

	public Report(int rpt_Num, int br_Num, String content, String rpt_Date, String user_Id, String br_Content,
			String rpt_Content, String rpt_Status) {
		super();
		this.rpt_Num = rpt_Num;
		this.br_Num = br_Num;
		this.content = content;
		this.rpt_Date = rpt_Date;
		this.user_Id = user_Id;
		this.br_Content = br_Content;
		this.rpt_Content = rpt_Content;
		this.rpt_Status = rpt_Status;
	}

	public Report(int rpt_Num, int br_Num, String content, String rpt_Date, String user_Id, String br_Content,
			String br_Code, String rpt_Content, String rpt_Code, String rpt_Status) {
		super();
		this.rpt_Num = rpt_Num;
		this.br_Num = br_Num;
		this.content = content;
		this.rpt_Date = rpt_Date;
		this.user_Id = user_Id;
		this.br_Content = br_Content;
		this.br_Code = br_Code;
		this.rpt_Content = rpt_Content;
		this.rpt_Code = rpt_Code;
		this.rpt_Status = rpt_Status;
	}

	public int getRpt_Num() {
		return rpt_Num;
	}

	public void setRpt_Num(int rpt_Num) {
		this.rpt_Num = rpt_Num;
	}

	public int getBr_Num() {
		return br_Num;
	}

	public void setBr_Num(int br_Num) {
		this.br_Num = br_Num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRpt_Date() {
		return rpt_Date;
	}

	public void setRpt_Date(String rpt_Date) {
		this.rpt_Date = rpt_Date;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getBr_Content() {
		return br_Content;
	}

	public void setBr_Content(String br_Content) {
		this.br_Content = br_Content;
	}

	public String getBr_Code() {
		return br_Code;
	}

	public void setBr_Code(String br_Code) {
		this.br_Code = br_Code;
	}

	public String getRpt_Content() {
		return rpt_Content;
	}

	public void setRpt_Content(String rpt_Content) {
		this.rpt_Content = rpt_Content;
	}

	public String getRpt_Code() {
		return rpt_Code;
	}

	public void setRpt_Code(String rpt_Code) {
		this.rpt_Code = rpt_Code;
	}

	public String getRpt_Status() {
		return rpt_Status;
	}

	public void setRpt_Status(String rpt_Status) {
		this.rpt_Status = rpt_Status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "Report [rpt_Num=" + rpt_Num + ", br_Num=" + br_Num + ", content=" + content + ", rpt_Date=" + rpt_Date
				+ ", user_Id=" + user_Id + ", br_Content=" + br_Content + ", br_Code=" + br_Code + ", rpt_Content="
				+ rpt_Content + ", rpt_Code=" + rpt_Code + ", rpt_Status=" + rpt_Status + "]";
	}
	
	
	
	
	
}
