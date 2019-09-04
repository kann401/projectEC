package global.sesoc.projectEC.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.dao.MemberMapper;
import global.sesoc.projectEC.vo.Member;

@Controller
@RequestMapping("menu")
@SessionAttributes("menu")
public class SubjectController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String product(Model model) {
		
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
	      
		return "menu/product";
	}

	@RequestMapping(value = "service", method = RequestMethod.GET)
	public String service(Model model) {
		
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

		return "menu/service";
	}

	@RequestMapping(value = "eco1", method = RequestMethod.GET)
	public String eco1(Model model) {
		
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

		return "menu/eco1";
	}

	@RequestMapping(value = "eco2", method = RequestMethod.GET)
	public String eco2(Model model) {
		
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

		return "menu/eco2";
	}

	@RequestMapping(value = "eco3", method = RequestMethod.GET)
	public String eco3(Model model) {
		
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

		return "menu/eco3";
	}

	@RequestMapping(value = "eco4", method = RequestMethod.GET)
	public String eco4(Model model) {
		
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

		return "menu/eco4";
	}

	@RequestMapping(value = "eco5", method = RequestMethod.GET)
	public String eco5(Model model) {
		
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

		return "menu/eco5";
	}

	@RequestMapping(value = "schedule", method = RequestMethod.GET)
	public String schedule(Model model, HttpSession session) {
		
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
		
	    // 스케쥴
		String loginId = (String) session.getAttribute("loginId");
		MemberMapper dao = sqlSession.getMapper(MemberMapper.class);
		Member member = dao.selectMember(loginId);
		String cafeid = member.getCustid();
		String cafename = member.getName();
		String cafetel = member.getTel();
		String division = member.getDivision();
		model.addAttribute("cafeid", cafeid);
		model.addAttribute("cafename", cafename);
		model.addAttribute("cafetel", cafetel);
		if (division.equals("cafe")) {
			return "menu/schedule";
		} else {
			return "menu/businessschedule";
		}
	}

	@RequestMapping(value = "cafe1", method = RequestMethod.GET)
	public String cafe1(Model model) {
		
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

		return "menu/cafe1";
	}

	@RequestMapping(value = "cafe2", method = RequestMethod.GET)
	public String cafe2(Model model) {
		
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

		return "menu/cafe2";
	}

	@RequestMapping(value = "homepage", method = RequestMethod.GET)
	public String homepage(Model model) {
		
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

		return "menu/homepage";
	}

	@RequestMapping(value = "waste", method = RequestMethod.GET)
	public String waste(Model model) {
		
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

		return "menu/waste";
	}

	@RequestMapping(value = "waste2", method = RequestMethod.GET)
	public String waste2(Model model) {
		
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

		return "menu/waste2";
	}

	@RequestMapping(value = "waste3", method = RequestMethod.GET)
	public String waste3(Model model) {
		
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

		return "menu/waste3";
	}

	@RequestMapping(value = "member", method = RequestMethod.GET)
	public String member(Model model) {
		
			
		// 회원정보 가져오기
		MemberMapper mmapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<Member> mlist = mmapper.list();

		model.addAttribute("mlist", mlist);
		
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

		return "menu/member";
	}

		
}