package com.developia.memberProject.service;

import java.util.List;
import java.util.Map;

import com.developia.memberProject.domain.UserVO;

public interface UserService {
	public List<UserVO> getUserList() throws Exception;

	public List<Map<Integer, Object>> getUserDetail(int userNO) throws Exception;

	public List<Map<String, Object>> getSearchList(String keyword, int option) throws Exception;

	public void insertUser(UserVO userVO) throws Exception;

	public List<Map<String, Object>> sort_user(String sortValue) throws Exception;

	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap,String value, int option) throws Exception;

	public List<Map<String, Object>> sortTeam(String teamValue) throws Exception;

	public List<Map<String, Object>> sortName(String orderOption, String gValue) throws Exception;
}
