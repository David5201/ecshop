package com.lbcto.model.VO;

public class CartVO {

	private Integer id;
	private String imgpath;
	private String info;
	private double price;
	private Integer count;
	private Double total;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public CartVO(Integer id, String imgpath, String info, double price, Integer count, Double total) {
		super();
		this.id = id;
		this.imgpath = imgpath;
		this.info = info;
		this.price = price;
		this.count = count;
		this.total = total;
	}
	public CartVO() {
		super();
	}
	
	
}
