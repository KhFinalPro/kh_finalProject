
package com.kh.chickenPeople.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.chickenPeople.notice.model.vo.Notice;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Repository("nDao")
public class NoticeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}
	
	public int getListCount() {
		return sqlSessionTemplate.selectOne("noticeMapper.getListCount");
	}
	
	public Notice selectOne(int nNum) {
		
		return sqlSessionTemplate.selectOne("noticeMapper.selectOne",nNum);
	}
	
	

	public int insertNotice(Notice n) {
		
		System.out.println("insert DAO 출력:"+n);
		
		return sqlSessionTemplate.insert("noticeMapper.insertNotice",n);
	}
	
	

	public int addReadCount(int nNum) {
		
		return sqlSessionTemplate.update("noticeMapper.updateCount",nNum);
	}

	
	
	public int updateNotice(Notice n) {
		System.out.println("update DAO 출력:"+n);
		return sqlSessionTemplate.update("noticeMapper.updateNotice",n);
	}

	
	
	public int deleteNotice(int nNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("noticeMapper.deleteNotice",nNum);
	}

	public int getAdminNoticeListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("noticeMapper.getAdminNoticeListCount");
	}

	public ArrayList<Notice> selectAdminNoticeList(PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("noticeMapper.selectAdminNoticeList", null, rowBounds);
	}

	


}
