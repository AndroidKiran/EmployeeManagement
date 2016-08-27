package com.rx.masters;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pojo.masters.AddMRActionPojo;
import com.pojo.masters.AddTerritoryActionPojo;
import com.pojo.masters.BloodGroupActionPojo;
import com.pojo.masters.CityActionPojo;
import com.pojo.masters.CreateRegionActionPojo;
import com.pojo.masters.DesignationActionPojo;
import com.pojo.masters.StateActionPojo;

public class AddMRAction extends ActionSupport implements ModelDriven<AddMRActionPojo>,Preparable{

	private static final long serialVersionUID = 1L;
	
	
	public AddMRActionPojo addMRPojo = new AddMRActionPojo();	// Declaring POJO for MR Action class
	public DaoImpl dao_impl = new DaoImpl();					//Declaring DAO Implementation class for database transaction
	
	public List<AddTerritoryActionPojo> territoryList;			// List type variable to store Territory details
	public List<AddTerritoryActionPojo> territoryListValueRemoved = new ArrayList<AddTerritoryActionPojo>();		// List type variable to store Territory details
	public List<AddTerritoryActionPojo> territoryListValueInEdit;			// List type variable to store Territory details
	public List<AddMRActionPojo> mrList;						//List type variable to store MR details for edit
	public List<AddMRActionPojo> mrEditList;
	public List<DesignationActionPojo> dsgnList;
	public List<BloodGroupActionPojo> bloodGrpList;
	public List<StateActionPojo> stateList;
	public List<StateActionPojo> stateListForEmpId;
	public List<CityActionPojo> cityList;
	public List<CreateRegionActionPojo> regionList;
	
	//public List<AddTerritoryActionPojo> selectedTerritoryList;		// This List is used to store the selected territory from DB.
	//public String[] selectedTerritoryArray;
	public String[] temp;
	public List<String> terrValues;
	
/*
 * Action to update MR 
  */
	public String updateMR() throws Exception {
		
		String mode = dao_impl.updateMR(addMRPojo);
		addMRPojo.setMode(mode);
		
		System.out.println("mode --> "+addMRPojo.getMode());
		
		return "SUCCESS";	
	}
// To edit MR details selected by user.
	
	@SkipValidation
	public String editMR() throws Exception{
		
		System.out.println("In Edit Action Class---->>>> In editMR Method------>emp_id = "+addMRPojo.getEmp_id());
		territoryListValueRemoved = dao_impl.fetchTerritory(); 
		
		
		mrEditList = dao_impl.editMR(addMRPojo);	
		bloodGrpList = dao_impl.fetchBloodGroup();
		 stateList = dao_impl.fetchState();
		 cityList = dao_impl.fetchCity();
		 dsgnList = dao_impl.fetchDesignation();
		
//Set date from database to string type and set the selected list of territory for edit and view page
		
		Iterator<AddMRActionPojo> dsd= mrEditList.iterator();
		while(dsd.hasNext()){
			AddMRActionPojo actionPojo=	(AddMRActionPojo) dsd.next();
			//System.out.println("check"+actionPojo.getDoj_db());
/*
 * Set the date to string type 
  */
			
			if(actionPojo.getDoj_db() != null )
			{
				actionPojo.setDoj(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getDoj_db()));
				//addMRPojo.setDoj(actionPojo.getDoj());
			}
			if(actionPojo.getDob_db() != null )
			{
				actionPojo.setDob(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getDob_db()));
				//addMRPojo.setDob(actionPojo.getDob());
			}
			
/*
 * Populate the terrValues from the List which contains DB info of MR
	  */
			try{
				String tempTer_id = actionPojo.getTer_id();
				String delimiter = ","; 						//To classify string from the DB
				
				if(tempTer_id != null)
				{
					temp = tempTer_id.split(delimiter);				//split method is used to split the string value with a string regex (here it is delimiter) coming from DB as in DB if multiple select value is stored then In DB it is stored as one string separated by a comma(,).
					for(int i =0 ; i < temp.length ; i++){			//for loop to check only
						System.out.println("temp["+i+"] ---> "+temp[i]);
					}
					terrValues = Arrays.asList(temp);				//Convert string array to list
					System.out.println(" --> After converting String Array to List <--");
					for (String e : terrValues)  					//forEach loop to check only
				      {  
				         System.out.println("terrValues : "+e);  
				      }  
					
					 territoryListValueInEdit = dao_impl.searchValueOfTerr(terrValues);
					
					/*for (AddTerritoryActionPojo a : territoryListValueInEdit)  					//forEach loop to check only
					{  
						System.out.println("territoryListValueInEdit : "+a.getTer_id()+" --> "+a.getTerritory()); 
						
					}*/
					 
					 
  /*
   * Logic to remove item from one list to another
    */
		            for(Iterator<AddTerritoryActionPojo> itr = territoryListValueRemoved.iterator();itr.hasNext();)  
		            {  
		                AddTerritoryActionPojo element = itr.next();  
		                
		                for(Iterator<AddTerritoryActionPojo> itrWhichHasToBeRemoved = territoryListValueInEdit.iterator();itrWhichHasToBeRemoved.hasNext();)  
			            {  
			                AddTerritoryActionPojo elementToRemove = itrWhichHasToBeRemoved.next();  
			                if(element.getTer_id().trim().equals(elementToRemove.getTer_id().trim()))  
			                {  
			                    itr.remove();
			                    System.out.println("element --> "+element.getTer_id());
			                    System.out.println("elementToRemove --> "+elementToRemove.getTer_id());
			                } 
			            }
		            }  
		           /* for (AddTerritoryActionPojo b : territoryListValueRemoved)  					//forEach loop to check only
					{  
						System.out.println("territoryListValueRemoved : "+b.getTer_id()+" --> "+b.getTerritory()); 
						
					}*/   
					
				}
			}catch(Exception e){
				System.out.println("Exception While converting multiple territory to single territory"+e);
				e.printStackTrace();
			}
		}	
		return "SUCCESS";
	}
	
