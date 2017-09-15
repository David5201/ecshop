package com.lbcto.controler;

import com.lbcto.model.entity.EQA;
import com.lbcto.model.entity.User;
import com.lbcto.model.service.UserService;
import com.lbcto.utils.CreatCode;
import com.lbcto.utils.GetCurrentDateTime;
import com.lbcto.utils.MD5Utils;
import com.lbcto.utils.MailUtil;
import com.opensymphony.xwork2.ActionContext;

public class UserAction {

	private String msg;
	private String username;
	private User user;
	private UserService userService;
	private EQA eqa = new EQA();

	//用户注册
	public String userRegister() {
		//对用户的密码加密（MD5加密）
		user.setPassword(MD5Utils.md5Password(user.getPassword()));
		user.setRole(1);
		user.setCreateTime(GetCurrentDateTime.getNowTime());
		if (userService.userRegisterService(user)) {
			return "reg_success";
		} else {
			return "reg_fail";
		}

	}

	//用户注册时检查用户明的可用性
	public String usernameCheck() {
		if (userService.usernameCheckService(username).size() > 0) {
			msg = "0";
		} else {
			msg = "1";
		}
		return "success";
	}

	// 检查用户的答案
	public String checkUserAnswer() {
		//System.out.println("进入action方法");
		if (userService.checkUserAnswerService(user.getUsername(), user.getAnswer()) == null) {
			msg = "0";
		} else {
			msg = "1";
		}
		return "success";
	}

	//检查用户的邮箱
	public String usernameAndEmailCheck() {
		if (userService.usernameAndEmailCheckService(user.getUsername(), user.getEmail()).size() > 0) {
			// msg="1";
			eqa.setStatus("1");
			eqa.setQuestion(
					userService.usernameAndEmailCheckService(user.getUsername(), user.getEmail()).get(0).getQuestion());
			eqa.setAnswer(
					userService.usernameAndEmailCheckService(user.getUsername(), user.getEmail()).get(0).getAnswer());
		} else {
			// msg="0";
			eqa.setStatus("0");
			eqa.setQuestion("");
			eqa.setAnswer("");
		}
		return "success";
	}
	
	//检查原始密码的正确性
	public String checkPassword(){
		user.setPassword(MD5Utils.md5Password(user.getPassword()));
		if(userService.usernameAndPasswordCheckService(user.getUsername(), user.getPassword())==null){
			msg="0";
		}else{
			msg="1";
		}
		return "success";			
	}

	//用户登录
	public String userLogin() {
		user.setPassword(MD5Utils.md5Password(user.getPassword()));
		if (userService.userLoginService(user).size() > 0) {
			msg = "1";
			ActionContext.getContext().getSession().put("user", userService.userLoginService(user).get(0));
		} else {
			msg = "0";
		}
		return "success";

	}

	//系统重置密码
	public String resetUserPassword() {
		//System.out.println(user.getUsername() + "," + user.getEmail());
		String code = CreatCode.getCode();
		
		if(userService.resetUserPasswordService(user.getUsername(),MD5Utils.md5Password(code))){
			new MailUtil(user.getEmail(), "“购物官方网站”", code).run();
			return "success";
		}else{
			return "false";
		}
	}
	
	//用户修改密码
	public String updatePassword(){
		user.setPassword(MD5Utils.md5Password(user.getPassword()));
		if(userService.updatePasswordService(user)){
			return "success";
		}else{
			return "fail";
		}
		
	}
	
	//退出登录
	public String loginout(){
		ActionContext.getContext().getSession().remove("user");
		return "success";
	}
	
	//判断用户是否登录
	public String isLogin(){
		if(ActionContext.getContext().getSession().get("user")==null){
			msg="0";
		}else{
			msg="1";
		}
		return "success";
	}
	
	//修改用户信息
	public String updateUserInfo(){
		if (userService.updateUserInfoService(user)) {
			msg = "1";
			ActionContext.getContext().getSession().put("user", user);
			return "success";
		} else {
			msg = "0";
			return "fail";
		}
		
	}
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public EQA getEqa() {
		return eqa;
	}

	public void setEqa(EQA eqa) {
		this.eqa = eqa;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
