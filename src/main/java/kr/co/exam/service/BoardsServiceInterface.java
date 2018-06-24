package kr.co.exam.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface BoardsServiceInterface {
	public ModelAndView call(Map<String, Object> param,HttpSession session,RedirectAttributes ria);
	public void plus(Map<String, Object> param);
}
