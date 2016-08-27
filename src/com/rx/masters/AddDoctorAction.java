package com.rx.masters;

import java.util.List;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pojo.masters.AddCategoryActionPojo;
import com.pojo.masters.AddDoctorActionPojo;
import com.pojo.masters.AddTerritoryActionPojo;
import com.pojo.masters.CityActionPojo;
import com.pojo.masters.StateActionPojo;

public class AddDoctorAction extends ActionSupport implements ModelDriven<AddDoctorActionPojo>, Preparable{

	private static final long serialVersionUID = 1L;
	
	AddDoctorActionPojo addDoctorPOJO = new AddDoctorActionPojo();
	DaoImpl dao_impl = new DaoImpl();
	
	public List<AddTerritoryActionPojo> territoryList;
	public List<AddCategoryActionPojo> categoryList;
	public List<AddDoctorActionPojo> docList;
	public List<AddDoctorActionPojo> docListForViewAndEdit = null;
	public List<StateActionPojo> stateList;
	public List<CityActionPojo> cityList;
	
	
	/*
	 * Action to Update Doctor 
	  */
	public String updateDoctor() throws Exception{
		
		dao_impl.submitDoctor(addDoctorPOJO);
		
		return "SUCCESS";
	}
	
	/*
	 * Action For view or edit Doctor 
	  */
	public String viewOrEditDoctor() throws Exception{
		
		docListForViewAndEdit = dao_impl.viewOrEditDoctor(addDoctorPOJO);
		//stateList = dao_impl.fetchState();
		//cityList = dao_impl.fetchCity();
		
		return "SUCCESS";
		
	}
	
	/*
	 * Action For Search Doctor 
	  */
	public String searchDoctor()throws Exception {
		
		docList = dao_impl.searchDoctor(addDoctorPOJO);
		return "SUCCESS";
		
	}
	
	public String invokeList() throws Exception{
		
		System.out.println("SUCCESS public String invokeList() throws Exception{  for doctors.............................................................................................................................................................");
		
		 //stateList = dao_impl.fetchState();
		 //cityList = dao_impl.fetchCity();
		
		 //territoryList=dao_impl.fetchTerritory();
		 //categoryList=dao_impl.fetchCategory();
		 
		return "SUCCESS";
		
	}
	

	public String submitDoctor() throws Exception {
		
		dao_impl.submitDoctor(addDoctorPOJO);
		
		return "SUCCESS";	
	}
	
	
	
	public AddDoctorActionPojo getAddDoctorPOJO() {
		return addDoctorPOJO;
	}


	public void setAddDoctorPOJO(AddDoctorActionPojo addDoctorPOJO) {
		this.addDoctorPOJO = addDoctorPOJO;
	}

	
	public DaoImpl getDao_impl() {
		return dao_impl;
	}


	public void setDao_impl(DaoImpl dao_impl) {
		this.dao_impl = dao_impl;
	}


	public String execute()throws Exception {
		
		return "SUCCESS";	
	}

	@Override
	public AddDoctorActionPojo getModel() {
		// TODO Auto-generated method stub
		return addDoctorPOJO;
	}

	@Override
	public void prepare() throws Exception {
		
		territoryList=dao_impl.fetchTerritory();
		categoryList=dao_impl.fetchCategory();
		stateList = dao_impl.fetchState();
		cityList = dao_impl.fetchCity();
	}
	
	

}
