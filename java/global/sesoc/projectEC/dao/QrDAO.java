package global.sesoc.projectEC.dao;

import java.util.ArrayList;

import global.sesoc.projectEC.vo.FormVO;
import global.sesoc.projectEC.vo.ReservationVO;

public interface QrDAO {

   // 수거폼에 노출할 정보 가져오기
   public ArrayList<ReservationVO> getForm(String cafeid);

   // 카페 우편번호 가져오기
   public String getPost(String cafeid);

   // 카페 주소 가져오기
   public String getAddr(String cafeid);

   // 신청폼데이터를 결과테이블로 넘기기
   public int setResult(FormVO formVO);

   // 예약테이블의 성공여부 0에서 1로 고침
   public int setSuccess(ReservationVO reservation);

   // 파일명 동일여부 확인
   public String checkFileName(int resernum);

   // 수거 업체 우편번호 가져오기
   public String getBizPost(String bizid);

   // 수거 업체 주소 가져오기
   public String getBizAddr(String bizid);
   
}