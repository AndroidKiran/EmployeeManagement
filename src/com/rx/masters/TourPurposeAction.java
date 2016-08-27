package com.rx.masters;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.TourPurposeActionPojo;

public class TourPurposeAction extends ActionSupport implements ModelDriven<TourPurposeActionPojo> {


	private static final long serialVersionUID = 1L;
	TourPurposeActionPojo tourPurposePOJO = new TourPurposeActionPojo();
	DaoImpl daoImpl = new DaoImpl();
	
	@Override
	public TourPurposeActionPojo getModel() {
		// TODO Auto-generated method stub
		return tourPurposePOJO;
	}

}
