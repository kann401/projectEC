package global.sesoc.projectEC.controller;

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
public class MemberJoinController {

	@Autowired
	MemberDAO dao;
	
	// 회원 가입 폼 보기
	@RequestMapping (value="join", method=RequestMethod.GET)
	public String joinForm(Model model) {
		// 빈 VO객체를 만들어 세션에 저장
		Member member = new Member();
		model.addAttribute("member", member);
		return "member/joinForm";
	}
	
	// 회원 가입 처리
	@RequestMapping (value="join", method=RequestMethod.POST)
	public String join(
			@ModelAttribute("member") Member member,
			Model model) {

		int result = dao.insert(member);
		if (result != 1) {
			// DB저장에 실패한 경우 alert() 출력용 메시지를 모델에 저장
			model.addAttribute("errorMsg", "Failed to join!");
			return "member/joinForm";
		}
		return "redirect:joinComplete";
	}
	
	// 회원 가입 처리 완료
	@RequestMapping(value="joinComplete", method=RequestMethod.GET)
	public String joinComplete(
			@ModelAttribute("member") Member member,
			SessionStatus sessionStatus,
			Model model) {
			
		// 가입 처리된 ID를 모델에 저장
		model.addAttribute("id", member.getCustid());
		sessionStatus.setComplete();
			
		return "member/joinComplete";
	}
		
	// ID 중복 확인 폼 보기
	@RequestMapping(value="pop_post", method=RequestMethod.GET)
	public String poppost(Model model) {
		// 검색 전 후 확인용
		model.addAttribute("pop_post", false);
		return "member/pop_post";
	}
		
	// ID 중복 확인 폼 보기
	@RequestMapping(value="idcheck", method=RequestMethod.GET)
	public String idcheck(Model model) {
		// 검색 전 후 확인용
		model.addAttribute("search", false);
		return "member/idcheck";
	}
		
	// ID 중복 검사
	@RequestMapping(value="idcheck", method=RequestMethod.POST)
	public String idcheck(String searchId, Model model) {
		// ID 검색
		Member m = dao.get(searchId);
			
		// 검색ID와 검색 결과, 검색전후 확인용 값 저장
		model.addAttribute("searchId", searchId);
		model.addAttribute("searchResult", m);
		model.addAttribute("search", true);
					
		return "member/idcheck";
	}
}