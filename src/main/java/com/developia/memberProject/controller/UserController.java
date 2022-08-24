package com.developia.memberProject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.developia.memberProject.domain.UserVO;
import com.developia.memberProject.domain.WorkVO;
import com.developia.memberProject.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {

	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	
	@GetMapping("/userList")
	public ModelAndView getUserList(Model model, UserVO userVO, WorkVO workVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		log.info("user controller 도착");
		try {
			List<UserVO> getList = userService.getUserList();
			model.addAttribute("list",getList);
			log.info(getList.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/userDetail/{userNO}")
	public ModelAndView getUserDetail(@ModelAttribute UserVO userVO
			,@PathVariable("userNO") int userNO) throws Exception {
		ModelAndView mav = new ModelAndView();
		log.info(userNO);
		try {
			List<Map<Integer,Object>> list = userService.getUserDetail(userNO);
			mav.setViewName("user/userDetail");
			mav.addObject("list",list);
			log.info(list.get(0));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	 
	@GetMapping("/userPlus")
	public ModelAndView getUserPlus(Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("user/userPlus");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@PostMapping("/insertUser")
	public String insertUser(@ModelAttribute UserVO userVO, Model model) throws Exception{
		log.info(userVO.toString());
		try {
			userService.insertUser(userVO);
			return "redirect:/user/userList";
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "userList";
	}
	
	@ResponseBody
	@RequestMapping("/getSearchList")
	public ResponseEntity<List<Map<String, Object>>> getSearchList(Model model, UserVO userVO,
			@RequestParam("keyword") String keyword, @RequestParam("option") int option) throws Exception{
		List<Map<String,Object>> list = userService.getSearchList(keyword, option);
		log.info(keyword);
		log.info(option);
		log.info(list.toString());
		return ResponseEntity.ok().body(list);
	}
	
	//담당자 위치 테이블화
	@GetMapping("/userTable")
	public ModelAndView userTable(Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("user/userTable");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	//정렬 컨트롤러
	@ResponseBody
	@RequestMapping("/suser")
	public ResponseEntity<List<Map<String, Object>>> sortUser(Model model, @RequestParam("sortValue") String sortValue) throws Exception{
		log.info(sortValue);
		List<Map<String,Object>> list = userService.sort_user(sortValue);
		log.info(list.toString());
		return ResponseEntity.ok().body(list);
	}
	
	//autoComplete 컨트롤러
	@RequestMapping("/autoComplete")
	public @ResponseBody Map<String, Object> autoComplete(@RequestParam Map<String, Object> paramMap,
			@RequestParam("value") String value ,@RequestParam("option") int option) throws Exception{
		log.info("AUTOCOMPLETE CONTROLLER 도착");
		log.info(paramMap);
		
		List<Map<String, Object>> resultList = userService.autocomplete(paramMap, value, option);
		paramMap.put("resultList", resultList);
		log.info(resultList.toString());
		return paramMap;
	}
	
	//팀별 정렬 컨트롤러
	@ResponseBody
	@RequestMapping("/sortTeam")
	public ResponseEntity<List<Map<String, Object>>> sortTeam(Model model, @RequestParam("teamValue") String teamValue) throws Exception{
		log.info(teamValue);
		List<Map<String, Object>> list = userService.sortTeam(teamValue);
		return ResponseEntity.ok().body(list);
	}
	
	//이름순 오름차순, 내림차순 정렬 컨트롤러
	@ResponseBody
	@RequestMapping("/sortName")
	public ResponseEntity<List<Map<String, Object>>> sortName(Model model, @RequestParam("orderOption") String orderOption, @RequestParam("gValue") String gValue) throws Exception{
		List<Map<String, Object>> list = userService.sortName(orderOption, gValue);
		return ResponseEntity.ok().body(list);
	}
}
