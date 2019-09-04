package global.sesoc.projectEC.vo;

public class ResultVO {
	
	private int resernum;
	private String cafeid;
	private String cafename;
	private String cafepostcode;
	private String caferoad;
	private String businessid;
	private String businessname;
	private String businesspostcode;
	private String businessroad;
	private int amount;
	private String realdate;
	private String sign; 
	
	public ResultVO() {
		
	}

	public ResultVO(int resernum, String cafeid, String cafename, String cafepostcode, String caferoad,
			String businessid, String businessname, String businesspostcode, String businessroad, int amount,
			String realdate, String sign) {
		super();
		this.resernum = resernum;
		this.cafeid = cafeid;
		this.cafename = cafename;
		this.cafepostcode = cafepostcode;
		this.caferoad = caferoad;
		this.businessid = businessid;
		this.businessname = businessname;
		this.businesspostcode = businesspostcode;
		this.businessroad = businessroad;
		this.amount = amount;
		this.realdate = realdate;
		this.sign = sign;
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

	public String getCafepostcode() {
		return cafepostcode;
	}

	public void setCafepostcode(String cafepostcode) {
		this.cafepostcode = cafepostcode;
	}

	public String getCaferoad() {
		return caferoad;
	}

	public void setCaferoad(String caferoad) {
		this.caferoad = caferoad;
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

	public String getBusinesspostcode() {
		return businesspostcode;
	}

	public void setBusinesspostcode(String businesspostcode) {
		this.businesspostcode = businesspostcode;
	}

	public String getBusinessroad() {
		return businessroad;
	}

	public void setBusinessroad(String businessroad) {
		this.businessroad = businessroad;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRealdate() {
		return realdate;
	}

	public void setRealdate(String realdate) {
		this.realdate = realdate;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	@Override
	public String toString() {
		return "ResultVO [resernum=" + resernum + ", cafeid=" + cafeid + ", cafename=" + cafename + ", cafepostcode="
				+ cafepostcode + ", caferoad=" + caferoad + ", businessid=" + businessid + ", businessname="
				+ businessname + ", businesspostcode=" + businesspostcode + ", businessroad=" + businessroad
				+ ", amount=" + amount + ", realdate=" + realdate + ", sign=" + sign + "]";
	}
}