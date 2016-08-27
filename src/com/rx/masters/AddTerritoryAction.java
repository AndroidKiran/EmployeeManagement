package com.rx.masters;

import java.util.List;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.AddTerritoryActionPojo;

public class AddTerritoryAction extends ActionSupport implements ModelDriven<AddTerritoryActionPojo> {

	private static final long serialVersionUID = 1L;

	public AddTerritoryActionPojo addTerritoryPOJO = new AddTerritoryActionPojo();
	public DaoImpl dao_impl = new DaoImpl();
	
	public List<AddTerritoryActionPojo> territoryListAll = null;
	public List<AddTerritoryActionPojo> territoryListEdit = null;
	

	public String submitTerritory() throws Exception {
		
		System.out.println("Submit_Territory Method----------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		dao_impl.submitTerritory(addTerritoryPOJO);
		
		return "SUCCESS";	
	}
	
	public String searchTerritory() throws Exception{
		
		territoryListAll = dao_impl.searchTerritory(addTerritoryPOJO);
		return "SUCCESS";
	}
	
	public String editTerritory() throws Exception{
		
		System.out.println("seq_no for edit --> "+addTerritoryPOJO.getSeq_no());
		territoryListEdit = dao_impl.searchForEditTerritory(addTerritoryPOJO);
		
		return "SUCCESS";
		
	}
	
	public String updateTerritory()throws Exception {
		
		dao_impl.submitTerritory(addTerritoryPOJO);
		
		return "SUCCESS";
		
	}
	
	public String deleteTerritory() throws Exception{
		
		String returnResult = dao_impl.deleteTerritory(addTerritoryPOJO);
		
		if (returnResult != null) {
			
			return "SUCCESS";
		}
		else			
			return "ERROR";
		
	}
	
	@Override
	public AddTerritoryActionPojo getModel() {
		// TODO Auto-generated method stub
		return addTerritoryPOJO;
	}
	


}
