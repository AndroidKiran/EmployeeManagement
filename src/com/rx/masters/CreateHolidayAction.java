package com.rx.masters;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import com.pojo.masters.AddChemistActionPojo;
import com.pojo.masters.AddDoctorActionPojo;
import com.pojo.masters.CreateHolidayActionPojo;
import com.pojo.masters.CreateRegionActionPojo;
import com.pojo.masters.TimeActionPojo;
import com.pojo.masters.TourPurposeActionPojo;
import com.rx.LoginAction;
import com.rx.medicalRepresentative.TourPlanningAction;



public class CreateHolidayAction extends ActionSupport implements ModelDriven<CreateHolidayActionPojo>,Preparable{

	private static final long serialVersionUID = 1L;
	
	CreateHolidayActionPojo createHolidayPOJO = new CreateHolidayActionPojo();
	DaoImpl daoImpl = new DaoImpl();
	
	public List<CreateRegionActionPojo> regionList;
	public List<CreateHolidayActionPojo> holidayList;
	public List<CreateHolidayActionPojo> editHolidayList;
	public List<AddDoctorActionPojo> docList = null;
	
	public List<TimeActionPojo> timeList = null;
	public List<TourPurposeActionPojo> tourPurposeList = null;
	public List<AddDoctorActionPojo> docListCurr = null;
	public List<AddChemistActionPojo> chemistListCurr = null;
	
	
	public String createHoliday() throws Exception{
		
		System.out.println("seq_no in createHoliday() = "+createHolidayPOJO.getSeq_no());
		
		String returnResult = daoImpl.createHoliday(createHolidayPOJO);
		
		if (returnResult.equals("SUCCESS")) {
			
			return "SUCCESS";
		}
		else
			return "ERROR";
		
	}
	
	/*
	 * Search all holiday from database
	   */
	public String searchHoliday()throws Exception {
		
		holidayList = daoImpl.searchHoliday(createHolidayPOJO);
		
		//Set date from database to string type
		
		Iterator<CreateHolidayActionPojo> dsd= holidayList.iterator();
		while(dsd.hasNext()){
			CreateHolidayActionPojo actionPojo=	(CreateHolidayActionPojo) dsd.next();
		System.out.println("check in searchHoliday()"+actionPojo.getHolidayDateDB());
		actionPojo.setHolidayDate(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getHolidayDateDB()));
		
		}

		/*
		 * Populating List for tour Plan. 
		  */
		String empId = LoginAction.empIdOfCurrentSession;
		String territoryIdCurrentUser = daoImpl.territoryOfCurrentUser(empId);
		
		
		if((territoryIdCurrentUser != null))
		{
			docListCurr = daoImpl.doctorTerritoryWise(territoryIdCurrentUser);
			chemistListCurr = daoImpl.chemistTerritoryWise(territoryIdCurrentUser);
		}
		
		/*
		 * Fetching whole doc list & chem list if user do not have empId, as it may be admin or superuser
		  */
		
		else{
			docListCurr = daoImpl.fetchDoctor();
			chemistListCurr = daoImpl.fetchChemist();
		}
		
		tourPurposeList = daoImpl.fetchTourPurposeDetails();
		timeList = daoImpl.fetchTime();
		
		if(holidayList != null)
			return "SUCCESS";
		else
			return "ERROR";
		
	}
	
	/*
	 * Edit Holiday 
	  */
	public String editHoliday()throws Exception {
		
		System.out.println("seq_no = "+createHolidayPOJO.getSeq_no());
		
		editHolidayList = daoImpl.editHoliday(createHolidayPOJO);
		System.out.println("########***************Size of editHolidayList = "+editHolidayList.size());
		
		//Set date from database to string type
		
				Iterator<CreateHolidayActionPojo> dsd= editHolidayList.iterator();
				while(dsd.hasNext()){
					CreateHolidayActionPojo actionPojo=	(CreateHolidayActionPojo) dsd.next();
				System.out.println("check in editHoliday()"+actionPojo.getHolidayDateDB());
				actionPojo.setHolidayDate(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getHolidayDateDB()));
				}
		
		
		if (editHolidayList != null) {
			
			return "SUCCESS";
		}
		else
			return "ERROR";
		
	}
	
	/*
	 * Action to delete data in Database. 
	  */
	public String deleteHoliday()throws Exception {
		
		String returnResult = daoImpl.deleteHoliday(createHolidayPOJO);
		
		if (returnResult != null) {
			
			return "SUCCESS";
		}
		else			
			return "ERROR";
		
	}
	
	
	public String execute() throws Exception{
		
		if (regionList != null) {
			
			return "SUCCESS";
		}
		else
			return "ERROR";
	}
	

	@Override
	public CreateHolidayActionPojo getModel() {
		// TODO Auto-generated method stub
		return createHolidayPOJO;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
		regionList = daoImpl.fetchRegion();
		docList = daoImpl.fetchDoctor();
	}
}
