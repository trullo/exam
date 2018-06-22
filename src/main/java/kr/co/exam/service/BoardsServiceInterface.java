package kr.co.exam.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface BoardsServiceInterface {
	public ModelAndView call(Map<String, Object> param,HttpSession session);
}
