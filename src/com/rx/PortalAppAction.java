package com.rx;

import java.util.ArrayList;
import java.util.Iterator;

import org.json.JSONArray;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.PortalAppPojo;

public class PortalAppAction extends ActionSupport implements ModelDriven<PortalAppPojo>
{
	private static final long serialVersionUID = 1L;
	
	PortalAppPojo portalAppPOJO = new PortalAppPojo();

	DaoImpl daoImpl = new DaoImpl();
	
	ArrayList<PortalAppPojo> getAllModulesList = null;
	
	public String getAllModules() throws Exception {
		
		System.out.println("#########################################################");
		System.out.println("ParentId = "+portalAppPOJO.getParentId());
		
		getAllModulesList = (ArrayList<PortalAppPojo>) daoImpl.getAllModules(portalAppPOJO);
		
		System.out.println("After Database execution ----->>>> In Action Class---->>> ParentId = "+portalAppPOJO.getParentId());
		
		System.out.println("Size of getAllModulesList is::::::::::::::::::::::::::::::::::::::"+getAllModulesList.size());
		
		System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Before --->> return SUCCESS <<-- in getAllModules() method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		// Iterating List
		JSONArray JR = new JSONArray(getAllModulesList,false);
		JR.toString();
		System.out.println("JR.toString();"+JR.toString());
		Iterator<PortalAppPojo> iterator= getAllModulesList.iterator();
		while (iterator.hasNext()) {
			PortalAppPojo obj1 = iterator.next();
			
			System.out.println("In Action Class---->>>> Printing list value------> Portal App = "+obj1.getPortalApp()+" Parent Id = "+obj1.getParentId());
	
		}
		/*
		JSONObject myjson = new JSONObject();
		JSONArray the_json_array = myjson.getJSONArray("getAllModulesList");
		System.out.println(""+the_json_array);
		 int size = the_json_array.size();
		    ArrayList<JSONObject> arrays = new ArrayList<JSONObject>();
		    for (int i = 0; i < size; i++) {
		        JSONObject another_json_object = the_json_array.getJSONObject(i);
		            
		            arrays.add(another_json_object);
		    }

		//Finally
		JSONObject[] jsons = new JSONObject[arrays.size()];
		arrays.toArray(jsons);

		System.out.println("***************************************************************************"+arrays);
		//The end...
		
		*/
		/*
		JSONObject json = new JSONObject();
		json.accumulate("SUCCESS", getAllModulesList);
		System.out.println("In Action class after json.accumulate(SUCCESS, getAllModulesList);============================================"+json.toString());
		
		JSONArray jsonArray = new JSONArray();
		
		
		
		Iterator<PortalAppPojo> dsd= getAllModulesList.iterator();
		while (dsd.hasNext()) {
			PortalAppPojo portalPOJO = (PortalAppPojo) dsd.next();
			jsonArray.add(portalPOJO.getPortalApp());
			System.out.println("jsonArray = "+jsonArray.toString());
		}    
		System.out.println("jsonArray = "+jsonArray.toString());
		*/
		
		return "SUCCESS";
		
	}
	
	@Override
	public PortalAppPojo getModel() {
		// TODO Auto-generated method stub
		return portalAppPOJO;
	}
	

}
