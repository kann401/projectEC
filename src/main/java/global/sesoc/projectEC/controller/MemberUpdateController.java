package global.sesoc.projectEC.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import global.sesoc.projectEC.vo.Member;
import global.sesoc.projectEC.dao.MemberDAO;

@Controller
@RequestMapping("member")
@SessionAttributes("member")
public class MemberUpdateController {

	@Autowired
	MemberDAO dao;
	
	// 회원정보 수정 폼 보기
	@RequestMapping (value="update", method=RequestMethod.GET)
	public String updateForm(HttpSession session, Model model) {
		// 세션의 로그인ID로 개인정보를 검색하여 모델에 저장
		String id = (String) session.getAttribute("loginId");
		Member member = dao.get(id);
			
		model.addAttribute("member", member);
		return "member/updateForm";
	}
		
	// 회원정보 수정 처리
	@RequestMapping (value="update", method=RequestMethod.POST)
	public String update(
			@ModelAttribute("member") Member member,
			Model model) {
			
		int result = dao.update(member);
			
		if (result != 1) {
			// DB update에 실패한 경우 alert() 출력용 메시지를 모델에 저장
			model.addAttribute("errorMsg", "Failed to update!");
			return "member/updateForm";
		}
		return "redirect:updateComplete";
	}
		
	// 회원정보 수정 처리 완료
	@RequestMapping(value="updateComplete", method=RequestMethod.GET)
	public String updateComplete(
			@ModelAttribute("member") Member member,
			SessionStatus sessionStatus,
			HttpSession session,
			Model model) {
			
		// 수정된 정보를 세션에도 반영 (로그인한 사용자 이름)
		session.setAttribute("loginName", member.getName());
			
		// 수정 처리된 정보를 모델에 저장
		model.addAttribute("result", member);
		sessionStatus.setComplete();
		
		return "member/updateComplete";
	}
}
