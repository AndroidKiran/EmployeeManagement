package com.pojo.medicalRepresentative;

import java.io.Serializable;
import java.util.Date;

public class OrderBookingActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String  productId;
	private String[]  productIdArr;
	private Integer qty ;
	private Integer[] qtyArr ;
	private Integer  chemId;
	private Integer[]  chemIdArr;
	private String  orderDate;
	private String[]  orderDateArr;
	private Date  orderDateDB;
	private String  deliveryDate;
	private String[]  deliveryDateArr;
	private Date  deliveryDateDB;
	private Integer seq_no;
	private String userName;
	private String empId;
	private Date createdDate;
	private String createdDateStr;
	
	private Date updatedDate;
	private String errorMsg = null;
	
	
	public Integer[] getQtyArr() {
		return qtyArr;
	}
	public void setQtyArr(Integer[] qtyArr) {
		this.qtyArr = qtyArr;
	}
	public Integer[] getChemIdArr() {
		return chemIdArr;
	}
	public void setChemIdArr(Integer[] chemIdArr) {
		this.chemIdArr = chemIdArr;
	}
	public String[] getOrderDateArr() {
		return orderDateArr;
	}
	public void setOrderDateArr(String[] orderDateArr) {
		this.orderDateArr = orderDateArr;
	}
	public String[] getDeliveryDateArr() {
		return deliveryDateArr;
	}
	public void setDeliveryDateArr(String[] deliveryDateArr) {
		this.deliveryDateArr = deliveryDateArr;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	
	/**
	 * @return the qty
	 */
	public Integer getQty() {
		return qty;
	}
	/**
	 * @param qty the qty to set
	 */
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	/**
	 * @return the orderDate
	 */
	public String getOrderDate() {
		return orderDate;
	}
	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	/**
	 * @return the deliveryDate
	 */
	public String getDeliveryDate() {
		return deliveryDate;
	}
	/**
	 * @param deliveryDate the deliveryDate to set
	 */
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	/**
	 * @return the seq_no
	 */
	public Integer getSeq_no() {
		return seq_no;
	}
	/**
	 * @param seq_no the seq_no to set
	 */
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the orderDateDB
	 */
	public Date getOrderDateDB() {
		return orderDateDB;
	}
	/**
	 * @param orderDateDB the orderDateDB to set
	 */
	public void setOrderDateDB(Date orderDateDB) {
		this.orderDateDB = orderDateDB;
	}
	/**
	 * @return the deliveryDateDB
	 */
	public Date getDeliveryDateDB() {
		return deliveryDateDB;
	}
	/**
	 * @param deliveryDateDB the deliveryDateDB to set
	 */
	public void setDeliveryDateDB(Date deliveryDateDB) {
		this.deliveryDateDB = deliveryDateDB;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Integer getChemId() {
		return chemId;
	}
	public void setChemId(Integer chemId) {
		this.chemId = chemId;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getCreatedDateStr() {
		return createdDateStr;
	}
	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String[] getProductIdArr() {
		return productIdArr;
	}
	public void setProductIdArr(String[] productIdArr) {
		this.productIdArr = productIdArr;
	}
	


}
