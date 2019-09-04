package global.sesoc.projectEC.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import global.sesoc.projectEC.vo.Member;
import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.dao.MemberDAO;

@Controller
@RequestMapping("member")
@SessionAttributes("member")
public class MemberUpdateController {

	private static final Logger logger = LoggerFactory.getLogger(MemberUpdateController.class);

	final String uploadPath = "/imgQRCode"; // 파일 업로드 경로

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	MemberDAO dao;

	// 회원정보 수정 폼 보기
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(HttpSession session, Model model) {
		// 세션의 로그인ID로 개인정보를 검색하여 모델에 저장
		String id = (String) session.getAttribute("loginId");
		Member member = dao.get(id);

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
	    
		return "member/updateForm";
	}

	// 회원정보 수정 처리
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("member") Member member, Model model) {

		int result = dao.update(member);

		if (result != 1) {
			// DB update에 실패한 경우 alert() 출력용 메시지를 모델에 저장
			model.addAttribute("errorMsg", "Failed to update!");
			return "member/updateForm";
		}
		return "redirect:updateComplete";
	}

	// 회원정보 수정 처리 완료
	@RequestMapping(value = "updateComplete", method = RequestMethod.GET)
	public String updateComplete(@ModelAttribute("member") Member member, SessionStatus sessionStatus,
			HttpSession session, Model model) {

		// 수정된 정보를 세션에도 반영 (로그인한 사용자 이름)
		session.setAttribute("loginName", member.getName());

		// 수정 처리된 정보를 모델에 저장
		model.addAttribute("result", member);
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
	    
		return "member/updateComplete";
	}

	// show QR
	@RequestMapping(value = "showQR", method = RequestMethod.GET)
	public String showQR(HttpSession session, String custid, Model model, HttpServletResponse response) {

		String id = (String) session.getAttribute("loginId");
		Member member = dao.get(id);

		// 저장된 파일 경로
		String fullPath = uploadPath + "/" + member.getQrcode();

		try {
			response.setHeader("Content-Disposition", " attachment;filename=" + URLEncoder.encode(fullPath, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		// 서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;

		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();

			// Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);

			filein.close();
			fileout.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}