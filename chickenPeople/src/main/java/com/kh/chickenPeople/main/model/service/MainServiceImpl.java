package com.kh.chickenPeople.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.main.model.dao.MainDao;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	MainDao mainDao;
}