// Search MR with details from database.
	@SkipValidation
	public String searchMR() throws Exception{
		
		mrList=dao_impl.searchMR(addMRPojo); 
		
		//Set date from database to string type
		
		Iterator<AddMRActionPojo> dsd= mrList.iterator();
		while(dsd.hasNext()){
			AddMRActionPojo actionPojo=	(AddMRActionPojo) dsd.next();
			//System.out.println("check"+actionPojo.getDoj_db());
			
			if(actionPojo.getDoj_db() != null )
			{
				actionPojo.setDoj(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getDoj_db()));
				addMRPojo.setDoj(actionPojo.getDoj());
			}
			if(actionPojo.getDob_db() != null )
			{
				actionPojo.setDob(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getDob_db()));
				addMRPojo.setDob(actionPojo.getDob());
			}
		}		
		return "SUCCESS";
	}
	
// Fetch territory list from database, to show territory in drop-down for addMR.jsp.
	@SkipValidation
	public String invokeTerritoryList() throws Exception{
		
		 //territoryList=dao_impl.fetchTerritory(); ------>>>>>Written in prepare method, so commented
		 dsgnList = dao_impl.fetchDesignation();
		 bloodGrpList = dao_impl.fetchBloodGroup();
		 stateList = dao_impl.fetchState();
		 cityList = dao_impl.fetchCity();
		 regionList = dao_impl.fetchRegion();
		 stateList = dao_impl.fetchState();
		 
		 System.out.println("size of bloodGrpList in AddMRAction class  --->> "+bloodGrpList.size());
		 
		 return "SUCCESS";
		
	}
	

// Save MR Details into database 
	
	public String submitMR() throws Exception {
		
		System.out.println("In submitMR method");
		
		String firstTwoCharacterOfRegion = "NU";
		String firstThreeCharacterOfState = "BAN";
		String tempEmpId;
		Integer maxSeqNo = dao_impl.fetchMaxSeqNoFromDB();
		
// Auto EmpId Logic Starts From Here.....

//Search Region to Concatenate into EmpId
		List<CreateRegionActionPojo> regionListForEmpId = dao_impl.searchRegionForEmpId(addMRPojo.getRegionId());
		
		if (regionListForEmpId.size() != 0) {

			Iterator<CreateRegionActionPojo> itr= regionListForEmpId.iterator();
			while(itr.hasNext()){
				CreateRegionActionPojo actionPojo=	(CreateRegionActionPojo) itr.next();
				String tempRegName = actionPojo.getRegionName();
				
				firstTwoCharacterOfRegion = tempRegName.substring(0, 2).toUpperCase();
			}
		}
		
//Search State to Concatenate into EmpId
		stateListForEmpId = dao_impl.fetchStateForEmpId(addMRPojo.getState_Id());
		if (stateListForEmpId.size() != 0) {
			String tempState = "KA";
			Iterator<StateActionPojo> itr= stateListForEmpId.iterator();
			while(itr.hasNext()){
				StateActionPojo actionPojo=	(StateActionPojo) itr.next();
					tempState = actionPojo.getStateName();
			}
			firstThreeCharacterOfState = tempState.substring(0, 3).toUpperCase();
		}
		tempEmpId = "NU/"+firstTwoCharacterOfRegion+"/"+firstThreeCharacterOfState+"/"+maxSeqNo;
		addMRPojo.setEmp_id(tempEmpId);
		
		//// Auto EmpId Logic Ends Here.....
		
		String mode = dao_impl.submitMR(addMRPojo); //To save New MR into DB.
		System.out.println("Mode --> "+mode);
		return "SUCCESS";	
	}
	
	

	public String execute() throws Exception {
		
		System.out.println("In AddMRAction Class ");
		
		return "SUCCESS";

	}

	@Override
	public AddMRActionPojo getModel() {
		
		return addMRPojo;
	}

	@Override
	public void prepare() throws Exception {
		
		territoryList = dao_impl.fetchTerritory();
	}

}
