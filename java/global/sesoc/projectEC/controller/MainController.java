package global.sesoc.projectEC.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.dao.MemberMapper;

@Controller
public class MainController {

   @Autowired
   SqlSession sqlsession;

   @RequestMapping(value = "mainHome", method = RequestMethod.GET)
   public String mainHome(Model model) {
      // 가맹 카페,업체 수 불러오기
	  MemberMapper dao = sqlsession.getMapper(MemberMapper.class);
      int countcafe = dao.countcafe(); //가맹카페수 쿼리 반환타입 : int
      int countpickup = dao.countpickup(); //가맹업체수 쿼리 반환타입 : int
      model.addAttribute("countcafe",countcafe);
      model.addAttribute("countpickup",countpickup);
      
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
      
      return "mainHome";
   }
}