package com.kh.chickenPeople.member.model.vo;

/**
 * @author User
 *
 */
public class Member {

	public String userId;   	//아이디
	public String userName; 	//이름
	public String userPwd;		//비밀번호
	public String userTel; 		//전화번호
	public String userEmail; 	//이메일
	public String propic; 		//프로필사진
	public String userGrade; 	//등급
	public String userLevel; 	//회원분류
	public int ordCnt; 			//주문횟수
	public String userStatus; 	//탈퇴여부
	
	public Member() {
		super();
	}

	public Member(String userId, String userName, String userPwd, String userTel, String userEmail, String propic,
			String userGrade, String userLevel, int ordCnt, String userStatus) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userTel = userTel;
		this.userEmail = userEmail;
		this.propic = propic;
		this.userGrade = userGrade;
		this.userLevel = userLevel;
		this.ordCnt = ordCnt;
		this.userStatus = userStatus;
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

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getPropic() {
		return propic;
	}

	public void setPropic(String propic) {
		this.propic = propic;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public int getOrdCnt() {
		return ordCnt;
	}

	public void setOrdCnt(int ordCnt) {
		this.ordCnt = ordCnt;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userTel=" + userTel
				+ ", userEmail=" + userEmail + ", propic=" + propic + ", userGrade=" + userGrade + ", userLevel="
				+ userLevel + ", ordCnt=" + ordCnt + ", userStatus=" + userStatus + "]";
	}
	
	
	
	
	
}
