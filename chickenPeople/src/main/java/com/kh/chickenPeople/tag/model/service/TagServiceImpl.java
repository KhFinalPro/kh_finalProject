package com.kh.chickenPeople.tag.model.service;

import java.util.ArrayList;

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

	@Override
	public int insertTag(String tag) {
		// TODO Auto-generated method stub
		return tagDao.insertTag(tag);
	}

	@Override
	public ArrayList<Tag>  selectTag(Integer bung_num) {
		// TODO Auto-generated method stub
		return tagDao.selectTag(bung_num);
	}

	@Override
	public Tag selectTagName(int tag_num) {
		// TODO Auto-generated method stub
		return tagDao.selectTagName(tag_num);
	}

}
