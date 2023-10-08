package com.ssafy.member.model;

public class Member {
	private String userId;
	private String userPwd;
	private String userEmail;
	private String userName;
	private int userAge;

	public Member() {
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userEmail=" + userEmail + ", userName="
				+ userName + ", userAge=" + userAge + "]";
	}
	
	
	
	
	
}
