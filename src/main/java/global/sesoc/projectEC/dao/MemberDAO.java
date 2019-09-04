package global.sesoc.projectEC.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.projectEC.dao.MemberMapper;
import global.sesoc.projectEC.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 회원가입 처리
	public int insert(Member member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// ID로 회원 정보 검색
	public Member get(String searchId) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		Member m = mapper.selectMember(searchId);
		return m;
	}
	
	// 회원정보 수정 처리
	public int update(Member member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		int result = 0;
		try {
			result = mapper.updateMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
