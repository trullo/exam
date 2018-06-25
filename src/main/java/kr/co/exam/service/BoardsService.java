package kr.co.exam.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.exam.Dao.DaoInterface;
import kr.co.exam.util.Constant;
import kr.co.exam.util.HttpUtil;
@Service
public class BoardsService implements BoardsServiceInterface {
	@Autowired
	DaoInterface di;
	
	@Override
	public ModelAndView call(Map<String, Object> param,HttpSession session, RedirectAttributes ria) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if("selectList".equals(param.get("sql").toString())) {
			param.put("sql", "selectOne");
			param.put("sqlType", "boards.listMax");		
			mav.addObject("max", di.call(param));			
			param.put("number", (Integer.parseInt((String) param.get("page"))*10));
			param.put("sql", "selectList");
			param.put("sqlType", "boards.selectList");
			mav.setViewName("jsp/board");			
		}
		else if("selectList".equals(param.get("sql").toString())) {
			param.put("sql", "selectOne");
			param.put("sqlType", "boards.listMax");		
			mav.addObject("max", di.call(param));			
			param.put("number", (Integer.parseInt((String) param.get("page"))*10));
			param.put("sql", "selectList");
			param.put("sqlType", "boards.selectList2");
			mav.setViewName("jsp/board");			
		}
		else if("searchList".equals(param.get("sql").toString())) {
			param.put("sql", "selectList");
			param.put("sqlType", "boards.searchList");
			param.put("result", di.call(param));
			return HttpUtil.makeJsonView(param);
		}
		else if("insert".equals(param.get("sql").toString())){
			System.out.println(param);
			param.putAll((HashMap<String, Object>) session.getAttribute("member"));

			param.put("content", replace(param.get("content").toString()));
			System.out.println(param);
			param.put("sqlType", "boards.insert");
			if(di.call(param) == null) {
				resultMap.put("status",Constant.error1);
			}
			else {
				resultMap.put("status",Constant.ok);
			}
			return HttpUtil.makeJsonView(resultMap);
		}
		else if("selectOne".equals(param.get("sql").toString())) {
			param.put("sqlType", "boards.selectOne");
			mav.setViewName("jsp/boardView");
			param.put("result", di.call(param));
			Map<String, Object> reple = (HashMap<String, Object>) param.get("result");
			System.out.println("reple content:" + reple.get("content"));
			System.out.println("reple content:" + rereplace(reple.get("content").toString()));
			reple.put("content", rereplace(reple.get("content").toString()));
			param.put("result", reple);
			System.out.println(param);
			return HttpUtil.makeJsonView(param);
		}
		else if("update".equals(param.get("sql").toString())) {
			param.put("sqlType", "boards.update");
			param.put("result", di.call(param));
			param.put("status", Constant.ok);
			return HttpUtil.makeJsonView(param);
		}
		else if("delete".equals(param.get("sql").toString())) {
			System.out.println("delete!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			param.put("sql", "update");
			param.put("sqlType", "boards.delete");
			param.put("result", di.call(param));
			System.out.println(param);
			mav.addObject("boardMenu", param.get("boardMenu"));
			mav.addObject("page", param.get("page"));
			mav.setViewName("redirect:/board/selectList");
			return mav;
		}
		else if("searchList".equals(param.get("sql").toString())) {
			param.put("sql", "selectOne");
			param.put("sqlType", "boards.searchMax");		
			mav.addObject("max", di.call(param));			
			param.put("number", (Integer.parseInt((String) param.get("page"))*10));
			param.put("sql", "selectList");
			param.put("sqlType", "boards.searchList");
			mav.setViewName("jsp/board");			
		}
		System.out.println(param);
		mav.addObject("data", di.call(param));
		mav.addObject("page", param.get("page"));
		
				
		return mav;
	}
	public void plus(Map<String, Object> param) {
		param.put("sql", "update");
		param.put("sqlType", "boards.plus");
		di.call(param);
	}
	
	public String replace(String str) {
		/* 안될시 위로 옮기자 insert쪽으로			
		param.put("content", param.get("content").toString().replace("<", "&lt;"));
		param.put("content", param.get("content").toString().replace(">", "&gt;"));
		param.put("content", param.get("content").toString().replace("(", "&#40;"));
		param.put("content", param.get("content").toString().replace(")", "&#41;"));
		param.put("content", param.get("content").toString().replace("#", "&#35;"));
		param.put("content", param.get("content").toString().replace("&", "&#38;"));
		param.put("content", param.get("content").toString().replace("'", "&#x27;"));
		param.put("content", param.get("content").toString().replace("\"", "&quot;"));
		param.put("content", param.get("content").toString().replace("/", "&#x2F;"));*/		
		str = str.replace("<", "&lt;");
		str = str.replace(">", "&gt;");
		str = str.replace("(", "&#40;");
		str = str.replace(")", "&#41;");
		str = str.replace("#", "&#35;");
		str = str.replace("&", "&#38;");
		str = str.replace("'", "&#x27;");
		str = str.replace("\"", "&quot;");
		str = str.replace("/", "&#x2F;");
		return str;
	}
	public String rereplace(String str) {
		/* 안될시 위로 옮기자 insert쪽으로			
		param.put("content", param.get("content").toString().replace("<", "&lt;"));
		param.put("content", param.get("content").toString().replace(">", "&gt;"));
		param.put("content", param.get("content").toString().replace("(", "&#40;"));
		param.put("content", param.get("content").toString().replace(")", "&#41;"));
		param.put("content", param.get("content").toString().replace("#", "&#35;"));
		param.put("content", param.get("content").toString().replace("&", "&#38;"));
		param.put("content", param.get("content").toString().replace("'", "&#x27;"));
		param.put("content", param.get("content").toString().replace("\"", "&quot;"));
		param.put("content", param.get("content").toString().replace("/", "&#x2F;"));*/		
		str = str.replace("&#x2F;", "/");		
		str = str.replace("&quot;", "\"");
		str = str.replace("&#x27;", "'");
		str = str.replace("&#38;", "&");
		str = str.replace("&#35;", "#");
		str = str.replace("&#41;", ")");
		str = str.replace("&#40;", "(");
		str = str.replace("&gt;", ">");
		str = str.replace("&lt;", "<");
		return str;
	}	
}
