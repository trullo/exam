package kr.co.exam.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public interface UserServiceInterface {
	public ModelAndView user(Map<String, Object> map);
	public boolean checkId(Map<String, Object> map);
}
