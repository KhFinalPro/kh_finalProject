package com.kh.chickenPeople.report.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.bung.model.vo.Bung;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.report.model.service.ReportService;
import com.kh.chickenPeople.report.model.vo.Report;
import com.kh.chickenPeople.report.model.vo.ReportCategory;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Controller
public class ReportController {

	@Autowired 
	ReportService rService;
	
	@RequestMapping(value="systemAdminReport.do", method=RequestMethod.GET)
	public ModelAndView reportPage(ModelAndView mv,
								   @RequestParam(value="searchId", required=false) String searchId,
								   @RequestParam(value="rptCategory", required=false)String searchCategory,
								   @RequestParam(value="status_s",required=false)String status,
								   @RequestParam(value="page",required=false)Integer page,
								   SearchStatus searchStatus) {
		int currentPage = 1;
		int listCount = 0;
		PageInfo pi = null;
		ArrayList<Report> resultReportList;
		ArrayList<ReportCategory> selectRCategory = rService.selectRCategory();
		
		if(page!=null) {
			currentPage = page;
		}
		if(searchCategory!=null) {
			if(searchId.equals("")) {
				searchId = null;
				searchStatus.setSearchName(searchId);
			}else {
				searchStatus.setSearchName(searchId);
			}
			searchStatus.setSearchCategory(searchCategory);
			searchStatus.setSearchStatus(status);
			
			listCount = rService.getSearchListCount(searchStatus);
			pi = Pagination.getPageInfo(currentPage, listCount, 8);
			resultReportList=  rService.selectReportSearchList(searchStatus,pi);
			
			mv.addObject("searchStatus",searchStatus);
			mv.addObject("listCount",listCount);
			mv.addObject("reportList",resultReportList);
		}else {
			listCount = rService.getListCount();
			pi = Pagination.getPageInfo(currentPage, listCount, 8);
			resultReportList = rService.selectReportList(pi);
			
			mv.addObject("searchStatus",searchStatus);
			mv.addObject("listCount",listCount);
			mv.addObject("reportList",resultReportList);
		
		}
		
		mv.addObject("rCategory",selectRCategory);
		mv.addObject("pi",pi);
		mv.setViewName("systemAdmin/systemAdminReport");
		return mv;
	}
	
	@RequestMapping(value="reportStatusUpdate.do", method=RequestMethod.GET)
	public String reportUpdate(ModelAndView mv,HttpServletResponse response,
									 @RequestParam(value="br_code",required=false) String brCode,
									 @RequestParam(value="br_num", required=false) int brNum,
									 @RequestParam(value="rpt_num",required=false) int rptNum) {
		response.setContentType("text/html; charset=UTF-8");
		
		
		if(brCode.equals("B_BUNG")) {
			int changeBungStatus = rService.changeBungStatus(brNum);
			if(changeBungStatus>0) {
				int changeReportStatus = rService.changeReportStatus(rptNum);
				PrintWriter out;
				if(changeReportStatus>0) {
					try {
						out = response.getWriter();
						out.println("<script>alert('신고처리되었습니다.'); location.href='systemAdminReport.do?rptCategory=total&searchId=&status_s=N';</script>");
						out.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}	
			}
			
		}
		else if(brCode.equals("B_MUK")) {
			int changeMukStatus = rService.changeMukStatus(brNum);
			if(changeMukStatus>0) {
				int changeReportStatus = rService.changeReportStatus(rptNum);
				PrintWriter out;
				if(changeReportStatus>0) {
					try {
						out = response.getWriter();
						out.println("<script>alert('신고처리되었습니다.'); location.href='systemAdminReport.do?rptCategory=total&searchId=&status_s=N';</script>");
						out.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}	
			}
			
		}

		
		return null;
	}
	
	@RequestMapping(value="reportInsert.do", method=RequestMethod.POST)
	public void reportInsert(HttpServletResponse response, @ModelAttribute Report r) throws IOException {
		System.out.println(r);
		response.setContentType("application/json;charset=utf-8");
		int result = rService.insertReport(r);
		JSONObject sendJson = new JSONObject();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			sendJson.put("msg", "성공");
			out.print(sendJson);
			out.flush();
		}
		else {
			
			sendJson.put("msg", "실패");
			out.print(sendJson);
			out.flush();
		}
		out.close();
		
	}
}
