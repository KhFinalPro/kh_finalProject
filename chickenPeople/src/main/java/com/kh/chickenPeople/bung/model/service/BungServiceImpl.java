package com.kh.chickenPeople.bung.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.chickenPeople.bung.model.dao.BungDao;
import com.kh.chickenPeople.bung.model.vo.Bung;

@Service("bungService")
public class BungServiceImpl implements BungService {

	@Autowired
	BungDao bungDao;

	@Override
	public ArrayList<Bung> bungList() {
		
		return bungDao.bungList();
	}

	@Override
	public Bung selectBung(Integer bung_num) {
		// TODO Auto-generated method stub
		return bungDao.selectBung(bung_num);
	}

	@Override
	public int updateHit(Integer bung_num) {
		// TODO Auto-generated method stub
		return bungDao.updateHit(bung_num);
	}

	@Override
	public int updateBungLike(int bung_num) {
		// TODO Auto-generated method stub
		return bungDao.updateBungLike(bung_num);
	}

	@Override
	public int selectBungLike(int bung_num) {
		// TODO Auto-generated method stub
		return bungDao.selectBungLike(bung_num);
	}

	
	
}
