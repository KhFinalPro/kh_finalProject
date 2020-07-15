package com.kh.chickenPeople.bung.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.bung.model.dao.BungDao;

@Service("bungService")
public class BungServiceImpl implements BungService {

	@Autowired
	BungDao bungDao;

	
	
}
