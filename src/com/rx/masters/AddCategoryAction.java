package com.rx.masters;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.AddCategoryActionPojo;

public class AddCategoryAction extends ActionSupport implements ModelDriven<AddCategoryActionPojo>{

	private static final long serialVersionUID = 1L;
	
	private AddCategoryActionPojo addCategoryPOJO = new AddCategoryActionPojo();
	private DaoImpl dao_impl = new DaoImpl();

	public AddCategoryActionPojo getAddCategoryPOJO() {
		return addCategoryPOJO;
	}

	public void setAddCategoryPOJO(AddCategoryActionPojo addCategoryPOJO) {
		this.addCategoryPOJO = addCategoryPOJO;
	}

	public DaoImpl getDao_impl() {
		return dao_impl;
	}

	public void setDao_impl(DaoImpl dao_impl) {
		this.dao_impl = dao_impl;
	}

	
	public String submitCategory() throws Exception {
		
		System.out.println("Submit_Territory Method----------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println("Category Name :::::::::::::::::::::::::::::::"+addCategoryPOJO.getCat_name());
		dao_impl.submitCategory(addCategoryPOJO);
		
		return "SUCCESS";	
	}
	


	@Override
	public AddCategoryActionPojo getModel() {
		// TODO Auto-generated method stub
		return addCategoryPOJO;
	}

}
