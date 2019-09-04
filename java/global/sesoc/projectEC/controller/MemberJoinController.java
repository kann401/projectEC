package global.sesoc.projectEC.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.dao.MemberDAO;
import global.sesoc.projectEC.vo.Member;

@Controller
@RequestMapping("member")
@SessionAttributes("member")
public class MemberJoinController {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	MemberDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(MemberJoinController.class);

	// 회원 가입 폼 보기
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinForm(Model model) {
		// 빈 VO객체를 만들어 세션에 저장
		Member member = new Member();
		model.addAttribute("member", member);
		
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
	    
		return "member/joinForm";
	}

	// 회원 가입 처리
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute("member") Member member, Model model) {

		int result = dao.insert(member);
		if (result != 1) {
			// DB저장에 실패한 경우 alert() 출력용 메시지를 모델에 저장
			model.addAttribute("errorMsg", "Failed to join!");
			return "member/joinForm";
		}
		return "redirect:joinComplete";
	}

	// 회원 가입 처리 완료
	@RequestMapping(value = "joinComplete", method = RequestMethod.GET)
	public String joinComplete(@ModelAttribute("member") Member member, SessionStatus sessionStatus, Model model) {

		// 가입 처리된 ID를 모델에 저장
		model.addAttribute("id", member.getCustid());
		sessionStatus.setComplete();
		
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

		return "member/joinComplete";
	}

	// 주소창 보기
	@RequestMapping(value = "pop_post", method = RequestMethod.GET)
	public String poppost(Model model) {
		// 검색 전 후 확인용
		model.addAttribute("pop_post", false);
		return "member/pop_post";
	}

	// ID 중복 확인 폼 보기
	@RequestMapping(value = "idcheck", method = RequestMethod.GET)
	public String idcheck(Model model) {
		// 검색 전 후 확인용
		model.addAttribute("search", false);
		return "member/idcheck";
	}

	// ID 중복 검사
	@RequestMapping(value = "idcheck", method = RequestMethod.POST)
	public String idcheck(String searchId, Model model) {
		// ID 검색
		Member m = dao.get(searchId);

		// 검색ID와 검색 결과, 검색전후 확인용 값 저장
		model.addAttribute("searchId", searchId);
		model.addAttribute("searchResult", m);
		model.addAttribute("search", true);

		return "member/idcheck";
	}

	// My Page 확인
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {

		String id = (String) session.getAttribute("loginId");

		Member member = dao.get(id);
		model.addAttribute("member", member);

		System.out.println("who");
		
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
	    
		return "member/myPage";
	}

	// My Page에서 Print
	@RequestMapping(value = "printForm", method = RequestMethod.GET)
	public String printForm() {

		return "member/printForm";
	}

	// QR코드 이미지 저장
	@ResponseBody
	@RequestMapping(value = "setQRImage", method = RequestMethod.POST)
	public String setQRImage(HttpServletRequest request, Model model, Member member) {
		/* 서버측 코드 (jsp), ase64 인코딩 문자열을 수신하여 원래의 이미지 데이터로 디코딩하여 이미지 파일에 저장한다 */
		logger.debug("QRCode ajax들어옴");
		logger.debug(member.getCustid());
		String sign = StringUtils.split(request.getParameter("qrImage"), ",")[1];
		String fileName = "";
		// 파일 저장
		try {
			fileName = "QRCode_" + member.getCustid() + "_" + System.currentTimeMillis() + ".png";
			FileUtils.writeByteArrayToFile(new File("c:\\imgQRCode/" + fileName), Base64.decodeBase64(sign));
			logger.debug("qr코드 파일이름 :  {} ", fileName);
			member.setQrcode(fileName);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		logger.debug("qr : {}", member);
		// QR코드파일이름도 DB에도 저장
		int result = dao.updateQR(member);
		// if (result != 1) {
		// // DB저장에 실패한 경우 alert() 출력용 메시지를 모델에 저장
		// model.addAttribute("errorMsg", "Failed to join!");
		// return "member/joinForm";
		// }

		return fileName;
	}

}