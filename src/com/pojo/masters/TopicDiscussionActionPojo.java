package com.pojo.masters;

import java.io.Serializable;

public class TopicDiscussionActionPojo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer topicId;
	private String topicName;
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public String getTopicName() {
		return topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
