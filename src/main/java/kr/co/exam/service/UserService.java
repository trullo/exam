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
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
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
			System.out.println("id체크");
			if(!checkId(map)) {
				resultMap.put("result", "사용가능한 아이디입니다.");
				resultMap.put("status", 1);
			}
			else {
				resultMap.put("result", "이미 사용중인 아이디 입니다.");
				resultMap.put("status", 0);				
			}
			return HttpUtil.makeJsonView(resultMap);
		}else {	
			logger.info("서비스 sql쪽에서 문제있음");
		}
		resultMap.put("result", di.call(map));		
		resultMap.put("status", 0);
				
		return HttpUtil.makeJsonView(resultMap);
	}

	@Override
	public boolean checkId(Map<String, Object> map) {
		System.out.println(map);
		String sql = map.get("sql").toString();
		map.put("sql", "selectOne");
		map.put("sqlType", "user.checkId");	
		System.out.println(di.call(map));
		if(di.call(map) != null) {
			System.out.println("not null");
			map.put("sql", sql);
			return true;
		}
		else {
			System.out.println("null");
			map.put("sql", sql);
			return false;
		}
		
	}
	
}
