package global.sesoc.projectEC.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.projectEC.HomeController;
import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.dao.MemberMapper;
import global.sesoc.projectEC.dao.ReservationDAO;
import global.sesoc.projectEC.vo.Member;
import global.sesoc.projectEC.vo.ReservationVO;

@Controller
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired
	SqlSession sqlsession;

	// memberMap들어가기 , ajax 요청을 받았으므로 제이슨 데이터를 작성해서 리턴함
	@RequestMapping(value = "menu/getMap", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Member> getMap() {

		System.out.println("=======================+++++++++++++++++");
		logger.debug("memberMap시작");
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		ArrayList<Member> list = mapper.selectAll();
		logger.debug("list:{}", list);
		return list;
	}

	// 스케줄 저장
	// @ResponseBody
	@RequestMapping(value = "menu/insertschedule", method = RequestMethod.POST)
	public String insertschdule(ReservationVO reservation, Model model, HttpSession session) {
		System.out.println(reservation);

		ReservationDAO dao = sqlsession.getMapper(ReservationDAO.class);
		int result = dao.schduleAdd(reservation);
		System.out.println(result);
		return "menu/schedule";
	}

	// 스케줄 읽어오기
	@RequestMapping(value = "menu/scheduleRead", method = RequestMethod.POST)
	public @ResponseBody ArrayList<ReservationVO> scheduleRead(HttpSession session) {
		// System.out.println(temp);
		// 로그인 한 아이디와 이름 받고
		System.out.println("====================제발좀 나와라=========================");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인 아이디 " + loginId);
		ReservationDAO dao = sqlsession.getMapper(ReservationDAO.class);
		int result = dao.reserdatecheck();
		System.out.println("삭제된거임.");
		System.out.println(result);
		ArrayList<ReservationVO> reserlist = dao.readReservation(loginId);
		System.out.println(reserlist);
		return reserlist;
	}

	// 예약확인 들어가기
	@RequestMapping(value = "menu/reserconfirm", method = RequestMethod.GET)
	public String schedule(int resernum, Model model) {
		
		// 순위 변동
		ChartDAO mapper = sqlsession.getMapper(ChartDAO.class);
		ArrayList<String> scoreList = new ArrayList<>();

		scoreList = mapper.getCafescore();
		System.out.println(scoreList.size());
		String cafe1 = scoreList.get(0);
		String cafe2 = scoreList.get(1);
		String cafe3 = scoreList.get(2);
		      
		model.addAttribute("cafe1", cafe1);
		model.addAttribute("cafe2", cafe2);
		model.addAttribute("cafe3", cafe3);
		
		ReservationDAO dao = sqlsession.getMapper(ReservationDAO.class);
		ReservationVO reserconfirm = dao.reserconfirm(resernum);
		String condition = reserconfirm.getMsg();
		if (condition.equals("d")) {
			model.addAttribute("msg", "Your request has been sent successfully!");
		} else if (condition.equals("t")) {
			model.addAttribute("msg", "Your request has been accepted!");
		} else if (condition.equals("f")) {
			model.addAttribute("msg", "Your request has been refused!");
		}

		model.addAttribute("reserconfirm", reserconfirm);

		return "reserconfirm";
	}

	// 예약 삭제하기
	@RequestMapping(value = "menu/reserdelete", method = RequestMethod.GET)
	public String reserdelete(int resernum, Model model, HttpSession session) {
		ReservationDAO dao = sqlsession.getMapper(ReservationDAO.class);
		int result = dao.reserdelete(resernum);
		System.out.println(result);
		System.out.println("삭제완료");
		return "redirect:/menu/schedule";
	}
}