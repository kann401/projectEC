package global.sesoc.projectEC.dao;

import java.util.ArrayList;

import global.sesoc.projectEC.vo.Member;

public interface MemberMapper {

   // 회원정보 저장
   public int insertMember(Member member);

   // ID로 해당 회원정보 검색
   public Member selectMember(String id);

   // 회원 정보 수정
   public int updateMember(Member member);

   // 지도, 예약할때 수거업체 보여주기
   public ArrayList<Member> selectAll();

   // 카페 모두 보기
   public ArrayList<Member> getCafeAll();

   // 멤버 정보 가져오기
   public ArrayList<Member> list();

   // QR코드 업데이트
   public int updateMemberQR(Member member);

   // My Page 접속시
   public Member loginMember(Member member);
   
   //에코마크 취득가능한 카페회원 찾기
   public int ecomark(String id);
   
   //가맹카페수 카운팅
   public int countcafe();
   
   //가맹수거업체 카운팅
   public int countpickup();
   
}