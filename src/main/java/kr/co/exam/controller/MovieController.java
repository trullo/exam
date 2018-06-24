package kr.co.exam.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.exam.service.MovieInterface;
import kr.co.exam.util.HttpUtil;

@Controller
public class MovieController {
	@Autowired
	MovieInterface mvi;
	@RequestMapping("movie/insert")
	public ModelAndView insert(HttpServletRequest req,@RequestParam("file") MultipartFile file) {
		System.out.println("movie/insert");
		Map<String, Object> test = HttpUtil.getParamMap(req);
		System.out.println(test);
		return mvi.insert(req,file);
	}
	@RequestMapping("movie/insert2")
	public ModelAndView insert2(HttpServletRequest req,@RequestParam("file") MultipartFile file) {
		System.out.println("movie/insert");
		Map<String, Object> test = HttpUtil.getParamMap(req);
		System.out.println(test);
		return mvi.insert(req,file);
	}	
	@RequestMapping("movie/list")
	public ModelAndView list() {
		return mvi.list();
	}
	
	@RequestMapping("mark/insert")
	public ModelAndView insert(HttpServletRequest req,HttpSession session) {
		System.out.println("mark/insert");
		Map<String, Object> param = HttpUtil.getParamMap(req);
		param.putAll((HashMap<String, Object>) session.getAttribute("member"));
		return mvi.markinsert(param);
	}
	@RequestMapping("mark/list")
	public ModelAndView marklist(HttpServletRequest req) {
		return mvi.marklist(req);
	}
}
