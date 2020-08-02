package com.kh.chickenPeople.menu.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.menu.model.service.MenuService;
import com.kh.chickenPeople.menu.model.vo.Category;
import com.kh.chickenPeople.menu.model.vo.Menu;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

@Controller("menuController")
public class MenuController {

	@Autowired
	MenuService menuService;
	
	@RequestMapping(value="systemAdminMenu.do", method=RequestMethod.GET)
	public ModelAndView menuSearch(@RequestParam(value="menuName",required=false) String menuName,				//검색 및 초기 SELECT	
							 @RequestParam(value="menuCategory",required=false) String menuCategory,
							 @RequestParam(value="status_s",required=false)String status_s,
							 @RequestParam(value="page",required=false)Integer page,
							 SearchStatus menuSearch, HttpSession session,
							 ModelAndView mv){
//		System.out.println("---------------------------------");
//		System.out.println("menuName:"+menuName);
//		System.out.println("menuCategory:"+menuCategory);
//		System.out.println("menuStatus:"+status_s);
//		System.out.println("page:"+page);
		
		//초기값 
		int currentPage=1;
		int listCount=0;
		PageInfo pi = null;
		ArrayList<Menu> resultMenuList = null;
		ArrayList<Brand> selectBrandList = menuService.selectBrandList();

		//첫번째 페이지가 아닐 때
		if(page!=null) {
			currentPage=page;
		}
		
		if(menuCategory!=null) {										//menuCategory가 존재할 때
			if(menuName.equals("")) {
				menuName=null;
				menuSearch.setSearchName(menuName);
			}else {
				menuSearch.setSearchName(menuName);
			}
			menuSearch.setSearchCategory(menuCategory);
			menuSearch.setSearchStatus(status_s);						//검색상태를 menuSearch객체에 저장해서 보관
			
			listCount = menuService.getSearchListCount(menuSearch);		//검색 결과의 갯수 count
			pi = Pagination.getPageInfo(currentPage, listCount,5);		
			resultMenuList = menuService.selectMenuSearchList(menuSearch,pi);
			System.out.println("검색:"+resultMenuList);
			mv.addObject("searchStatus",menuSearch);
			mv.addObject("listCount",listCount);
			mv.addObject("menuList",resultMenuList);

		}else {
		
			listCount=menuService.getListCount();						//전체 게시글 갯수 count
			pi = Pagination.getPageInfo(currentPage, listCount,5);
			resultMenuList = menuService.selectMenuList(pi);
			System.out.println("전체:"+resultMenuList);
			mv.addObject("searchStatus",menuSearch);
			mv.addObject("listCount",listCount);
			mv.addObject("menuList",resultMenuList);
				
		}
		mv.addObject("brandList",selectBrandList);
		mv.addObject("pi",pi);
		mv.setViewName("systemAdmin/menu/systemAdminMenu");
		
		return mv;
	}
	
	@RequestMapping(value="systemAdminMenuDetail.do", method=RequestMethod.GET)
	public ModelAndView goMenuDetail(ModelAndView mv, SearchStatus searchStatus,								//메뉴 DETAIL
									 @RequestParam(value="menuNum") int menuNum,
									 @RequestParam(value="page",required=false) Integer page,
									 @RequestParam(value="menuName") String menuName,
									 @RequestParam(value="menuCategory") String menuCategory,
									 @RequestParam(value="status_s") String status_s) {
//		System.out.println("menuNum:"+menuNum);
//		System.out.println("page:"+page);
//		System.out.println("menuName:"+menuName);
//		System.out.println("menuCategory:"+menuCategory);
//		System.out.println("menuStatus:"+status_s);
//		System.out.println("-------------------------");
//		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		searchStatus.setSearchCategory(menuCategory);
		searchStatus.setSearchName(menuName);
		searchStatus.setSearchStatus(status_s);
		
		ArrayList<Brand> selectBrandList = menuService.selectBrandList();
		Menu m = menuService.selectOneMenu(menuNum);
		
		if(m!=null) {
			mv.addObject("brandList",selectBrandList);
			mv.addObject("menu",m);
			mv.addObject("page",currentPage);
			mv.addObject("searchStatus",searchStatus);
			mv.setViewName("systemAdmin/menu/systemAdminMenuDetail");
		}
		return mv;
	}
	
