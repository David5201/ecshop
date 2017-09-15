package com.lbcto.model.service.impl;

import java.util.List;

import com.lbcto.model.dao.UserDao;
import com.lbcto.model.entity.User;
import com.lbcto.model.service.UserService;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean userRegisterService(User user) {
		// TODO Auto-generated method stub
		return userDao.userRegister(user);
	}

	@Override
	public List<User> usernameCheckService(String username) {
		// TODO Auto-generated method stub
		//System.out.println("userserviceImpl----usernamecheck");
		return userDao.usernameCheck(username);
	}

	@Override
	public List<User> userLoginService(User user) {
		// TODO Auto-generated method stub
		return userDao.userLogin(user);
	}

	@Override
	public List<User> usernameAndEmailCheckService(String username, String email) {
		// TODO Auto-generated method stub
		return userDao.usernameAndEmailCheck(username, email);
	}

	@Override
	public User checkUserAnswerService(String username, String answer) {
		// TODO Auto-generated method stub
		return userDao.checkUserAnswer(username, answer);
	}

	@Override
	public boolean resetUserPasswordService(String username, String password) {
		// TODO Auto-generated method stub
		return userDao.resetUserPassword(username, password);
	}

	@Override
	public boolean updateUserInfoService(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUserInfo(user);
	}

	@Override
	public User usernameAndPasswordCheckService(String username, String password) {
		// TODO Auto-generated method stub
		return userDao.usernameAndPasswordCheck(username, password);
	}

	@Override
	public boolean updatePasswordService(User user) {
		// TODO Auto-generated method stub
		return userDao.updatePassword(user);
	}
	

}
