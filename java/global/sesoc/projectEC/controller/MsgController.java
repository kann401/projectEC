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

import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.dao.MessageDAO;
import global.sesoc.projectEC.vo.ReservationVO;

@Controller
public class MsgController {

	@Autowired
	SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);

	@RequestMapping(value = "mailbox1", method = RequestMethod.GET)
	public String mailbox1(HttpSession session, Model model) {
		
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
		
		MessageDAO mmapper = sqlSession.getMapper(MessageDAO.class);
		// 일단 쿼리에 쓸 로그인된 아이디를 불러온다.
		String loginId = (String) session.getAttribute("loginId");

		// 카페아이디/ 카페이름/ 예약날짜/ 예약시간을 받아온다.
		ArrayList<ReservationVO> forMessage = new ArrayList<>();
		ArrayList<ReservationVO> finList = new ArrayList<>();
		ArrayList<ReservationVO> notList = new ArrayList<>();

		// success 가 0이든 1이든 다 불러온다.
		forMessage = mmapper.getBusimessage(loginId);

		// //여기서 0인 값을 따로 담고 , 1인 값을 따로 담자.
		// for (int i = 0; i < forMessage.size(); i++) {
		// if(forMessage.get(i).getSuccess().equals("0")) {
		// notList.add(forMessage.get(i));
		// }else{
		// finList.add(forMessage.get(i));
		// }
		// }

		// 넘길 값들 확인.
		logger.debug("포워딩할 카페 정보 : {}", forMessage);
		logger.debug("포워딩할 카페 정보 : {}", forMessage);

		// msgcheck를 위한 읽은 메시지가 몇개인지 계산한다.
		int readcount = 0;
		for (int i = 0; i < forMessage.size(); i++) {
			if (forMessage.get(i).getMsgcheck().equals("0")) {
				System.out.println("0이므로 스킵!");
			} else {
				readcount++;

			}
		}
		System.out.println("읽은 쪽지의 수 : " + readcount);

		// model.addAttribute("cafename", cafeName);
		// model.addAttribute("cafeid", cafeId);
		// model.addAttribute("reserdate", c);
		model.addAttribute("formessage", forMessage);
		model.addAttribute("readcount", readcount);
		return "message/mailbox1";

	}

	@RequestMapping(value = "msgcheck", method = RequestMethod.POST)
	public String msgcheck(String resernum, Model model, HttpSession session) {
		MessageDAO mapper = sqlSession.getMapper(MessageDAO.class);
		String division = (String) session.getAttribute("division");

		// 값을 제대로 받아왔는지 확인
		System.out.println("넘겨받은 resernum : " + resernum);
		if (division.equals("business")) {
			// resernum을 이용하여 예약 테이블의 해당 예약번호의 msgcheck컬럼을 1로 변경(읽음 상태)
			int count = mapper.updateMsgcheck1(resernum);
			System.out.println("업체로그인, 읽은 메시지로 업데이트 된 개수 : " + count);
			int reser = Integer.parseInt(resernum);

			if (count == 0) {
				System.out.println("msgcheck 업데이트 실패");

			}
			session.setAttribute("resernum", reser);
			return "redirect:/showmsg";
		} else {
			// 카페 로그인 상태라면 resernum만 살려서 session에 덮어쓰고 가져간다.
			int reser = Integer.parseInt(resernum);
			// 수락한 메시지 중 읽은 상태로 만들어 줘야 하므로 msgcheck를 '2'로 업데이트 해주어야 한다.
			int count = mapper.updateMsgcheck2(resernum);
			System.out.println("카페로그인, 읽은 메시지(2)로 업데이트 된 개수: " + count);
			session.setAttribute("resernum", reser);

		}
		return "redirect:/showmsg";
	}

	@RequestMapping(value = "showmsg", method = RequestMethod.GET)
	public String showmsg(HttpSession session, Model model) {
		
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
		
		MessageDAO mmapper = sqlSession.getMapper(MessageDAO.class);
		// 로그인 되어있는 유저가 카페/업체인지 구분해줄 division
		String division = (String) session.getAttribute("division");

		// 일단 쿼리에 쓸 로그인된 아이디를 불러온다.
		String loginId = (String) session.getAttribute("loginId");
		int resernum = (int) session.getAttribute("resernum");
		System.out.println("showmsg에서 넘겨받은 resernum" + resernum);

		// session.removeAttribute("resernum"); -- 나중에 삭제 해주어야 한다.

		// 업체 로그인의 경우
		if (division.equals("business")) {
			ArrayList<ReservationVO> forMessage = new ArrayList<>();
			ArrayList<ReservationVO> forContent = new ArrayList<>();

			// 해당하는 id의 예약테이블에서 전체건수의 카페아이디/ 카페이름/ 예약날짜/ 예약시간을 받아온다.
			forMessage = mmapper.getBusimessage(loginId);

			// resernum를 이용해서 예약테이블에 저장되어 있는 데이터와 내가 누른글의 일치하는 정보를 불러온다.
			for (int i = 0; i < forMessage.size(); i++) {
				if (forMessage.get(i).getResernum() == resernum) {
					forContent.add(forMessage.get(i));
				}
			}

			System.out.println("메시지를 위한 reservation 객체 = " + forContent.get(0).toString());

			// 쪽지 개수 계산을 위해 넘길 값들 확인.

			// msgcheck를 위한 읽은 메시지가 몇개인지 계산한다.
			int readcount = 0;
			for (int i = 0; i < forMessage.size(); i++) {
				if (forMessage.get(i).getMsgcheck().equals("0")) {
					System.out.println("0이므로 스킵!");
				} else {
					readcount++;

				}
			}
			System.out.println("읽은 쪽지의 수 : " + readcount);

			model.addAttribute("formessage", forMessage);
			model.addAttribute("readcount", readcount);
			model.addAttribute("forcontent", forContent);

			return "message/mailbox2";

		} else { // 카페 로그인의 경우
			// 불러올 업체 목록의 조건 : resernum, success=0, msg=t
			System.out.println("카페로그인 , 받아온 resernum = " + resernum);

			// 담을 그릇 만들기
			ArrayList<ReservationVO> trueMessage = new ArrayList<>();
			ArrayList<ReservationVO> falseMessage = new ArrayList<>();
			ArrayList<ReservationVO> finishMessage = new ArrayList<>();
			ReservationVO result = new ReservationVO();

			trueMessage = mmapper.getTruemessage(loginId);
			falseMessage = mmapper.getDenymessage(loginId);
			finishMessage = mmapper.getFinishmessage(loginId);

			int trueCount = trueMessage.size();
			int falseCount = falseMessage.size();
			int finishCount = finishMessage.size();

			for (int i = 0; i < trueMessage.size(); i++) {
				if (trueMessage.get(i).getResernum() == resernum) {
					result = trueMessage.get(i);

				}
			}

			if (result.getResernum() == 0) {
				for (int i = 0; i < falseMessage.size(); i++) {
					if (falseMessage.get(i).getResernum() == resernum) {
						result = falseMessage.get(i);
						System.out.println("falsemessage = " + result.toString());
					}
				}
			}

			if (result.getResernum() == 0) {
				for (int i = 0; i < finishMessage.size(); i++) {
					if (finishMessage.get(i).getResernum() == resernum) {
						result = finishMessage.get(i);
					}
				}
			}

			model.addAttribute("truecount", trueCount);
			model.addAttribute("falsecount", falseCount);
			model.addAttribute("finishcount", finishCount);
			model.addAttribute("list", result);

			System.out.println("카페로그인 상태에서 메시지 본문을 띄울 목록 = " + result.toString());
			return "message/mailbox2";

		}
	}

	// 새로운 메시지함
	@RequestMapping(value = "notreadmsg", method = RequestMethod.GET)
	public String notreadmsg(HttpSession session, Model model) {
		
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
		
		MessageDAO mmapper = sqlSession.getMapper(MessageDAO.class);
		// 일단 쿼리에 쓸 로그인된 아이디와 division을 불러온다.
		String loginId = (String) session.getAttribute("loginId");
		String division = (String) session.getAttribute("division");
		// 카페아이디/ 카페이름/ 예약날짜/ 예약시간을 받아온다.
		ArrayList<ReservationVO> forMessage = new ArrayList<>();
		ArrayList<ReservationVO> notReadmessage = new ArrayList<>();

		int readcount = 0;

		// 현재 로그인 한 유저가 기업이라면..
		if (division.equals("business")) {
			// 안읽은 메시지를 읽어온다.
			forMessage = mmapper.getBusimessage(loginId);

			// 현재 DB에 있는 모든 메시지의 개수
			int allCount = mmapper.getAllcount(loginId);
			System.out.println("allCount는 ? = " + allCount);

			// msgcheck를 위한 읽은 메시지가 몇개인지 계산한다.
			for (int i = 0; i < forMessage.size(); i++) {
				if (forMessage.get(i).getMsgcheck().equals("0")) {
					System.out.println("0이므로 스킵!");
				} else {
					readcount++;
				}
			}

			// 안읽은 메시지만 추려서 보내준다.
			for (int i = 0; i < forMessage.size(); i++) {
				if (forMessage.get(i).getMsgcheck().equals("0")) {
					notReadmessage.add(forMessage.get(i));
				}
			}

			model.addAttribute("allcount", allCount);
			model.addAttribute("readcount", readcount);
			model.addAttribute("formessage", notReadmessage);
			return "message/mailbox1-1";

		} else { // 카페 로그인의 경우
			ArrayList<ReservationVO> trueMessage = new ArrayList<>();
			ArrayList<ReservationVO> falseMessage = new ArrayList<>();
			ArrayList<ReservationVO> finishMessage = new ArrayList<>();

			trueMessage = mmapper.getTruemessage(loginId);
			falseMessage = mmapper.getDenymessage(loginId);
			finishMessage = mmapper.getFinishmessage(loginId);

			int trueCount = trueMessage.size();
			int falseCount = falseMessage.size();
			int finishCount = finishMessage.size();

			model.addAttribute("truecount", trueCount);
			model.addAttribute("falsecount", falseCount);
			model.addAttribute("finishcount", finishCount);
			model.addAttribute("list", trueMessage);

		}
		// 수락한 값들만 담아서 보낸다.
		return "message/mailbox1";
	}

	// 읽은 메시지함
	@RequestMapping(value = "readmsg", method = RequestMethod.GET)
	public String readmsg(HttpSession session, Model model) {
		
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
		
		MessageDAO mmapper = sqlSession.getMapper(MessageDAO.class);
		// 일단 쿼리에 쓸 로그인된 아이디를 불러온다.
		String loginId = (String) session.getAttribute("loginId");

		// 카페아이디/ 카페이름/ 예약날짜/ 예약시간을 받아온다.
		ArrayList<ReservationVO> forMessage = new ArrayList<>();

		forMessage = mmapper.getBusimessage(loginId);
		// 넘길 값들 확인.
		logger.debug("포워딩할 카페 정보 : {}", forMessage);

		// msgcheck를 위한 읽은 메시지가 몇개인지 계산한다.
		int readcount = 0;
		for (int i = 0; i < forMessage.size(); i++) {
			if (forMessage.get(i).getMsgcheck().equals("0")) {
				System.out.println("0이므로 스킵!");
			} else {
				readcount++;
			}
		}
		System.out.println("읽은 쪽지의 수 : " + readcount);

		model.addAttribute("formessage", forMessage);
		model.addAttribute("readcount", readcount);
		return "message/mailbox1-2";
	}

	// msg 컬럼 조절 수락 메서드
	@RequestMapping(value = "msgchanget", method = RequestMethod.POST)
	public String msgchange(int resernum) {
		MessageDAO mapper = sqlSession.getMapper(MessageDAO.class);
		int count = mapper.updateMsgt(resernum);

		if (count == 0) {
			System.out.println("MSG컬럼 t로 업데이트 실패");
			return "redirect:/";
		}

		System.out.println("MSG컬럼 t로 정상 업데이트 성공");
		return "redirect:showmsg";
	}

	// msg 컬럼 조절 거절 메서드
	@RequestMapping(value = "msgchangef", method = RequestMethod.POST)
	public String msgchangef(int resernum) {
		MessageDAO mapper = sqlSession.getMapper(MessageDAO.class);
		int count = mapper.updateMsgf(resernum);

		if (count == 0) {
			System.out.println("MSG컬럼 f로 업데이트 실패");
			return "redirect:/";
		}

		System.out.println("MSG컬럼 f로 정상 업데이트 성공");
		return "redirect:mailbox1";
	}

	// 업체로 로그인 했을 때 쪽지 컨트롤러
	@ResponseBody
	@RequestMapping(value = "busiMemocheck", method = RequestMethod.GET)
	public ArrayList<ReservationVO> busiMemocheck(HttpSession session, Model model) {
		
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

		// 이 함수로 새로운 쪽지를 확인하게 하고 새로운 쪽지 msgcheck=0 결과값이 0이 아닐 시 알람, redirect로
		// notreadmsg연결
		MessageDAO mmapper = sqlSession.getMapper(MessageDAO.class);
		ArrayList<ReservationVO> memolist = new ArrayList<>();
		String loginId = (String) session.getAttribute("loginId");

		// 확인 안한 메시지가 있는지 DB검색
		memolist = mmapper.getNewmessage(loginId);

		System.out.println("mm" + memolist);
		System.out.println("결과값의 개수는 = " + memolist.size());

		if (memolist.size() == 0) {
			System.out.println("쪽지 DB에 없거나 불러오지 못함");
		}

		return memolist;
	}

	// 카페로 로그인 했을 때 쪽지 컨트롤러
	@ResponseBody
	@RequestMapping(value = "cafeMemocheck", method = RequestMethod.GET)
	public ArrayList<ReservationVO> cafeMemocheck(HttpSession session, Model model) {
		
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

		MessageDAO mmapper = sqlSession.getMapper(MessageDAO.class);
		ArrayList<ReservationVO> memolist = new ArrayList<>();
		String loginId = (String) session.getAttribute("loginId");

		// 업체가 수락을 누른 건수의 resernum을 가져온다.
		memolist = mmapper.getNotreadtrue(loginId);
		if (memolist == null || memolist.size() == 0) {
			System.out.println("DB에 없거나 불러오지 못함1");
		} else {
			System.out.println("결과값의 개수는 = " + memolist.size());

			return memolist;
		}

		memolist = mmapper.getNotreadfalse(loginId);
		if (memolist == null || memolist.size() == 0) {
			System.out.println("DB에 없거나 불러오지 못함2");
		} else {
			System.out.println("결과값의 개수는 = " + memolist.size());
			return memolist;
		}

		memolist = mmapper.getNotreadfinish(loginId);
		if (memolist == null || memolist.size() == 0) {
			System.out.println("DB에 없거나 불러오지 못함3");
		} else {
			System.out.println("결과값의 개수는 = " + memolist.size());
		}
		return memolist;

	}

	@RequestMapping(value = "alarm", method = RequestMethod.GET)
	public String memocheck2() {

		return "message/alarm";
	}

	// 카페 로그인시 거절한 목록 가져가기
	@RequestMapping(value = "falselist", method = RequestMethod.GET)
	public String falselist(HttpSession session, Model model) {
		
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
		
		MessageDAO mmapper = sqlSession.getMapper(MessageDAO.class);

		// 일단 쿼리에 쓸 로그인된 아이디와 division을 불러온다.
		String loginId = (String) session.getAttribute("loginId");

		ArrayList<ReservationVO> trueMessage = new ArrayList<>();
		ArrayList<ReservationVO> falseMessage = new ArrayList<>();
		ArrayList<ReservationVO> finishMessage = new ArrayList<>();
		ReservationVO result = new ReservationVO();
		// int resernum = (int)session.getAttribute("resernum");

		trueMessage = mmapper.getTruemessage(loginId);
		falseMessage = mmapper.getDenymessage(loginId);
		finishMessage = mmapper.getFinishmessage(loginId);

		int trueCount = trueMessage.size();
		int falseCount = falseMessage.size();
		int finishCount = finishMessage.size();

		// for (int i = 0; i < falseMessage.size(); i++) {
		// if(falseMessage.get(i).getResernum() == resernum) {
		// result = falseMessage.get(i);
		// }
		// }

		model.addAttribute("truecount", trueCount);
		model.addAttribute("falsecount", falseCount);
		model.addAttribute("finishcount", finishCount);
		model.addAttribute("list", falseMessage);

		return "message/mailbox1-1";
	}

	// 카페 로그인시 완료된 목록 가져가기
	@RequestMapping(value = "finishlist", method = RequestMethod.GET)
	public String finishlist(HttpSession session, Model model) {
		
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
		
		MessageDAO mmapper = sqlSession.getMapper(MessageDAO.class);

		// 일단 쿼리에 쓸 로그인된 아이디와 division을 불러온다.
		String loginId = (String) session.getAttribute("loginId");

		ArrayList<ReservationVO> trueMessage = new ArrayList<>();
		ArrayList<ReservationVO> falseMessage = new ArrayList<>();
		ArrayList<ReservationVO> finishMessage = new ArrayList<>();
		ReservationVO result = new ReservationVO();
		// int resernum = (int)session.getAttribute("resernum");

		trueMessage = mmapper.getTruemessage(loginId);
		falseMessage = mmapper.getDenymessage(loginId);
		finishMessage = mmapper.getFinishmessage(loginId);

		int trueCount = trueMessage.size();
		int falseCount = falseMessage.size();
		int finishCount = finishMessage.size();

		// for (int i = 0; i < finishMessage.size(); i++) {
		// if(finishMessage.get(i).getResernum() == resernum) {
		// result = finishMessage.get(i);
		// }
		// }

		model.addAttribute("truecount", trueCount);
		model.addAttribute("falsecount", falseCount);
		model.addAttribute("finishcount", finishCount);
		model.addAttribute("list", finishMessage);

		return "message/mailbox1-2";
	}

	@RequestMapping(value = "falsecontent", method = RequestMethod.POST)
	public String falsecontent(int resernum, Model model, HttpSession session) {
		MessageDAO mapper = sqlSession.getMapper(MessageDAO.class);
		// 값을 제대로 받아왔는지 확인
		System.out.println("넘겨받은 resernum : " + resernum);

		// 수락한 메시지 중 읽은 상태로 만들어 줘야 하므로 msgcheck를 '2'로 업데이트 해주어야 한다.
		int count = mapper.updateMsgcheck2(resernum + "");
		System.out.println("카페로그인, 읽은 메시지(2)로 업데이트 된 개수: " + count);

		session.setAttribute("resernum", resernum);
		return "redirect:/showmsg";

	}

	// 임시 적으로 메시지를 지울수 있게 하는 기능.(DB에는 남아 있지만 리스트에서는 안보이게)
	@RequestMapping(value = "tempdelete", method = RequestMethod.POST)
	public String tempDelete(String resernum, HttpSession session) {
		MessageDAO mapper = sqlSession.getMapper(MessageDAO.class);
		String division = (String) session.getAttribute("division");

		// 메시지함에서 x를 눌렀을 때 msg컬럼을 s로 업데이트(노출목록에서 제외)
		int count = mapper.tempDelete(resernum);

		if (count == 0) {
			System.out.println("msg컬럼 s로 업데이트 실패");
		} else {
			System.out.println("msg컬럼 s로 업데이트 성공");
		}

		// 삭제 버튼시 자동으로 mshcheck 2로 업뎃
		mapper.updateMsgcheck2(resernum);

		// 업체 로그인 경우
		if (division.equals("business")) {
			// session.setAttribute("resernum", resernum);
			return "redirect:mailbox1";
		}

		// 카페 로그인의 경우
		// session.setAttribute("resernum", resernum);
		return "redirect:notreadmsg";
	}

	/*
	 * @RequestMapping(value = "tempdelete2", method = RequestMethod.POST)
	 * public String tempdelete2(HttpSession session, String resernum) {
	 * MessageDAO mapper = sqlSession.getMapper(MessageDAO.class); String
	 * division = (String)session.getAttribute("division");
	 * 
	 * //삭제 버튼시 자동으로 mshcheck 2로 업뎃 mapper.updateMsgcheck2(resernum);
	 * 
	 * 
	 * 
	 * return ""; }
	 */

	@RequestMapping(value = "updateX", method = RequestMethod.POST)
	public String please(HttpSession session, String resernum) {
		/*
		 * 메소드 조건: 1.msgcheck가 1 or 3 이면 카페측에 완료메시지와 X표시 노출 2.msgcheck가 1 or 2
		 * 이면 업체측에 완료메시지와 X표시 노출
		 */
		MessageDAO mapper = sqlSession.getMapper(MessageDAO.class);
		String division = (String) session.getAttribute("division");
		// String resernum = (String)session.getAttribute("resernum");
		int check = 0;
		if (division.equals("cafe")) { // 카페 로그인일 경우
			int success = mapper.getsuccess(resernum);

			System.out.println("success의 값은 : " + success);
			if (success == 1) { // 카페가 먼저 선일 경우
				int count = mapper.updateMsgcheck2(resernum);

				if (count != 0) { // 카페가 선일 경우 컬럼을 2로 업데이트 하고, 분기처리를 위한 check값을
									// 1로 지정.
					check = 1;
				} else {
					System.out.println("success를 2로 업데이트 실패");
				}

				// 현재 컬럼값은 2, 카페측에선 항목이 사라졌지만 업체측에선 아직 보인다.
				session.removeAttribute("resernum");
				return "redirect:finishlist";

			} else { // 업체가 먼저 선일 경우 (msgcheck = 3) -> 4로 업데이트해서 양쪽모두 노출되지 않도록
						// 한다.
				int count = mapper.updateSuccess4(resernum);

				if (count == 0) {
					System.out.println("msgcheck를 4로 업데이트 실패");
				}
				// 컬럼이 4로 업데이트되어서 양쪽모두 노출되지 않는다.
				session.removeAttribute("resernum");
				return "redirect:finishlist";
			}
		} else { // 업체 로그인일 경우
			int success = mapper.getsuccess(resernum);

			System.out.println("success의 값은 : " + success);
			if (success == 1) { // 업체가 선일 경우
				int count = mapper.updateSuccess3(resernum);

				if (count != 0) { // 업체가 선일 경우 컬럼을 3으로 업데이트 하고, 분기처리를 위한 check값
									// 설정
					check = 1;
				} else {
					System.out.println("msgcheck를 3으로 업데이트 실패");
				}
				// 현재 컬럼값은 3, 카페측에선 항목이 사라졌지만 업체측에선 보인다.
				session.removeAttribute("resernum");
				return "redirect:mailbox1";

			} else { // 카페가 먼저 X를 누른경우, 컬럼값은 현재 2, 4fh 업데이트해서 양쪽모두 노출되지 않도록 한다.
				int count = mapper.updateSuccess4(resernum);

				if (count == 0) {
					System.out.println("msgcheck를 4로 업데이트 실패");
				}
				// 컬럼이 4로 업데이트되어서 양쪽 모두 노출되지 않는다.
			}
		}
		session.removeAttribute("resernum");
		return "redirect:mailbox1";
	}
}