package com.rx.masters;

import java.util.List;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pojo.masters.AddChemistActionPojo;
import com.pojo.masters.AddTerritoryActionPojo;
import com.pojo.masters.CityActionPojo;
import com.pojo.masters.StateActionPojo;

public class AddChemistAction extends ActionSupport implements ModelDriven<AddChemistActionPojo>, Preparable{

	private static final long serialVersionUID = 1L;
	
	AddChemistActionPojo addChemistPojo = new AddChemistActionPojo();
	AddTerritoryActionPojo addTerritoryPOJO = new AddTerritoryActionPojo();
	DaoImpl dao_impl = new DaoImpl();
	
	
	public List<AddTerritoryActionPojo> territoryList = null;
	public List<AddChemistActionPojo> chemList = null;
	public List<AddChemistActionPojo> chemListForViewAndEdit = null;
	public List<StateActionPojo> stateList = null;
	public List<CityActionPojo> cityList = null;
	
	
	public String invokeTerritoryList() throws Exception{
		
		 //territoryList=dao_impl.fetchTerritory();-->>Moved to prepare method
		
		return "SUCCESS";
		
	}
	

	public String submitChemist() throws Exception {
		
		dao_impl.submitChemist(addChemistPojo);
		
		return "SUCCESS";	
	}
	
	/*
	 * Action to search Chemist 
	  */
	public String searchChemist() throws Exception {
		
		chemList = dao_impl.searchChemist(addChemistPojo);
		//chemList = dao_impl.fetchChemist();
		
		/*Iterator<AddChemistActionPojo> dsd= chemList.iterator();
		while(dsd.hasNext()){
		AddChemistActionPojo actionPojo=	(AddChemistActionPojo) dsd.next();
		
		System.out.println("actionPojo.getChemist_id();"+actionPojo.getChemist_id());
		System.out.println("actionPojo.getChemist_name();"+actionPojo.getChemist_name());
		}	
		*/
		return "SUCCESS";
	}
	/*
	 * Action to fetch Doctor List for View And Edit 
	  */
	public String viewAndEditChemist() throws Exception{
		
		chemListForViewAndEdit = dao_impl.viewAndEditChemist(addChemistPojo);
		
		return "SUCCESS";
		
	}
	
	

	@Override
	public AddChemistActionPojo getModel() {
		// TODO Auto-generated method stub
		return addChemistPojo;
	}


	@Override
	public void prepare() throws Exception {
		
		territoryList=dao_impl.fetchTerritory();
		stateList = dao_impl.fetchState();
		cityList = dao_impl.fetchCity();
		
	}

}
