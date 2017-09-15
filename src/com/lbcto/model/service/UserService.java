package com.lbcto.model.service;

import java.util.List;

import com.lbcto.model.entity.User;

public interface UserService {

	boolean userRegisterService(User user);
	
	List<User> userLoginService(User user);
	
	List<User> usernameCheckService(String username);
	
	List<User> usernameAndEmailCheckService(String username, String email);
	
	User checkUserAnswerService(String username, String answer);
	
	boolean resetUserPasswordService(String username, String password);
	
	boolean updateUserInfoService(User user);
	
	User usernameAndPasswordCheckService(String username, String password);
	
	boolean updatePasswordService(User user);
}
