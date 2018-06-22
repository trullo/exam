package kr.co.exam.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.exam.Dao.DaoInterface;
import kr.co.exam.util.Constant;
import kr.co.exam.util.HttpUtil;
@Service
public class BoardsService implements BoardsServiceInterface {
	@Autowired
	DaoInterface di;
	
	@Override
	public ModelAndView call(Map<String, Object> param,HttpSession session) {
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
		else if("insert".equals(param.get("sql").toString())){
			param.putAll((HashMap<String, Object>) session.getAttribute("member"));
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
		}
		System.out.println(param);
		mav.addObject("data", di.call(param));
		mav.addObject("page", param.get("page"));
				
		return mav;
	}
}
