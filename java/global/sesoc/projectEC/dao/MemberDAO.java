package global.sesoc.projectEC.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.projectEC.dao.MemberMapper;
import global.sesoc.projectEC.vo.Member;

@Repository
public class MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);

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

	public Member myPage(Member member) {

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

		Member p = mapper.loginMember(member);

		return p;
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

	// QRCode테이블에 추가
	public int updateQR(Member member) {

		logger.debug("qrupdete check : {}", member);

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.updateMemberQR(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
