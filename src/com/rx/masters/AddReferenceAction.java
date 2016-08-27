package com.rx.masters;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.AddReferenceActionPojo;

public class AddReferenceAction extends ActionSupport implements ModelDriven<AddReferenceActionPojo> {

	private static final long serialVersionUID = 1L;
	
	private AddReferenceActionPojo addReferencePOJO = new AddReferenceActionPojo();
	private DaoImpl dao_impl = new DaoImpl();
	
	public AddReferenceActionPojo getAddReferencePOJO() {
		return addReferencePOJO;
	}

	public void setAddReferencePOJO(AddReferenceActionPojo addReferencePOJO) {
		this.addReferencePOJO = addReferencePOJO;
	}

	public DaoImpl getDao_impl() {
		return dao_impl;
	}

	public void setDao_impl(DaoImpl dao_impl) {
		this.dao_impl = dao_impl;
	}

	public String submitReference() throws Exception {
		
		dao_impl.submitReference(addReferencePOJO);
		
		return "SUCCESS";	
	}
	
	@Override
	public AddReferenceActionPojo getModel() {
		// TODO Auto-generated method stub
		return addReferencePOJO;
	}
	
	
	

}
