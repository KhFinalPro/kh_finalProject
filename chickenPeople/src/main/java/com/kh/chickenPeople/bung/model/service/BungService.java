package com.kh.chickenPeople.bung.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.chickenPeople.brand.model.vo.Brand;
import com.kh.chickenPeople.bung.model.vo.Bung;

@Service
public interface BungService {

	ArrayList<Bung> bungList();

	Bung selectBung(Integer bung_num);

	int updateHit(Integer bung_num);

	int updateBungLike(int bung_num);

	int selectBungLike(int bung_num);

	int selectBungHit(int bung_num);

	ArrayList<Brand> brandListSelect();

	

}
