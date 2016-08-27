package com.rx.masters;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.TopicDiscussionActionPojo;

public class TopicDiscussionAction extends ActionSupport implements ModelDriven<TopicDiscussionActionPojo>{

	private static final long serialVersionUID = 1L;
	
	TopicDiscussionActionPojo topicDiscussionPOJO = new TopicDiscussionActionPojo();

	@Override
	public TopicDiscussionActionPojo getModel() {
		// TODO Auto-generated method stub
		return topicDiscussionPOJO;
	}

}
