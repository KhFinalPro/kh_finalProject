package com.kh.chickenPeople.report.model.vo;

import java.io.Serializable;

public class ReportCategory implements Serializable{

	private static final long serialVersionUID = 770829664223071026L;

	private String rpt_Code;				//신고 사유 코드
	private String rpt_Content;				//신고 사유
	
	public ReportCategory() {}
	public ReportCategory(String rpt_Code, String rpt_Content) {
		super();
		this.rpt_Code = rpt_Code;
		this.rpt_Content = rpt_Content;
	}
	public String getRpt_Code() {
		return rpt_Code;
	}
	public void setRpt_Code(String rpt_Code) {
		this.rpt_Code = rpt_Code;
	}
	public String getRpt_Content() {
		return rpt_Content;
	}
	public void setRpt_Content(String rpt_Content) {
		this.rpt_Content = rpt_Content;
	}
	
	@Override
	public String toString() {
		return "ReportCategory [rpt_Code=" + rpt_Code + ", rpt_Content=" + rpt_Content + "]";
	}
	
	
	
}
