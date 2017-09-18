package com.lbcto.controler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.lbcto.model.entity.Category;
import com.lbcto.model.service.CategoryService;
import com.opensymphony.xwork2.ActionContext;

public class CategoryAction {
	
	@Autowired
	private CategoryService categoryService;
	
	private List<Category> clist;
	private List<Category> alllist;
	
	//获得一级分类集合
	public String getPrimaryCategory(){
		clist = categoryService.getMainCategoryService(0);
		alllist = categoryService.getAllCategoryService();
		ActionContext.getContext().getSession().put("clist", clist);
		ActionContext.getContext().getSession().put("alllist", alllist);
		System.out.println(clist);
		return "success";
	}
	
	public String getCategory(){
		ActionContext.getContext().getSession().put("cMap", categoryService.getCategory(0));
		return "success";
	}
	

	public List<Category> getClist() {
		return clist;
	}

	public void setClist(List<Category> clist) {
		this.clist = clist;
	}

	public List<Category> getAlllist() {
		return alllist;
	}

	public void setAlllist(List<Category> alllist) {
		this.alllist = alllist;
	}

	
	
}
