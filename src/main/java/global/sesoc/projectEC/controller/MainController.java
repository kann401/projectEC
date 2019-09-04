package global.sesoc.projectEC.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping (value="mainHome", method=RequestMethod.GET)
	public String mainHome() {
		return "mainHome";
	}
}
