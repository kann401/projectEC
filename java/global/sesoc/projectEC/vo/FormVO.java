package global.sesoc.projectEC.vo;

public class FormVO {
   int resernum; // 예약 번호
   String cafeid; // 카페 아이디
   String cafename; // 카페 이름
   String cafepostcode; // 카페 우편번호
   String caferoad; // 카페 도로명주소
   String businessid; // 수거업체아이디
   String businessname; // 수거업체이름
   String businesspostcode; // 수거업체 우편번호
   String businessroad; // 수거업체 도로명주소
   int amount; // 수거량
   String realdate; // 실제 수거 날짜
   String sign; // 사인 전송

   public FormVO() {
      super();
      // TODO Auto-generated constructor stub
   }

   public FormVO(int resernum, String cafeid, String cafename, String cafepostcode, String caferoad, String businessid,
         String businessname, String businesspostcode, String businessroad, int amount, String realdate,
         String sign) {
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
      return "FormVO [resernum=" + resernum + ", cafeid=" + cafeid + ", cafename=" + cafename + ", cafepostcode="
            + cafepostcode + ", caferoad=" + caferoad + ", businessid=" + businessid + ", businessname="
            + businessname + ", businesspostcode=" + businesspostcode + ", businessroad=" + businessroad
            + ", amount=" + amount + ", realdate=" + realdate + ", sign=" + sign + "]";
   }
}