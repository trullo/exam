package kr.co.exam.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.exam.Dao.DaoInterface;
@Service
public class BoardsService implements BoardsServiceInterface {
	@Autowired
	DaoInterface di;
	
	@Override
	public ModelAndView call(Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		
		if("selectList".equals(param.get("sql").toString())) {
			param.put("number", (Integer.parseInt((String) param.get("page"))*10));
			param.put("sqlType", "boards.selectList");
		}
		else if("insert".equals(param.get("sql").toString())){
			param.put("sqlType", "boards.insert");
		}
		System.out.println(param);
		mav.addObject("data", di.call(param));
		mav.setViewName("jsp/board");
				
		return mav;
	}
}
