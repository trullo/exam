package kr.co.exam.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface UserServiceInterface {
	public ModelAndView user(Map<String, Object> map,HttpSession session);
	public boolean checkId(Map<String, Object> map);
}
