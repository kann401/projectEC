package global.sesoc.projectEC.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.dao.MemberMapper;
import global.sesoc.projectEC.vo.Member;

@Controller
@RequestMapping("memberMap")
public class MemberMapController {

	@Autowired
	SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(MemberMapController.class);

	@RequestMapping(value = "map1", method = RequestMethod.GET)
	public String map1(Model model) {
		logger.debug("map들어옵니다");
		
		// 순위 변동
	    ChartDAO mapper = sqlSession.getMapper(ChartDAO.class);
	    ArrayList<String> scoreList = new ArrayList<>();

	    scoreList = mapper.getCafescore();
	    System.out.println(scoreList.size());
	    String cafe1 = scoreList.get(0);
	    String cafe2 = scoreList.get(1);
	    String cafe3 = scoreList.get(2);
	      
	    model.addAttribute("cafe1", cafe1);
	    model.addAttribute("cafe2", cafe2);
	    model.addAttribute("cafe3", cafe3);
	    
		return "memberMap/map1";
	}

	@RequestMapping(value = "map2", method = RequestMethod.GET)
	public String map2(Model model) {
		logger.debug("map들어옵니다");
		
		// 순위 변동
	    ChartDAO mapper = sqlSession.getMapper(ChartDAO.class);
	    ArrayList<String> scoreList = new ArrayList<>();

	    scoreList = mapper.getCafescore();
	    System.out.println(scoreList.size());
	    String cafe1 = scoreList.get(0);
	    String cafe2 = scoreList.get(1);
	    String cafe3 = scoreList.get(2);
	      
	    model.addAttribute("cafe1", cafe1);
	    model.addAttribute("cafe2", cafe2);
	    model.addAttribute("cafe3", cafe3);
	    
		return "memberMap/map2";
	}

	// memberMap들어가기 , ajax 요청을 받았으므로 제이슨 데이터를 작성해서 리턴함
	@RequestMapping(value = "getMapAll", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Member> getMap() {

		logger.debug("memberMap시작");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<Member> list = mapper.selectAll();
		logger.debug("list:{}", list);
		return list;
	}

	// memberMap들어가기 , ajax 요청을 받았으므로 제이슨 데이터를 작성해서 리턴함
	@RequestMapping(value = "getCafeAll", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Member> selectAll() {

		logger.debug("memberMap시작");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<Member> list = mapper.getCafeAll();
		logger.debug("list:{}", list);
		return list;
	}

	@RequestMapping(value = "position", method = RequestMethod.POST)
	public String position(String position, Model model) {
		logger.debug("position시작");
		logger.debug("position:" + position);

		return "member/memberHome";
	}
}