package kr.co.exam.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public interface MovieInterface {
	public ModelAndView insert(HttpServletRequest req,MultipartFile files);
	public ModelAndView list();
	public ModelAndView list2();
	public HashMap<String, Object> file(HttpServletRequest req,MultipartFile file,Map<String, Object> param);
	public ModelAndView markinsert(Map<String, Object> param);
	public ModelAndView marklist(HttpServletRequest req);
	public ModelAndView del(HttpServletRequest req);
}
