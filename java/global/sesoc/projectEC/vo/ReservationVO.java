package global.sesoc.projectEC.vo;

public class ReservationVO {

	int resernum; // 예약 번호
	String cafeid; // 카페 아이디
	String cafename; // 카페 이름
	String cafetel; // 카페 전화번호
	String businessid; // 수거업체아이디
	String businessname; // 수거업체이름
	String businesstel; // 수거업체 전화번호
	String reserDate; // 예약 날짜
	String reserTime; // 예약 시간
	String msg; // 쪽지상태
	String msgcheck; // 쪽지체크
	String success; // 예약요청상태

	public ReservationVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationVO(int resernum, String cafeid, String cafename, String cafetel, String businessid,
			String businessname, String businesstel, String reserDate, String reserTime, String msg, String msgcheck,
			String success) {
		super();
		this.resernum = resernum;
		this.cafeid = cafeid;
		this.cafename = cafename;
		this.cafetel = cafetel;
		this.businessid = businessid;
		this.businessname = businessname;
		this.businesstel = businesstel;
		this.reserDate = reserDate;
		this.reserTime = reserTime;
		this.msg = msg;
		this.msgcheck = msgcheck;
		this.success = success;
	}

	public int getResernum() {
		return resernum;
	}

	public void setResernum(int resernum) {
		this.resernum = resernum;
	}

	public String getCafeid() {
		return cafeid;
	}

	public void setCafeid(String cafeid) {
		this.cafeid = cafeid;
	}

	public String getCafename() {
		return cafename;
	}

	public void setCafename(String cafename) {
		this.cafename = cafename;
	}

	public String getCafetel() {
		return cafetel;
	}

	public void setCafetel(String cafetel) {
		this.cafetel = cafetel;
	}

	public String getBusinessid() {
		return businessid;
	}

	public void setBusinessid(String businessid) {
		this.businessid = businessid;
	}

	public String getBusinessname() {
		return businessname;
	}

	public void setBusinessname(String businessname) {
		this.businessname = businessname;
	}

	public String getBusinesstel() {
		return businesstel;
	}

	public void setBusinesstel(String businesstel) {
		this.businesstel = businesstel;
	}

	public String getReserDate() {
		return reserDate;
	}

	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}

	public String getReserTime() {
		return reserTime;
	}

	public void setReserTime(String reserTime) {
		this.reserTime = reserTime;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getMsgcheck() {
		return msgcheck;
	}

	public void setMsgcheck(String msgcheck) {
		this.msgcheck = msgcheck;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	@Override
	public String toString() {
		return "ReservationVO [resernum=" + resernum + ", cafeid=" + cafeid + ", cafename=" + cafename + ", cafetel="
				+ cafetel + ", businessid=" + businessid + ", businessname=" + businessname + ", businesstel="
				+ businesstel + ", reserDate=" + reserDate + ", reserTime=" + reserTime + ", msg=" + msg + ", msgcheck="
				+ msgcheck + ", success=" + success + "]";
	}

}