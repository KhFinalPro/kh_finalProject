package com.kh.chickenPeople.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.chickenPeople.main.model.service.MainService;

@Controller
public class MainController {

	@Autowired
	MainService mainService;
}
