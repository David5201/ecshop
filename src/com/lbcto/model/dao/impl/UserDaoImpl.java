package com.lbcto.model.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.lbcto.model.dao.UserDao;
import com.lbcto.model.entity.User;

@Transactional
public class UserDaoImpl implements UserDao{

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public boolean userRegister(User user) {
		// TODO Auto-generated method stub
		try {
			this.getSession().saveOrUpdate(user);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<User> usernameCheck(String username) {
		// TODO Auto-generated method stub
		Query query=this.getSession().createQuery("from User where username=:username");
		query.setString("username", username);
		@SuppressWarnings("unchecked")
		List<User> ulist=query.list();
		return ulist;
	}

	@Override
	public List<User> userLogin(User user) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from User where username=? and password=?");
		query.setString(0, user.getUsername());
  	    query.setString(1, user.getPassword());
		@SuppressWarnings("unchecked")
		List<User> ulist = query.list();
		return ulist;
	}

	@Override
	public List<User> usernameAndEmailCheck(String username, String email) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from User where username=? and email=?");
		query.setString(0, username);
  	    query.setString(1, email);
		@SuppressWarnings("unchecked")
		List<User> ulist = query.list();
		return ulist;
	}

	@Override
	public User checkUserAnswer(String username, String answer) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from User where username=? and answer=?");
		query.setString(0, username);
  	    query.setString(1, answer);
		User user = (User) query.uniqueResult();
		return user;
	}

	@Override
	public boolean resetUserPassword(String username, String password) {
		// TODO Auto-generated method stub
		int row=0;
		try {
			Query query = this.getSession().createQuery("update User set password=? where username=?");
			query.setString(0, password);
			query.setString(1, username);
			row = query.executeUpdate();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(row>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updateUserInfo(User user) {
		// TODO Auto-generated method stub
		int row=0;
		try {
			Query query = this.getSession().createQuery("update User set email=?,phone=?,question=?,answer=? where username=?");
			query.setString(0, user.getEmail());
			query.setString(1, user.getPhone());
			query.setString(2, user.getQuestion());
			query.setString(3, user.getAnswer());
			query.setString(4, user.getUsername());
			row = query.executeUpdate();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(row>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public User usernameAndPasswordCheck(String username, String password) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createQuery("from User where username=? and password=?");
		query.setString(0, username);
  	    query.setString(1, password);
		return (User) query.uniqueResult();
	}

	@Override
	public boolean updatePassword(User user) {
		// TODO Auto-generated method stub
		int row=0;
		try {
			Query query = this.getSession().createQuery("update User set password=? where username=?");
			query.setString(0, user.getPassword());
			query.setString(1, user.getUsername());
			row = query.executeUpdate();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(row>0){
			return true;
		}else{
			return false;
		}
	}
	
}
