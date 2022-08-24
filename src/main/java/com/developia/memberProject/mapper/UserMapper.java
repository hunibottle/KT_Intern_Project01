package com.developia.memberProject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.developia.memberProject.domain.UserVO;

public interface UserMapper {

	public List<UserVO> getUserList() throws Exception;

	public List<Map<Integer, Object>> getUserDetail(int userNO) throws Exception;

	public List<Map<String, Object>> getSearchList(@Param("keyword") String keyword,@Param("option") int option) throws Exception;

	public void insertUser(UserVO userVO) throws Exception;

	public void insertAuth(int userNum) throws Exception;

	public List<Map<String, Object>> sort_user(String sortValue) throws Exception;

	public List<Map<String, Object>> autocomplete(@Param("paramMap") Map<String, Object> paramMap,
			@Param("value") String value, @Param("option") int option) throws Exception;

	public List<Map<String, Object>> sortTeam(String teamValue) throws Exception;

	public List<Map<String, Object>> sortName(@Param("orderOption") String orderOption,@Param("gValue") String gValue) throws Exception;
}