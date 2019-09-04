package global.sesoc.projectEC.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import global.sesoc.projectEC.dao.BoardRepository;
import global.sesoc.projectEC.dao.ChartDAO;
import global.sesoc.projectEC.util.PageNavigator;
import global.sesoc.projectEC.vo.FormVO;

@Controller
public class BoardController {
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired
   SqlSession sqlSession;
   
   @Autowired
   BoardRepository repo;

   final String uploadPath = "/imgfile"; // 파일 업로드 경로
   final String savePath = "/confirmPDF"; // PDF파일 저장 경로

   /**
    * 글 목록 요청
    * 
    * @param model
    * @return
    */
   @RequestMapping("menu/confirm")
   // <a href="boardList?currentPage=${}"
   // index에서 요청하면 currentPage가 없다. 그때는 초기값으로 1 세팅
   public String boardList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
         HttpSession session) {
      logger.info("currentPage : " + currentPage);

      // 현재 로그인한 아이디값 가져오기
      String loginId = (String) session.getAttribute("loginId");
      logger.debug("보드id:{}", loginId);

      // 전체 글 개수
      int totalRecordCount = repo.getBoardCount(loginId);

      PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);

      List<FormVO> boardList = repo.findAll(loginId, navi.getStartRecord(), navi.getCountPerPage());
      // System.out.println(boardList);

      model.addAttribute("boardList", boardList);
      logger.debug("control:{}", boardList);
      model.addAttribute("navi", navi);
      
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
	    
      return "menu/confirm";
   }

   // 수거폼결과 테이블에서 확인창 띄워주기
   @RequestMapping(value = "/board/collectform", method = RequestMethod.GET)
   public String collectfrom(Model model, HttpSession session, String resernum) {

      logger.debug("수거결과폼이당~~");

      String loginId = (String) session.getAttribute("loginId");

      logger.debug("수거결과폼확인 loginId:{}", loginId);
      logger.debug("수거결과폼확인 resernum:{}", resernum);

      FormVO form = repo.findOne(resernum);

      logger.debug("signfile:?", form.getSign());
      logger.debug("수거폼결과의 폼form:{}", form);

      model.addAttribute("result", form);
      return "collectorForm/collectForm";
   }

   // 결과 window창에서 사인포함한 수거완료폼이 뜸
   @RequestMapping(value = "board/download", method = RequestMethod.GET)
   public String fileDownload(String resernum, Model model, HttpServletResponse response) {
      FormVO form = repo.findOne(resernum);

      // 저장된 파일 경로
      String fullPath = uploadPath + "/" + form.getSign();

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

      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         try {
            fileout.flush();
            if (fileout != null)
               fileout.close();
            if (filein != null)
               filein.close();
            logger.debug("line149");
         } catch (Exception e) {
            e.printStackTrace();
         }
      }

      return null;
   }

   @RequestMapping(value = "/board/print", method = RequestMethod.GET)
   public void printPDF(String resernum, HttpSession session, HttpServletRequest request, Model model,
         HttpServletResponse response) {

      logger.debug("print2_yes");
      logger.debug("print2_yes, {}", resernum);
      FormVO form = repo.findOne(resernum);
      logger.debug("getFile명:{}", form);

      logger.debug(" ----------------------------------------------------------------------------------------");

      // sing파일이름이 적용되는지 나중에 확인하고 바꾸기.(.png로 되어 있을 테니..안될것같아서)
      String saveName = (String) session.getAttribute("loginId");

      // css
      String csspath = request.getSession().getServletContext().getRealPath("/resources/css/pdf.css");

      // font
      String fontpath = request.getSession().getServletContext().getRealPath("/resources/font/MALGUN.TTF");

      // log
      String logpath = request.getSession().getServletContext()
            .getRealPath("/resources/assets/image-resources/logo.png");

      // sign파일
      String signpath = "../../imgfile/" + form.getSign();
      logger.debug("사인들어가있는 파일명:{}", signpath);

      logger.debug(" ----------------------------------------------------------------------------------------");

      // File file = new File(signpath);
      Document document = null;
      PdfWriter writer = null;
      ServletOutputStream sos = null;
      FileInputStream cssFis = null;

      try {
         // 이미지 파일 불러오기
         // com.lowagie.text.Document 클래스 인스턴스를 생성
         document = new Document(PageSize.A4, 50, 50, 50, 50);

         // PdfWriter 생성 - Writer와 Document 사이의 연관을 맺어줍니다. Writer를 이용하여 문서를
         // 하드디스크 상에 써넣을 수 가 있습니다.
         // PdfWriter writer = PdfWriter.getInstance(document, new
         // FileOutputStream("d:/test.pdf")); s/ 바로 다운로드.
         sos = response.getOutputStream();

         writer = PdfWriter.getInstance(document, sos);

         writer.setInitialLeading(12.5f);

         // 파일 다운로드 설정
         response.setContentType("application/pdf");
         String fileName = URLEncoder.encode("한글파일명", "UTF-8"); // 파일명이 한글일 땐

         // 인코딩 필요
         response.setHeader("Content-Transper-Encoding", "binary");
         response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");

         // Document 오픈
         document.open();

         // 문서에 내용을 첨부-문장넣을때
//         document.add(new Paragraph("Hellow World"));
         document.addAuthor("ECO Coffee");
         document.addCreator("ECO Coffee - A Class :)");
         document.addSubject("Thanks for your support");
         document.addCreationDate();
         document.addTitle("Thanks for using our service:)");

         // CSS
         CSSResolver cssResolver = new StyleAttrCSSResolver();
         cssFis = new FileInputStream(csspath);
         CssFile cssFile = XMLWorkerHelper.getCSS(cssFis);
         cssResolver.addCss(cssFile);

         // HTML, 폰트 설정
         XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
         fontProvider.register(fontpath, "MalgunGothic");
         // MalgunGothic은 alias

         CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);

         HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
         htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());

         // Pipelines
         PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
         HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
         CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);

         XMLWorker worker = new XMLWorker(css, true);
         XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));

         logger.debug("LogoImge파일가져오기");
         Image logoImg = Image.getInstance(logpath);
