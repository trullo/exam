package kr.co.exam.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.exam.Dao.DaoInterface;
import kr.co.exam.util.Constant;
import kr.co.exam.util.HttpUtil;
@Service
public class MovieService implements MovieInterface {
	@Autowired
	DaoInterface di;
	@Override
	public ModelAndView insert(HttpServletRequest req,MultipartFile file) {
		Map<String, Object> param = HttpUtil.getParamMap(req);
		System.out.println(param);
		param.put("sql", "insert");
		param.put("sqlType", "movie.minsert");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("status",di.call(param));
		param.put("sql", "selectOne");
		param.put("sqlType", "movie.selectOne");
		param.putAll((HashMap<String, Object>) di.call(param));
		System.out.println(param);
		
		param.putAll(file(req,file,param));		
		param.put("sql", "insert");
		param.put("sqlType", "movie.finsert");		
		result.put("status2", di.call(param));
		
		return HttpUtil.makeJsonView(result);
	}
	
	@Override
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("sql", "selectList");
		param.put("sqlType", "movie.selectList");
		result.put("movie", di.call(param));
		param.put("sqlType", "movie.fileList");
		result.put("file", di.call(param));
				
		mav.setViewName("jsp/movie");
		mav.addObject("data", result);
		return HttpUtil.makeJsonView(result);
	}	
	
	@Override
	public ModelAndView list2() {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("sql", "selectList");
		param.put("sqlType", "movie.selectList2");
		result.put("movie", di.call(param));
		param.put("sqlType", "movie.fileList2");
		result.put("file", di.call(param));
				
		mav.setViewName("jsp/movie");
		mav.addObject("data", result);
		return HttpUtil.makeJsonView(result);
	}		
	
	
	
	public HashMap<String, Object> file(HttpServletRequest req,MultipartFile file,Map<String, Object> param) {
		HashMap<String, Object> result = new HashMap<String, Object>();
        String filenm = file.getOriginalFilename();
        try {
            byte[] bytes = file.getBytes();
            //String path = "D:/GDJ10/IDE/eclipse/workspace/exam/src/main/webapp/resources/team2/img/movie/" + param.get("movieNo") + "/";
//            String path = "/var/www/html/resources/" + param.get("movieNo") + "/";            
//			String path = "D:/GDJ10/IDE/workspace/FileServer/src/main/webapp/resources/" + dir + "/";

			String path = req.getSession().getServletContext().getRealPath("/") + "resources/" + param.get("movieNo") + "/";
//			String dns = "http://gudi.iptime.org:10120/";         
            File dir = new File(path);
            if(!dir.exists()) {dir.mkdirs();}
            File f = new File(path+filenm);	//경로까지담은객체를 담아서
            OutputStream out = new FileOutputStream(f);	//어디에 담겠다
            out.write(bytes);
            out.close();    
            result.put("fileName", filenm);
            result.put("fileUrl", path);    
        }
        catch (Exception e) {
			e.printStackTrace();
		}
        
        return result;
	}
	
	public ModelAndView markinsert(Map<String, Object> param) {
		param.put("sql", "selectOne");
		param.put("sqlType", "movie.markselect");
		if(di.call(param) == null) {
			System.out.println("null임");
			param.put("sql", "insert");
			param.put("sqlType", "movie.markInsert");
			param.put("result",di.call(param));
			param.put("status",Constant.ok);
		}
		else {
			System.out.println("null아님");
			param.put("status",Constant.error1);			
			param.put("msg","이미 점수를 주셨습니다!!!");
			param.put("result", di.call(param));
		}
				
		return HttpUtil.makeJsonView(param);
	}
	public ModelAndView marklist(HttpServletRequest req) {
		Map<String, Object> param = HttpUtil.getParamMap(req);
		param.put("sql", "selectOne");
		param.put("sqlType", "movie.marklist");
		param.put("result", di.call(param));

		System.out.println(param);
		return HttpUtil.makeJsonView(param);
	}
	
	public ModelAndView del(HttpServletRequest req) {
		Map<String, Object> param = HttpUtil.getParamMap(req);
		param.put("sql", "update");
		param.put("sqlType", "movie.mdel");
		param.put("result", di.call(param));
		param.put("sqlType", "movie.fdel");
		param.put("result2", di.call(param));		
		

		System.out.println(param);
		return HttpUtil.makeJsonView(param);
	}	
}
