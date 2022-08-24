package com.developia.memberProject.domain;

import com.developia.memberProject.domain.UserVO;

import lombok.Data;

@Data
public class UserVO {
	
	private int user_seq;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_department;
	private String user_phone;
	private String user_state;
	private String user_category;
	private String user_work;
	private String work_content;
	private String user_position;
	/* private List<WorkVO> workContent; */
}
