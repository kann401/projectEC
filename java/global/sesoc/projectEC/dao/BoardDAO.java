package global.sesoc.projectEC.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.projectEC.vo.FormVO;

public interface BoardDAO {
   public List<FormVO> select(String loginId, RowBounds rb) ; //게시판에 넣을 수거결과값 불러오기
   
   public int getBoardCount(String search); //로그인된 회원이 가진 수거결과내역 수 가져오기
   
   public int insert(FormVO board);
   
   public FormVO selectOne(String resernum); //예약번호로 데이터 값 가져와야지.(로그인한 아이디는 이미 앞에서 걸려줬으므로 괜춘?)
}