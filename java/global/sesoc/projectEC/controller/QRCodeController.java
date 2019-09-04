package global.sesoc.projectEC.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.projectEC.dao.QrDAO;
import global.sesoc.projectEC.vo.FormVO;
import global.sesoc.projectEC.vo.ReservationVO;

@RequestMapping("qrForm")
@Controller
public class QRCodeController {

   private static final Logger logger = LoggerFactory.getLogger(QRCodeController.class);

   final String uploadPath = "/imgfile";

   @Autowired
   SqlSession sqlSession;

   // QR로 들어가는 수거폼
   @RequestMapping(value = "collectform1", method = RequestMethod.GET)
   public String collectForm(String cafeid, Model model) {
      // 스캔한 QR을 이용해서 값을 불러오고 form으로 이동하여 readonly 처리
      QrDAO mapper = sqlSession.getMapper(QrDAO.class);
      // 양쪽 정보를 모두 가져와서 정말 서로 예약되어 있는 약속이 있는지 확인.
      ArrayList<ReservationVO> reserList = mapper.getForm(cafeid);

      // 주소 넣기(카페)
      String cafePost = mapper.getPost(cafeid);
      String caferoad = mapper.getAddr(cafeid);
      logger.debug("정보 확인? : {}", reserList);
      logger.debug("주소카페확인:{}",cafePost+","+caferoad);
      
      // 주소 넣기(업체)
      String getBizId = "";
      for (ReservationVO reserv : reserList) {
         getBizId = reserv.getBusinessid();
      }

      String bizPost = mapper.getBizPost(getBizId);
      String bizroad = mapper.getBizAddr(getBizId);
      logger.debug("수거업체 주소 : {} ", bizPost, "+", bizroad);

      int listsize = reserList.size();
      logger.debug("불러온 총 예약건수 : " + listsize + " 개");

      if (listsize == 0) {
         logger.debug("예약되어 있는 건수가 없으므로 불러오기 실패");
         return "collectorForm/formComplete";
      }

      model.addAttribute("reservelist", reserList.get(0)); // 예약정보 담기
      model.addAttribute("cafePost", cafePost); // 카페 주소
      model.addAttribute("cafeRoad", caferoad); // 카페 주소
      model.addAttribute("bizPost", bizPost);
      model.addAttribute("bizRoad", bizroad);
      return "collectorForm/collectForm1";
   }

   // 김평숙170916
   @ResponseBody
   @RequestMapping(value = "sendCanvas", method = RequestMethod.POST)
   public String webForm3(FormVO formVO, HttpServletRequest request) {
      /* 서버측 코드 (jsp), ase64 인코딩 문자열을 수신하여 원래의 이미지 데이터로 디코딩하여 이미지 파일에 저장한다 */
      logger.debug("수거폼 ajax들어옴");

      // formVO에 등록sign이 긴~문자열로 되어 있음.
      logger.debug("넘어온 formVO확인 :{}", formVO);

      // String sign = StringUtils.split(request.getParameter("sign"),
      // ",")[1];
      String sign = StringUtils.split(formVO.getSign(), ",")[1];
      String fileName = "";

      // 파일 저장
      try {
         fileName = "sign_" + formVO.getResernum() + "_" + formVO.getCafeid() + "_" + formVO.getBusinessid()
               + ".png";

         logger.debug("file?:{}", fileName);

         // 예약번호의 동일한 사인 파일명이 있는지 확인
         QrDAO mapper = sqlSession.getMapper(QrDAO.class);
         String checkFile = mapper.checkFileName(formVO.getResernum());

         logger.debug("filecheck : {}", checkFile);
         System.out.println("filecheck : {}" + checkFile);
         // logger.debug("filecheck : {}", checkFile.equals(fileName));
         // System.out.println("filecheck : {}" +
         // checkFile.equals(fileName));

         if (checkFile != null && checkFile.equals(fileName)) {
            fileName = "FAIL";
            System.out.println("동일명파일존재");
            logger.debug("동일명파일존재");

            return fileName;
         }

         else {
            formVO.setSign(fileName);

            // 수거신청폼 액션 완료 후 DB에도 저장
            // System.out.println("저장 후 formVO:" + formVO);
            mapper = sqlSession.getMapper(QrDAO.class);
            int list = mapper.setResult(formVO);
            logger.debug("확인해보자form :{}", formVO);
            System.out.println("            ----------------------------------     1         ");
            
            // 예약테이블의 결과값 수정
            String a = "1";
            String msg = "e";
            String msgcheck = "1";

            ReservationVO reservation = new ReservationVO();

            reservation.setResernum(formVO.getResernum());
            reservation.setSuccess(a);
            reservation.setMsg(msg);
            reservation.setMsgcheck(msgcheck);

            System.out.println("예약테이블성공여부확인: " + reservation);
            System.out.println("            ----------------------------------     2         ");
            int success = mapper.setSuccess(reservation);

            System.out.println("저장 후 결과:" + list);
            System.out.println("저장 후 결과(succes):" + success);
            System.out.println("            ----------------------------------       3       ");

            //예약, 결과 테이블 바꾼후 최종으로 C드라이브에도 저장
            FileUtils.writeByteArrayToFile(new File("c:\\imgfile/" + fileName), Base64.decodeBase64(sign));
            fileName = "OK";
            logger.debug("C드라이브에도 저장 성공:{}", "OK");
            
         }
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      System.out.println("try-catch문 빠져나옴.:"+fileName);
      
      return fileName;
   }
   

}