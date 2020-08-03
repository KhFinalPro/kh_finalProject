package com.kh.chickenPeople.bung.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.bung.model.vo.Bung;
import com.kh.chickenPeople.bung.model.vo.BungTag;
import com.kh.chickenPeople.message.model.vo.Message;

@Repository("bungDao")
public class BungDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Bung> bungList() {
		// TODO Auto-generated method stub
		System.out.println("bungListDao.do");
		return (ArrayList)sqlSessionTemplate.selectList("bungMapper.bungList");
	}

	public Bung selectBung(Integer bung_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("bungMapper.selectBung", bung_num);
	}

	public int updateHit(Integer bung_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("bungMapper.updateHit", bung_num);
	}

	public int updateBungLike(int bung_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("bungMapper.updateBungLike", bung_num);
	}

	public int selectBungLike(int bung_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("bungMapper.selectBungLike", bung_num);
	}

	public int selectBungHit(int bung_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("bungMapper.selectBungHit", bung_num);
	}

	public ArrayList<Brand> brandListSelect() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("bungMapper.selectBrandList");
	}

	public int insertBung(Bung b) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("bungMapper.insertBung",b);
	}

	public Bung selectBungNum(String user_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("bungMapper.selectBungNum", user_id);
	}

	public int insertBungTag(BungTag bungTag) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("bungMapper.insertBungTag", bungTag);
	}

	public ArrayList<Bung> bungTagList(int tag_num) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("bungMapper.bungTagList", tag_num);
	}

	public Brand selectBrand(String bung_brd) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("bungMapper.selectBrand", bung_brd);
	}

	public ArrayList<Bung> selectMyBung(String id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("bungMapper.selectMyBung", id);
	}

	public int updateBung(Bung b) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("bungMapper.updateBung", b);
	}

	public int insertMessage(Message m) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("messageMapper.insertMessage", m);
	}


	

}
