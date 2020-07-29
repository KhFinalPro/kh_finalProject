package com.kh.chickenPeople.bung.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.bung.model.vo.Bung;
import com.kh.chickenPeople.bung.model.vo.BungTag;

@Service
public interface BungService {

	ArrayList<Bung> bungList();

	Bung selectBung(Integer bung_num);

	int updateHit(Integer bung_num);

	int updateBungLike(int bung_num);

	int selectBungLike(int bung_num);

	int selectBungHit(int bung_num);

	ArrayList<Brand> brandListSelect();

	int insertBung(Bung b);

	Bung selectBungNum(String user_id);

	int insertBungTag(BungTag bungTag);

	ArrayList<Bung> bungTagList(int tag_num);

	Brand selectBrand(String bung_brd);

	ArrayList<Bung> selectMyBung(String id);

	int updateBung(Bung b);



	

}
