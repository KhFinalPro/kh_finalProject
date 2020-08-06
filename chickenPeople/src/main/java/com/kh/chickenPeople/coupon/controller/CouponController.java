package com.kh.chickenPeople.coupon.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.coupon.model.service.CouponService;
import com.kh.chickenPeople.systemAdmin.model.vo.Coupon;


@Controller
public class CouponController {

	@Autowired
	CouponService couponService;
	
	@RequestMapping("couponAccept.do")
	public ModelAndView couponAccept(ModelAndView mv, String id)
	{
		ArrayList<Coupon> couponList = couponService.selectCouponList();
		
		mv.addObject("couponList", couponList);
		mv.setViewName("mypage/mypageCouponAccept");
		return mv;
	}
	
	@RequestMapping("couponIssue.do")
	public ModelAndView couponIssue(ModelAndView mv, String id, String coup_serial)
	{
		Coupon c = new Coupon();
		c.setId(id);
		c.setCoup_serial(coup_serial);
		//내가 가지고있는 쿠폰인지 판단
		Coupon selectResult = couponService.selectCouponSerial(c);
		
		ArrayList<Coupon> couponList = couponService.selectCouponList();
		//조회시 쿠폰이 있으면 등록
		if(selectResult == null)
		{	
			int result = couponService.insertMemberCoupon(c);
			mv.addObject("msg", "정상적으로 받았습니다. 쿠폰페이지에서 확인하세요.");
			mv.addObject("couponList", couponList);
			mv.setViewName("mypage/mypageCouponAccept");
		}
		else
		{
			mv.addObject("couponList", couponList);
			mv.addObject("msg", "이미 쿠폰이 등록되었습니다.");
			mv.setViewName("mypage/mypageCouponAccept");
		}
		return mv;
	}
	
	@RequestMapping("myCoupon.do")
	public ModelAndView myCoupon(ModelAndView mv, String id) {
		
		ArrayList<Coupon> myCoupon = couponService.myCoupon(id);
		ArrayList<Coupon> pastCoup = couponService.pastCoup(id);
		if(myCoupon.isEmpty()&&pastCoup.isEmpty()) {
			mv.addObject("msg", "쿠폰이 없네요");
		}else if(myCoupon.isEmpty() && !pastCoup.isEmpty()){
			mv.addObject("pastCoup", pastCoup);
		}else if(!myCoupon.isEmpty() && pastCoup.isEmpty()) {
			mv.addObject("myCoupon", myCoupon);
		}else {
			mv.addObject("myCoupon", myCoupon);
			mv.addObject("pastCoup", pastCoup);
		}
		
		mv.setViewName("mypage/mypageCoupon");
		return mv;
		
	}
	
}
