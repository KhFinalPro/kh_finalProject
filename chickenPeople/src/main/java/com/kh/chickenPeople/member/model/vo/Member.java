package com.kh.chickenPeople.member.model.vo;

import java.io.Serializable;

/**
 * @author User
 *
 */
public class Member implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 686132634857983257L;
	
	private String id;
	private String name;
	private String pwd;
	private String tel;
	private String email;
	private String lBrand;
	private String pic;
	private String uGrd;
	private String uLvl;
	private int oCnt;
	private String status;
	public Member() {}
	public Member(String id, String name, String pwd, String tel, String email, String lBrand, String pic, String uGrd,
			String uLvl, int oCnt, String status) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.tel = tel;
		this.email = email;
		this.lBrand = lBrand;
		this.pic = pic;
		this.uGrd = uGrd;
		this.uLvl = uLvl;
		this.oCnt = oCnt;
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getlBrand() {
		return lBrand;
	}
	public void setlBrand(String lBrand) {
		this.lBrand = lBrand;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getuGrd() {
		return uGrd;
	}
	public void setuGrd(String uGrd) {
		this.uGrd = uGrd;
	}
	public String getuLvl() {
		return uLvl;
	}
	public void setuLvl(String uLvl) {
		this.uLvl = uLvl;
	}
	public int getoCnt() {
		return oCnt;
	}
	public void setoCnt(int oCnt) {
		this.oCnt = oCnt;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", pwd=" + pwd + ", tel=" + tel + ", email=" + email
				+ ", lBrand=" + lBrand + ", pic=" + pic + ", uGrd=" + uGrd + ", uLvl=" + uLvl + ", oCnt=" + oCnt
				+ ", status=" + status + "]";
	}
	
	
	
	
}
