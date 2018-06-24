package kr.co.exam.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.exam.service.BoardsServiceInterface;
import kr.co.exam.util.HttpUtil;

@Controller
public class BordersController {
	@Autowired
	BoardsServiceInterface bsi;
	
	@RequestMapping("board/{menu}")
	public ModelAndView board(@PathVariable String menu,HttpServletRequest req,HttpSession session,RedirectAttributes ria) {
		Map<String, Object> param = HttpUtil.getParamMap(req);
		param.put("sql", menu);
		System.out.println("menu :"+menu);
		return bsi.call(param,session,ria);
	}
	
	@RequestMapping("plus")
	public void board(HttpServletRequest req) {
		Map<String,Object> param = HttpUtil.getParamMap(req);
		bsi.plus(param);
	}
	
}
