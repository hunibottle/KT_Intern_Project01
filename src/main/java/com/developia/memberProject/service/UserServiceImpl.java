package com.developia.memberProject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.developia.memberProject.domain.UserVO;
import com.developia.memberProject.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	
	@Override
	public List<UserVO> getUserList() throws Exception{
		log.info("!!!!!!!!!!!!!!!!!");
		return userMapper.getUserList();
	}

	@Override
	public List<Map<Integer, Object>> getUserDetail(int userNO) throws Exception {
		return userMapper.getUserDetail(userNO);
	}

	@Override
	public List<Map<String, Object>> getSearchList(String keyword, int option) throws Exception {
		return userMapper.getSearchList(keyword, option);
	}

	@Transactional
	@Override
	public void insertUser(UserVO userVO) throws Exception {
		userMapper.insertUser(userVO);
		int userNum = userVO.getUser_seq();
		userMapper.insertAuth(userNum);
	}

	@Override
	public List<Map<String, Object>> sort_user(String sortValue) throws Exception {
		return userMapper.sort_user(sortValue);
	}

	@Override
	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap, String value, int option) throws Exception {
		return userMapper.autocomplete(paramMap, value, option);
	}

	@Override
	public List<Map<String, Object>> sortTeam(String teamValue) throws Exception {
		return userMapper.sortTeam(teamValue);
	}

	@Override
	public List<Map<String, Object>> sortName(String orderOption, String gValue) throws Exception {
		return userMapper.sortName(orderOption, gValue);
	}
}
