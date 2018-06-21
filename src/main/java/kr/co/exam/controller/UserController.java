package kr.co.exam.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.exam.service.UserServiceInterface;
import kr.co.exam.util.HttpUtil;

@Controller
public class UserController {
	@Autowired
	UserServiceInterface usi;
	Map<String, Object> map;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/user/{menu}")
	public ModelAndView user(@PathVariable("menu") String menu, HttpServletRequest req, HttpSession session) {
		logger.info("Controller/user/"+menu);		
		map = HttpUtil.getParamMap(req);
		map.put("sql", menu);
		return usi.user(map,session);
	}
}
