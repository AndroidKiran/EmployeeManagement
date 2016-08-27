package com.rx.medicalRepresentative;

import java.util.List;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.AddChemistActionPojo;
import com.pojo.masters.AddProductActionPojo;
import com.pojo.medicalRepresentative.OrderBookingActionPojo;
import com.rx.LoginAction;

public class OrderBookingAction extends ActionSupport implements ModelDriven<OrderBookingActionPojo>
{

	private static final long serialVersionUID = 1L;
	
	OrderBookingActionPojo orderBookingPOJO = new OrderBookingActionPojo();
	DaoImpl daoImpl = new DaoImpl();
	
	public List<AddProductActionPojo> productList = null;
	public List<AddChemistActionPojo> chemistList = null;
	public List<AddChemistActionPojo> chemistListCurr = null;
	public List<OrderBookingActionPojo> bookedOrderSearchList = null;
	
	String empId = LoginAction.empIdOfCurrentSession;
	
	public String chemAndProdList()throws Exception {
		
		if(empId.equals(null)){
			return "SESSION_INVALID";
		}
		
		String territoryIdCurrentUser = daoImpl.territoryOfCurrentUser(empId);
		
		System.out.println("In TourPlanningAction Class --> In execute method --> territoryIdCurrentUser --> "+territoryIdCurrentUser);
		
		productList = daoImpl.fetchProductList();
		
		if((territoryIdCurrentUser != null))
		{
			System.out.println("1231231231231231232123215444541541542445425425425423424254");
			
			chemistListCurr = daoImpl.chemistTerritoryWise(territoryIdCurrentUser);
		}
		
		/*
		 * Fetching whole doc list & chem list if user do not have empId, as it may be admin or superuser
		  */
		
		else{
			chemistListCurr = daoImpl.fetchChemist();
		}
		
		return "SUCCESS";
		
	}
	
	public String bookOrder() throws Exception{
		
		orderBookingPOJO.setUserName(LoginAction.user);
		orderBookingPOJO.setEmpId(LoginAction.empIdOfCurrentSession);
		String returnResult = daoImpl.bookOrder(orderBookingPOJO);
		
		if (returnResult.equals("ERROR")) {
			
			return "ERROR";
		}
		else {
			return "SUCCESS";
		}
	}
	
	/*
	 * Action to search Booked- Order user-wise 
	  */
	public String searchBookedOrder()throws Exception {
		
		orderBookingPOJO.setEmpId(LoginAction.empIdOfCurrentSession);
		
		//Populating pre-fetched List for user for place order page 
		String territoryIdCurrentUser = daoImpl.territoryOfCurrentUser(empId);
		
		System.out.println("In TourPlanningAction Class --> In execute method --> territoryIdCurrentUser --> "+territoryIdCurrentUser);
		
		productList = daoImpl.fetchProductList();
		
		if((territoryIdCurrentUser != null))
		{
			chemistListCurr = daoImpl.chemistTerritoryWise(territoryIdCurrentUser);
		}
		
		/*
		 * Fetching whole doc list & chem list if user do not have empId, as it may be admin or superuser
		  */
		
		else{
			chemistListCurr = daoImpl.fetchChemist();
		}
		
		// Search Booked Order
		
		bookedOrderSearchList = daoImpl.searchBookedOrder(orderBookingPOJO,empId);
		return "SUCCESS";
	}

	@Override
	public OrderBookingActionPojo getModel() {
		// TODO Auto-generated method stub
		return orderBookingPOJO;
	}
	

}