//         logoImg.setAbsolutePosition(100, 250);
//         writer.getDirectContent().addImage(logoImg);
         document.add(logoImg);

         // 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
         String htmlStr = "<html><head><body style='font-family: MalgunGothic;'>" + "<h3>"+ "  [  " + saveName + "님의 수거 결과 내역 ]"
               + "</h3>" +"<h3>RESERVATION NUM" + " : " + form.getResernum()+"</h3>" 
                  + "<h3>CAFE NAME" + " : " + form.getCafename() +"</h3>"
                  + "<h3>CAFE POSTCODE" + " : " + form.getCafepostcode() +"</h3>"
                  + "<h3>CAFE ADDRESS" + " : " + form.getCaferoad() + "</h3>" 
                  + "<h3>PICKUP COMPANY NAME" + " : " + form.getBusinessname() +"</h3>"
                  + "<h3>PICKUP COMPANY POSTCODE" + " : " + form.getBusinesspostcode() +"</h3>"
                  + "<h3>PICKUP COMPANY ADDRESS"  + " : " + form.getBusinessroad() +"</h3>"
                  + "<h3>AMOUNT" + " : " + form.getAmount()+"</h3>"
                  + "<h3>SIGN</h3>"
                  + "</body></head></html>";

         logger.debug("imge파일가져오기 279");
         
         
         xmlParser.parse(new StringReader(htmlStr));

         logger.debug("imge파일가져오기");
         // 사인파일 가져오기
         Image img = Image.getInstance(signpath);
         // 이미지크기 줄이기
         img.scaleAbsolute(120f, 120f);
         img.setAbsolutePosition(150, 300);
         writer.getDirectContent().addImage(img);
         // 이미지문서에 첨가
         document.add(img);

         logger.debug("imge파일가져오기 265");

         // // 사인파일 가져오기
         // Image img2 = Image.getInstance(signpath);
         // document.add(img2);
         //
         logger.debug("imge파일가져오기 270");

         // String imageUrl2 = "http://jenkov.com/images/" +
         // "20081123-20081123-3E1W7902-small-portrait.jpg";
         //
         // Image image3 = Image.getInstance(new URL(imageUrl2));
         // document.add(image3);

         // xmlParser.parse(new StringReader(sHtml));
         // 문서 닫기(그 전에 문서에 내용 첨부 필요)

         logger.debug("imge파일가져오기 285");
      } catch (FileNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (DocumentException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         try {
            logger.debug("imge파일가져오기 296");
            writer.flush();
            sos.flush();
            if (cssFis != null)
               cssFis.close();
            if (document != null)
               document.close();
            if (writer != null)
               writer.close();
            if (sos != null)
               sos.close();
            logger.debug("imge파일가져오기 307");
         } catch (Exception e) {
            e.printStackTrace();
         }
      }

      logger.debug("imge파일가져오기 315");
      // return "collectorForm/collectForm";
   }

}