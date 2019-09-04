package global.sesoc.projectEC.dao;

import global.sesoc.projectEC.vo.Member;

public interface MemberMapper {
	
	// 회원정보 저장
	public int insertMember(Member member);
	
	// ID로 해당 회원정보 검색
	public Member selectMember(String id);
	
	//회원 정보 수정
	public int updateMember(Member member);
}
