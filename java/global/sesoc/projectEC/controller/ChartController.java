package global.sesoc.projectEC.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.projectEC.dao.ChartDAO;

@Controller
@RequestMapping("chart")
public class ChartController {

	@Autowired
	SqlSession sqlSession;

	// 카페 그래프 페이지
	@RequestMapping(value = "graph1", method = RequestMethod.GET)
	public String graph1(HttpSession session, Model model) {

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

		String loginId = null;
		loginId = (String) session.getAttribute("loginId");
		String division = (String) session.getAttribute("division");
		ChartDAO mmapper = sqlSession.getMapper(ChartDAO.class);

		int alllist9 = mmapper.getAllgraph9();
		int alllist8 = mmapper.getAllgraph8();
		int alllist7 = mmapper.getAllgraph7();
		int alllist6 = mmapper.getAllgraph6();
		int alllist5 = mmapper.getAllgraph5();

		model.addAttribute("alllist9", alllist9);
		model.addAttribute("alllist8", alllist8);
		model.addAttribute("alllist7", alllist7);
		model.addAttribute("alllist6", alllist6);
		model.addAttribute("alllist5", alllist5);

		if (loginId == null || division.equals("business")) {
			return "chart/graph1";
		}

		String list5 = mmapper.getCafegraph5(loginId);
		String list6 = mmapper.getCafegraph6(loginId);
		String list7 = mmapper.getCafegraph7(loginId);
		String list8 = mmapper.getCafegraph8(loginId);
		String list9 = mmapper.getCafegraph9(loginId);

		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);
		model.addAttribute("list7", list7);
		model.addAttribute("list8", list8);
		model.addAttribute("list9", list9);

		return "chart/graph1";
	}

	// 업체 그래프 페이지
	@RequestMapping(value = "graph2", method = RequestMethod.GET)
	public String graph2(HttpSession session, Model model) {

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

		String loginId = null;
		loginId = (String) session.getAttribute("loginId");
		ChartDAO mmapper = sqlSession.getMapper(ChartDAO.class);
		String division = (String) session.getAttribute("division");

		int alllist9 = mmapper.getAllgraph9();
		int alllist8 = mmapper.getAllgraph8();
		int alllist7 = mmapper.getAllgraph7();
		int alllist6 = mmapper.getAllgraph6();
		int alllist5 = mmapper.getAllgraph5();

		model.addAttribute("alllist9", alllist9);
		model.addAttribute("alllist8", alllist8);
		model.addAttribute("alllist7", alllist7);
		model.addAttribute("alllist6", alllist6);
		model.addAttribute("alllist5", alllist5);

		if (loginId == null || division.equals("cafe")) {
			return "chart/graph2";
		}

		String list5 = mmapper.getBusigraph5(loginId);
		String list6 = mmapper.getBusigraph6(loginId);
		String list7 = mmapper.getBusigraph7(loginId);
		String list8 = mmapper.getBusigraph8(loginId);
		String list9 = mmapper.getBusigraph9(loginId);

		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);
		model.addAttribute("list7", list7);
		model.addAttribute("list8", list8);
		model.addAttribute("list9", list9);

		return "chart/graph2";
	}
}