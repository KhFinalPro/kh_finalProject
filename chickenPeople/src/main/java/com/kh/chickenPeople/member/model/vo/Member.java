package com.kh.chickenPeople.member.model.vo;

/**
 * @author User
 *
 */
public class Member {

	public String userId;   	//아이디
	public String userName; 	//이름
	
	
	public Member() {
		super();
	}


	public Member(String userId, String userName) {
		super();
		this.userId = userId;
		this.userName = userName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userName=" + userName + "]";
	}

	
	
	
	
}
