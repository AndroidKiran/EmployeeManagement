package com.rx.masters;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import javax.servlet.http.HttpServletRequest;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pojo.masters.AddProductActionPojo;
import com.pojo.masters.AddReferenceActionPojo;

public class AddProductAction extends ActionSupport implements ModelDriven<AddProductActionPojo>,Preparable,SessionAware 
{

	private static final long serialVersionUID = 1L;
	
	public List<AddReferenceActionPojo> referenceList;
	public List<AddProductActionPojo> productList = null;
	public List<AddProductActionPojo> productListViewEdit = null;
	
	AddProductActionPojo addProductPOJO = new AddProductActionPojo();
	DaoImpl dao_impl = new DaoImpl();
	@SuppressWarnings("unused")
	private transient Map session=null;
	
	
		private File fileUpload;
	    private String fileUploadContentType;
	    private String fileUploadFileName;
	    
	    @SuppressWarnings("unused")
		private HttpServletRequest servletRequest = null;
	    	    
	

		public AddProductActionPojo getAddProductPOJO() {
			return addProductPOJO;
		}

		public void setAddProductPOJO(AddProductActionPojo addProductPOJO) {
			this.addProductPOJO = addProductPOJO;
		}

		public DaoImpl getDao_impl() {
			return dao_impl;
		}

		public void setDao_impl(DaoImpl dao_impl) {
			this.dao_impl = dao_impl;
		}

		public File getFileUpload() {
			return fileUpload;
		}

		public void setFileUpload(File fileUpload) {
			this.fileUpload = fileUpload;
		}

		public String getFileUploadContentType() {
			return fileUploadContentType;
		}

		public void setFileUploadContentType(String fileUploadContentType) {
			this.fileUploadContentType = fileUploadContentType;
		}

		public String getFileUploadFileName() {
			return fileUploadFileName;
		}

		public void setFileUploadFileName(String fileUploadFileName) {
			this.fileUploadFileName = fileUploadFileName;
		}

		
		public String execute() throws Exception{
			
			return "SUCCESS";
			
		}
		
		public String invokeList() throws Exception{
			
			
			 //referenceList=dao_impl.fetchReference();
			 
			return "SUCCESS";
			
		}
		
	public String submitProduct()
	{
		try
		{
			System.out.println("Before dao_impl.submitProduct(addProductActionPojo,fileUpload,fileUploadContentType,fileUploadFileName);");
			System.out.println("In Action class----->>>>THE BYE OF THE PHOTOS IS:::::::::"+getFileUpload());
			
			dao_impl.submitProduct(addProductPOJO,fileUpload,fileUploadContentType,fileUploadFileName);
			
			System.out.println("After dao_impl.submitProduct(addProductActionPojo,fileUpload,fileUploadContentType,fileUploadFileName);");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return "SUCCESS";
		
	}
	
	/*
	 * Action To update Product 
	  */
	
	public String updateProduct() throws Exception {
		
		dao_impl.submitProduct(addProductPOJO, fileUpload, fileUploadContentType, fileUploadFileName);
		
		return "SUCCESS";
		
	}

	/*
	 * Action to search Product 
	  */
	public String searchProduct()throws Exception {
		
		productList = dao_impl.searchProduct(addProductPOJO);
		
		System.out.println("ErrorMsg --->> = "+addProductPOJO.getErrorMsg());
		
		
		return "SUCCESS";
		
	}
	public String searchForViewOrEdit()throws Exception {
		
		productListViewEdit = dao_impl.searchForViewOrEdit(addProductPOJO);
		
		return "SUCCESS";
		
	}
	
	@Override
	public AddProductActionPojo getModel() {
		// TODO Auto-generated method stub
		return addProductPOJO;
	}

	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session=session;
		
	}

	@Override
	public void prepare() throws Exception {
		
		referenceList=dao_impl.fetchReference();
		
	}

}
