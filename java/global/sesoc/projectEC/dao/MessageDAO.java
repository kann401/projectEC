package global.sesoc.projectEC.dao;

import java.util.ArrayList;

import global.sesoc.projectEC.vo.ReservationVO;

public interface MessageDAO {

	// 업체의 전체 예약 건수 (쪽지 개수 표시에 사용)
	public int getAllcount(String loginId);

	// 업체의 전체 메시지 불러오기
	public ArrayList<ReservationVO> getBusimessage(String loginId);

	// 업체로그인시 메시지를 읽은 경우 메시지를 읽음(1) 처리해 준다.
	public int updateMsgcheck1(String resernum);

	// 새로운 메시지가 있는지 확인.
	public ArrayList<ReservationVO> getNewmessage(String loginId);

	// 쪽지창에서 수락을 눌렀을 때 msg 컬럼을 t 로 변경한다.
	public int updateMsgt(int resernum);

	// 쪽지창에서 거절을 눌렀을 때 msg 컬럼을 f 로 변경한다.
	public int updateMsgf(int resernum);

	// 카페 로그인시 업체로부터 수락받은 메시지가 있다면 가져온다.
	public ArrayList<ReservationVO> getTruemessage(String loginId);

	// 카페 로그인시 거부한 정보
	public ArrayList<ReservationVO> getDenymessage(String loginId);

	// 카페 로그인시 수거완료된 정보
	public ArrayList<ReservationVO> getFinishmessage(String loginId);

	// 카페로그인시 메시지를 읽은 경우 메시지를 읽음(1) 처리해 준다.
	public int updateMsgcheck2(String resernum);

	// 카페로그인시 새로운 수락 쪽지가 있는지 알림용 msgcheck != '2'를 불러온다.
	public ArrayList<ReservationVO> getNotreadtrue(String loginId);

	// 카페로그인시 새로운 거절 쪽지가 있는지 알림용 msgcheck != '2'를 불러온다.
	public ArrayList<ReservationVO> getNotreadfalse(String loginId);

	// 카페로그인시 새로운 완료 쪽지가 있는지 알림용 msgcheck != '2'를 불러온다.
	public ArrayList<ReservationVO> getNotreadfinish(String loginId);

	// 메시지함에서 x버튼 클릭시 msg컬럼을 s로 업데이트 하고 노출목록에서 제외.
	public int tempDelete(String resernum);

	// X삭제를 위한, success를 불러온다.
	public int getsuccess(String resernum);

	// 카페가 최초로 X클릭시 카페에서는 노출안되고, 업체쪽에서만 노출되어야 한다.
	public int updateSuccess2(String resernum);

	// 완료메시지를 카페쪽만 노출시킬 success컬럼을 3으로 업데이트하는 메서드
	public int updateSuccess3(String resernum);

	// 완료메시지를 양쪽모두 노출시키지 않을 success컬럼을 4로 업데이트하는 메서드
	public int updateSuccess4(String resernum);
}