	@RequestMapping(value="deleteMenu.do",method=RequestMethod.GET)
	public String goDeleteMenu(Model mv, HttpServletResponse response,																		//메뉴 DELETE
							   @RequestParam(value="menuNum",required=false)int menuNum,
							   @RequestParam(value="menuYN", required=false)String menuYN) {
		response.setContentType("text/html; charset=UTF-8");

		int result=0;
		System.out.println("상태:"+menuYN);
		if(menuYN.equals("N")){
			System.out.println("NN");
			result = menuService.changeMenuY(menuNum);
		}
		if(menuYN.equals("Y")) {
			System.out.println("YY");
			result = menuService.changeMenuN(menuNum);			
		}
		PrintWriter out = null;
		if(result>0) {
			try {
				out = response.getWriter();
				out.println("<script>alert('해당메뉴 상태가 변경되었습니다.'); location.href='systemAdminMenu.do?menuName=&menuCategory=total&status_s=N';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(result);
		mv.addAttribute("menuName","");
		mv.addAttribute("menuCategory","total");
		mv.addAttribute("status_s","N");
		
		return null;
	}
	
	@RequestMapping(value="menuInsertData.do", method=RequestMethod.POST)										
	public ModelAndView goInsertMenu(ModelAndView mv, Menu m,
									 HttpServletRequest request, HttpServletResponse response,						//메뉴 INSERT
									 @RequestParam(value="thumbnailImg",required=false) MultipartFile file) {															//메뉴 INSERT
		response.setContentType("text/html; charset=UTF-8");

		ArrayList<Brand> selectBrandList = menuService.selectBrandList();
		ArrayList<Category> selectCategoryList = menuService.selectCategoryList();
		m.setMenu_Yn("N");
		
		if(!file.getOriginalFilename().contentEquals("")) {
			String fileName = saveFile(file,request);
			System.out.println(fileName);
			int position = fileName.lastIndexOf(".");
			System.out.println(position);
			String OnlyFileName = fileName.substring(0,position);
			System.out.println(OnlyFileName);
			m.setMenu_Pic(OnlyFileName);
		}
		
		int insertResult = menuService.insertNewMenu(m);
		System.out.println(insertResult);

		mv.addObject("brandList",selectBrandList);
		mv.addObject("categoryList",selectCategoryList);
		PrintWriter out = null;
		if(insertResult>0) {
			try {
				out = response.getWriter();
				out.println("<script>alert('해당항목이 등록되었습니다.'); location.href='systemAdminMenu.do?menuName=&menuCategory=total&status_s=N';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}			
		}
		return mv;
	}

	@RequestMapping(value="menuInsert.do", method=RequestMethod.GET)
	public ModelAndView goInsertMenuPage(ModelAndView mv, Menu m) {												//메뉴 INSERT 이동 페이지
		
		ArrayList<Brand> selectBrandList = menuService.selectBrandList();
		ArrayList<Category> selectCategoryList = menuService.selectCategoryList();
		
		mv.addObject("brandList",selectBrandList);
		mv.addObject("categoryList",selectCategoryList);

		mv.setViewName("systemAdmin/menu/systemAdminMenuInsert");
		return mv;
	}
	
	@RequestMapping(value="goUpdateMenuPage.do")
	public ModelAndView goUpdateMenu(HttpServletResponse response,												//메뉴 UPDATE
									 HttpServletRequest request,
									 ModelAndView mv, Menu menu) {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("수정:"+menu);

		int updateMenu = menuService.updateMenu(menu);
		
		PrintWriter out;
		if(updateMenu>0) {
			try {
				out = response.getWriter();
				out.println("<script>alert('해당항목이 수정되었습니다.'); location.href='systemAdminMenu.do?menuName=&menuCategory=total&status_s=N';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping(value="goUpdateMenu.do")
	public ModelAndView goUpdateMenuPage(ModelAndView mv, 														//메뉴 UPDATE이동 페이지
										 @RequestParam(value="menuNum")int menuNum) {
		ArrayList<Brand> selectBrandList = menuService.selectBrandList();
		ArrayList<Category> selectCategoryList = menuService.selectCategoryList();
		Menu selectOneMenu = menuService.selectOneMenu(menuNum);
		
		mv.addObject("brandList",selectBrandList);

		mv.addObject("categoryList",selectCategoryList);
		System.out.println(selectCategoryList);
		mv.addObject("menu",selectOneMenu);
		mv.setViewName("systemAdmin/menu/systemAdminMenuUpdate");
		return mv;
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources"); //webapp 및 resources
		String savePath = root+"\\menu";
		File folder = new File(savePath);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String filePath = folder+"\\"+originFileName;
		try {
			file.transferTo(new File(filePath));
			//이상태로 파일업로그가 되지 않는다. 왜냐하면 파일 제한 크기에 대한 설정이 없기 때문이다
			//그래서 파일 크기 지정을 root-context.xml에서 해주자
			
		} catch (Exception e) {
			System.out.println("파일전송에러:"+e.getMessage());
		} //이때 파일이 저장된다.
		return originFileName;
	}
}
