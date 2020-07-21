package com.kh.chickenPeople.tag.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.chickenPeople.tag.model.vo.Tag;

@Service
public interface TagService {

	Tag selectTagNum(String tag);

	int insertTag(String trim);

	ArrayList<Tag> selectTag(Integer bung_num);

	Tag selectTagName(int tag_num);

}
