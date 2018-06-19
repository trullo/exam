package kr.co.exam.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.exam.Dao.DaoInterface;
import kr.co.exam.controller.HomeController;
import kr.co.exam.util.Constant;
import kr.co.exam.util.HttpUtil;

@Service
public class UserService implements UserServiceInterface {
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	DaoInterface di;
	@Override
	public ModelAndView user(Map<String, Object> map) {
		switch(map.get("sql").toString()) {
			case "insert" :
				if(!checkId(map)) {
					map.put("status", Constant.error2);
					return HttpUtil.makeJsonView(map);
				}
				map.put("sqlType", "user.insert");
		}
		
		if("insert".equals(map.get("sql"))) {
			if(!checkId(map)) {
				map.put("result", Constant.error2);
				return HttpUtil.makeJsonView(map);
			}
			map.put("sqlType", "user.insert");
		}
		else if("selectOne".equals(map.get("sql").toString())) {
			map.put("sqlType", "user.selectOne");
		}
		else if("update".equals(map.get("sql").toString())) {
			map.put("sqlType", "user.update");
		}
		else if("delete".equals(map.get("sql").toString())) {
			map.put("sqlType", "user.delete");
		}
		else if("checkId".equals(map.get("sql").toString())) {
			map.put("sql", "selectOne");
			map.put("sqlType", "user.checkId");
		}else {	
			logger.info("서비스 sql쪽에서 문제있음");
		}
		map.put("result", di.call(map));		
		map.put("status", 0);
				
		return HttpUtil.makeJsonView(map);
	}

	@Override
	public boolean checkId(Map<String, Object> map) {
		String sql = map.get("sql").toString();
		map.put("sql", "selectOne");
		map.put("sqlType", "user.checkId");		
		if(di.call(map) != null) {
			map.put("sql", sql);
			return true;
		}
		else {
			map.put("sql", sql);
			return false;
		}
		
	}
	
}
