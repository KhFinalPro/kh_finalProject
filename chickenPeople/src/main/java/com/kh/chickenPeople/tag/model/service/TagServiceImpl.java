package com.kh.chickenPeople.tag.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.tag.model.dao.TagDao;
import com.kh.chickenPeople.tag.model.vo.Tag;

@Service("tagService")
public class TagServiceImpl implements TagService{

	@Autowired
	TagDao tagDao;
	
	@Override
	public Tag selectTagNum(String tag) {
		// TODO Auto-generated method stub
		return tagDao.selectTagNum(tag);
	}

}
