package global.sesoc.projectEC.dao;

import java.util.ArrayList;

import global.sesoc.projectEC.vo.ReservationVO;

/**
 * 데이터 베이스를 처리할 매퍼 인터페이스 로그인, 유저 리스트, 쪽지 보내기, 보낸 쪽지, 받은 쪽지에 대한 인터페이스를 제공
 */
public interface ReservationDAO {
	/* 예약하기 */
	public int schduleAdd(ReservationVO reservation);

	// 예약정보 읽기전에 reserdate가 sysdate보다 빠르면 삭제하기
	public int reserdatecheck();

	/* 예약정보 캘린더로 읽기 */
	public ArrayList<ReservationVO> readReservation(String loginId);

	/* 예약번호로 상세보기 */
	public ReservationVO reserconfirm(int resernum);

	/* 예약 삭제하기 */
	public int reserdelete(int resernum);

}