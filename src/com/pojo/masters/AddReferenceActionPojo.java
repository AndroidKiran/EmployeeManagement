package com.pojo.masters;

import java.io.Serializable;

public class AddReferenceActionPojo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer  ref_id;
	private String  ref_path;
	private String  ref_type;
	private Integer seq_no;
	
	
	
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public Integer getRef_id() {
		return ref_id;
	}
	public void setRef_id(Integer ref_id) {
		this.ref_id = ref_id;
	}
	public String getRef_path() {
		return ref_path;
	}
	public void setRef_path(String ref_path) {
		this.ref_path = ref_path;
	}
	public String getRef_type() {
		return ref_type;
	}
	public void setRef_type(String ref_type) {
		this.ref_type = ref_type;
	}

	
	
}
