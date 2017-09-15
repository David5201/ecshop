package com.lbcto.model.dao;

import java.util.List;

import com.lbcto.model.entity.User;

public interface UserDao {

	boolean userRegister(User user);//用户注册接口
	
	List<User> userLogin(User user);//用户登录接口 
	
	List<User> usernameCheck(String username); //检测用户名的合法性
	
	List<User> usernameAndEmailCheck(String username,String email);//检测用户邮箱的存在性
	
	User checkUserAnswer(String username,String answer);//检查问题答案
	
	boolean resetUserPassword(String username,String password);//重置密码
	
	boolean updateUserInfo(User user);//用户修改个人信息
	
	User usernameAndPasswordCheck(String username,String password);//检测用户的原始密码
	
	boolean updatePassword(User user);//修改密码
	
	
	
	
}
