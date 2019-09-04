package global.sesoc.projectEC.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.projectEC.vo.FormVO;

@Repository
public class BoardRepository {

   private static final Logger logger = LoggerFactory.getLogger(BoardRepository.class);

   @Autowired
   SqlSession sqlSession;

   //페이징??
   public List<FormVO> findAll(String loginId, int startRecord, int countPerPage) {
      List<FormVO> boardList;

      RowBounds rb = new RowBounds(startRecord, countPerPage);
      // RowBounds : Mybatis에서 제공해주는 것. next 대신에 간편하게 쓸 수 있는것.(next를 쓰면 서브쿼리
      // 3개를 날려야함)

      BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
      
      
      boardList = dao.select(loginId, rb);
      System.out.println("결과물 : " + boardList);
      return boardList;
   }

   /**
    * @return 로그인한 사람의 전체 글 개수
    */
   public int getBoardCount(String loginId) {
      
      BoardDAO dao = sqlSession.getMapper(BoardDAO.class);

      logger.debug("getBoardCount_id? : {}",loginId);
      
      int result = dao.getBoardCount(loginId);

      return result;
   }
   
   
   /**
    * 글 자세히 보기
    * 
    * @param boardnum
    * @return
    */
   public FormVO findOne(String resernum) {
      BoardDAO dao = sqlSession.getMapper(BoardDAO.class);

      FormVO board = dao.selectOne(resernum);
      return board;
   }

   
}