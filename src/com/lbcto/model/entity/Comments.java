package com.lbcto.model.entity;

/**
 * Comments entity. @author MyEclipse Persistence Tools
 */

public class Comments implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer productId;
	private String comments;
	private Integer status;
	private String createTime;

	// Constructors

	/** default constructor */
	public Comments() {
	}

	/** full constructor */
	public Comments(Integer userId, Integer productId, String comments, Integer status, String createTime) {
		this.userId = userId;
		this.productId = productId;
		this.comments = comments;
		this.status = status;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}