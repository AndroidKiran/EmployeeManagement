package com.pojo.masters;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class AddProductActionPojo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String product_id;
	private String product_name;
	private String ingrediants;
	private String dosage_form;
	private String indications;
	private Integer reference_id;
	private Date dos_db;
	private String dos;
	private byte[] photo;
	private String photo_name;
	private Integer seq_no;
	
	private String ErrorMsg;
	private Integer excelUpload = 0; //Do not change this value as it enables date parsing and photo parsing in submitProduct method of DaoImpl class.
	
	
	public AddProductActionPojo(){}	
	
	public AddProductActionPojo(byte[] photo, String photo_name) {
		this.photo = photo;
		this.photo_name = photo_name;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}


	
	public Integer getSeq_no() {
		return seq_no;
	}

	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getIngrediants() {
		return ingrediants;
	}
	public void setIngrediants(String ingrediants) {
		this.ingrediants = ingrediants;
	}
	public String getDosage_form() {
		return dosage_form;
	}
	public void setDosage_form(String dosage_form) {
		this.dosage_form = dosage_form;
	}
	public String getIndications() {
		return indications;
	}
	public void setIndications(String indications) {
		this.indications = indications;
	}
	public Integer getReference_id() {
		return reference_id;
	}
	public void setReference_id(Integer reference_id) {
		this.reference_id = reference_id;
	}
	public Date getDos_db() {
		return dos_db;
	}
	public void setDos_db(Date dos_db) {
		this.dos_db = dos_db;
	}
	public String getDos() {
		return dos;
	}
	public void setDos(String dos) {
		this.dos = dos;
	}

	/*public List<AddReferenceActionPojo> getReferenceList() {
		return referenceList;
	}

	public void setReferenceList(List<AddReferenceActionPojo> referenceList) {
		this.referenceList = referenceList;
	}
*/
	public String getErrorMsg() {
		return ErrorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		ErrorMsg = errorMsg;
	}

	public Integer getExcelUpload() {
		return excelUpload;
	}

	public void setExcelUpload(Integer excelUpload) {
		this.excelUpload = excelUpload;
	}
	
	
	

}
