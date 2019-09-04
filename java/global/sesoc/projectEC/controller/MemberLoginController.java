package global.sesoc.projectEC.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.projectEC.dao.MemberMapper;
import global.sesoc.projectEC.vo.Member;
import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.dao.MemberDAO;

@Controller
@RequestMapping("member")
public class MemberLoginController {

   @Autowired
   SqlSession sqlSession;

   @Autowired
   MemberDAO dao;

   // 로그인 폼
   @RequestMapping(value = "login", method = RequestMethod.GET)
   public String login(Model model) {
	   
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
	   
      return "member/loginForm";
   }

   // 로그인
   @RequestMapping(value = "login", method = RequestMethod.POST)
   public String login(String id, String password, Model model, HttpSession session, RedirectAttributes rat) {

      MemberMapper dao = sqlSession.getMapper(MemberMapper.class);
      Member member = dao.selectMember(id);
      int count = dao.ecomark(id);
      
      System.out.println(count);
      if (member != null && member.getPassword().equals(password)) {
         session.setAttribute("loginId", member.getCustid());
         session.setAttribute("loginName", member.getName());

         // 추가한 코드 ! division을 갖고 넘어간다.
         session.setAttribute("division", member.getDivision());
         session.setAttribute("count", count);
         
         rat.addFlashAttribute("loginOK", "WELLCOME :)");
         
         return "redirect:/mainHome";
      } else {
    	  rat.addFlashAttribute("errorMsg", "Unable to Login!");

          return "redirect:/member/login";
      }
   }

   // 로그아웃
   @RequestMapping(value = "logout", method = RequestMethod.GET)
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/mainHome";
   }
}