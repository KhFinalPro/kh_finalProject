package com.kh.chickenPeople.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.coupon.model.service.CouponService;
import com.kh.chickenPeople.payment.model.service.PaymentService;
import com.kh.chickenPeople.payment.model.vo.Payment;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
	@Autowired
	CouponService couponService;
	
	@RequestMapping(value="payment.do", method=RequestMethod.POST)
	public ModelAndView payment(ModelAndView mv, @ModelAttribute Payment payment, String latlng)
	{
		
		double user_lat = Double.parseDouble(latlng.split(" ")[0]);
		double user_lng = Double.parseDouble(latlng.split(" ")[1]);
		payment.setUser_lat(user_lat);
		payment.setUser_lng(user_lng);
		
		System.out.println(payment);
		int currval = 0;
		
		currval = paymentService.insertAll(payment);
		
		System.out.println("currval : " + currval);
		//다중 insert에 필요한 리스트 맵
		ArrayList<Payment> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		int resultInsertJumunDetail = 0;
		if(currval > 0) {
			
			for(int i = 0; i<payment.getMenu_numArr().length; i++) {
				Payment p = new Payment();
				
				p.setSto_num(payment.getSto_num());
				p.setBrand_code(payment.getBrand_code());
				p.setMenu_num(payment.getMenu_numArr()[i]);
				p.setMord_num(payment.getMord_numArr()[i]);
				p.setCurrval(currval);
				
				list.add(p);
			}
			map.put("list", list);
			
			resultInsertJumunDetail = paymentService.insertJumunDetail(map);
		}
		
		if(resultInsertJumunDetail > 0) //결제 성공
		{
			Payment pay = paymentService.selectPayment(payment.getUser_id());
			if(!payment.getCoup_num().isEmpty())	//사용한 쿠폰이 있으면
			{
				int update = couponService.updateMyCoupon(payment);	//사용한 쿠폰이 있으면 업데이트				
			}
			mv.addObject("payInfo", pay);
		}
		else	//결제 실패
		{
			mv.addObject("msg", "결제가 실패했습니다");
		}
		mv.setViewName("payment/paymentSuccess");
		return mv;
	}
		
}

