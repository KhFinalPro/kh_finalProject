package com.kh.chickenPeople.storeAdmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreAdminController {


	  @RequestMapping("storeOrder.do")
	   public String storeOrder() {
	      return "storeAdmin/storeOrder";
	   }
	  
	  @RequestMapping("storeReview.do")
	   public String storeReview() {
	      return "storeAdmin/storeReview";
	   }
	  
}
