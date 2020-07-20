package com.kh.chickenPeople.tag.model.service;

import org.springframework.stereotype.Service;

import com.kh.chickenPeople.tag.model.vo.Tag;

@Service
public interface TagService {

	Tag selectTagNum(String tag);

}
