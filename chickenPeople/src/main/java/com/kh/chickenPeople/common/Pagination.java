package com.kh.chickenPeople.common;

import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount, int limit) {
		PageInfo pi = null;
		int pageLimit=5;
		int maxPage; 
		int startPage;
		int endPage;
		
		int boardLimit=limit;
		
		maxPage = (int)((double)listCount/boardLimit+0.9);
		startPage = ((int)((double)currentPage/pageLimit+0.9)-1)*pageLimit + 1;
		endPage = startPage+pageLimit-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		return pi;
	}
}
