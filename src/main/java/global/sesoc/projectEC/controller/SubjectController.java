package global.sesoc.projectEC.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("menu")
@SessionAttributes("menu")
public class SubjectController {
	
	@Autowired
	SqlSession sqlSession;

	@RequestMapping (value="product", method=RequestMethod.GET)
	public String product() {
		
		return "menu/product";
	}
	
	@RequestMapping (value="map", method=RequestMethod.GET)
	public String map() {
		
		return "menu/map";
	}
	
	@RequestMapping (value="service", method=RequestMethod.GET)
	public String service() {
		
		return "menu/service";
	}
	
	
	@RequestMapping (value="eco1", method=RequestMethod.GET)
	public String eco1() {
		
		return "menu/eco1";
	}
	
	@RequestMapping (value="eco2", method=RequestMethod.GET)
	public String eco2() {
		
		return "menu/eco2";
	}
	
	@RequestMapping (value="eco3", method=RequestMethod.GET)
	public String eco3() {
		
		return "menu/eco3";
	}
	
	@RequestMapping (value="eco4", method=RequestMethod.GET)
	public String eco4() {
		
		return "menu/eco4";
	}
	
	@RequestMapping (value="eco5", method=RequestMethod.GET)
	public String eco5() {
		
		return "menu/eco5";
	}
	
	@RequestMapping (value="schedule", method=RequestMethod.GET)
	public String schedule() {
		
		return "menu/schedule";
	}
	
	@RequestMapping (value="cafe", method=RequestMethod.GET)
	public String cafe() {
		
		return "menu/cafe";
	}
	
	@RequestMapping (value="NewFile2", method=RequestMethod.GET)
	public String NewFile2() {
		
		return "menu/NewFile2";
	}
}
