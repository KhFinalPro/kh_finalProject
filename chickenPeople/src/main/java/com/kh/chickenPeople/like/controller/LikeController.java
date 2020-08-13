package com.kh.chickenPeople.like.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.like.model.service.LikeService;
import com.kh.chickenPeople.like.model.vo.Like;
import com.kh.chickenPeople.member.model.vo.Member;

@Controller
public class LikeController {

	@Autowired
	LikeService likeService;

	
	
	
	 @RequestMapping(value="storeLikeList.do",method = {RequestMethod.GET, RequestMethod.POST})
	  
	 public ModelAndView storeLikeList(HttpServletRequest request, HttpServletResponse response,ModelAndView mv) throws Exception {
		 response.setContentType("application/json;charset=utf-8");

			HttpSession session = request.getSession();

			Member loginUser = (Member) session.getAttribute("loginUser");

			System.out.println("세션 유저 정보 : " + loginUser.toString());
			// 유저 아이디
			String userId = loginUser.getId();
	  
			 // 내가 찜한 매장
				 ArrayList<Like> storelist = likeService.likeStoreList(userId); 
			 // 내가 찜한글 
			 ArrayList<Like> writeList = likeService.likeWriteList(userId);
			
			 mv.addObject("storelist",storelist); 
			 mv.addObject("writeList", writeList);
			
		     mv.setViewName("mypage/mypageLikes");
		 
	return mv; 
	}
	

	@RequestMapping(value="selectLikeList.do",method = {RequestMethod.GET, RequestMethod.POST} )
	public void selectLikeList(HttpServletRequest request, HttpServletResponse response, String type) throws Exception {
		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("세션 유저 정보 : " + loginUser.toString());
		// 유저 아이디
		String userId = loginUser.getId();

		JSONObject obj = new JSONObject();

		// 내가 찜한 매장
		ArrayList<Like> storelist = likeService.likeStoreList(userId);
		System.out.println("-------- store data check ----------");
		System.out.println(storelist.size());
		System.out.println(storelist);
		System.out.println("-------- store data end ----------");
		// 내가 찜한 매장 JSONArray 로 만들기
		JSONArray storeArr = new JSONArray();
		for (int i = 0; i < storelist.size(); i++) {
			JSONObject store = new JSONObject();

			store.put("brandPic", storelist.get(i).getBrandPic());
			store.put("stoName", storelist.get(i).getStoName());
			store.put("dailyTReview", storelist.get(i).getDailyTReview());
			store.put("ordLimit", storelist.get(i).getOrdLimit());
			store.put("storeNo", storelist.get(i).getStoreNo());

			storeArr.add(store);
		}

		// 오브젝트에 매장 JSONArray 넣기
		obj.put("storeList", storeArr);

		// 내가 찜한 글
		ArrayList<Like> writeList = likeService.likeWriteList(userId);

		// 내가 찜한 글 JSONArray 만들기
		JSONArray writeLikeArr = new JSONArray();
		for (int i = 0; i < writeList.size(); i++) {
			JSONObject write = new JSONObject();

			write.put("bNum", writeList.get(i).getbNum());
			write.put("bWriter", writeList.get(i).getbWriter());
			write.put("bTitle", writeList.get(i).getbTitle());
			write.put("bCont", writeList.get(i).getbCont());
			write.put("bDate", writeList.get(i).getbDate());

			writeLikeArr.add(write);
		}

		// obj 에 내가 쓴 글 목록 넣기
		obj.put("writeList", writeLikeArr);

		PrintWriter out = response.getWriter();

		out.print(obj);
		out.flush();
		out.close();
	}

	@RequestMapping(value="deleteBoard.do",method = {RequestMethod.GET, RequestMethod.POST} )
	public void deleteBoard(HttpServletRequest request, HttpServletResponse response, int b_Num) throws Exception {
		response.setContentType("application/json;charset=utf-8");
		
		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");
	
		String userId = loginUser.getId();
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", userId);
		map.put("bNum", String.valueOf(b_Num));
		
		// 찜취소 삭제하기
		int result = likeService.deleteWrite(map);

		JSONObject resultObj = new JSONObject();
		resultObj.put("cd", "success");
		resultObj.put("msg", "성공");

		PrintWriter out = response.getWriter();

		out.print(resultObj);
		out.flush();
		out.close();

	}

	@RequestMapping(value="deleteStore.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void deleteStore(HttpServletRequest request, HttpServletResponse response, int storeNo) throws Exception {
		response.setContentType("application/json;charset=utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");
	
		// 유저 아이디
		String userId = loginUser.getId();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", userId);
		map.put("storeNo", String.valueOf(storeNo));
		
		
	
		// 찜취소 삭제하기 매장용 만들기 storeNo, userId 보내기
		int result = likeService.deleteStore(map);
		
	
		JSONObject resultObj = new JSONObject();
		resultObj.put("cd", "success");
		resultObj.put("msg", "성공");

		PrintWriter out = response.getWriter();

		out.print(resultObj);
		out.flush();
		out.close();
		
	}

}
