package com.lbcto.model.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String email;
	private String phone;
	private String question;
	private String answer;
	private Integer role;
	private String createTime;
	private Set orders = new HashSet(0);
	private Set orderItems = new HashSet(0);
	private Set shippings = new HashSet(0);
	private Set commentses = new HashSet(0);
	private Set carts = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username, String password, Integer role, String createTime) {
		this.username = username;
		this.password = password;
		this.role = role;
		this.createTime = createTime;
	}
	
	
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	


	public User(String username, String password, String email, String phone, String question, String answer,
			Integer role, String createTime) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.question = question;
		this.answer = answer;
		this.role = role;
		this.createTime = createTime;
	}

	/** full constructor */
	public User(String username, String password, String email, String phone, String question, String answer,
			Integer role, String createTime, Set orders, Set orderItems, Set shippings, Set commentses, Set carts) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.question = question;
		this.answer = answer;
		this.role = role;
		this.createTime = createTime;
		this.orders = orders;
		this.orderItems = orderItems;
		this.shippings = shippings;
		this.commentses = commentses;
		this.carts = carts;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getRole() {
		return this.role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

	public Set getOrderItems() {
		return this.orderItems;
	}

	public void setOrderItems(Set orderItems) {
		this.orderItems = orderItems;
	}

	public Set getShippings() {
		return this.shippings;
	}

	public void setShippings(Set shippings) {
		this.shippings = shippings;
	}

	public Set getCommentses() {
		return this.commentses;
	}

	public void setCommentses(Set commentses) {
		this.commentses = commentses;
	}

	public Set getCarts() {
		return this.carts;
	}

	public void setCarts(Set carts) {
		this.carts = carts;
	}

}