 package global.sesoc.projectEC.vo;

public class Member {
	String custid;
	String password;
	String custname;
	String name;
	String custtel;
	String tel;
	String postcode;
	String road;
	String jibun;
	String idno;
	String division;
	String lat;
	String lng;
	String qrcode;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String custid, String password, String custname, String name, String custtel, String tel,
			String postcode, String road, String jibun, String idno, String division, String lat, String lng,
			String qrcode) {
		super();
		this.custid = custid;
		this.password = password;
		this.custname = custname;
		this.name = name;
		this.custtel = custtel;
		this.tel = tel;
		this.postcode = postcode;
		this.road = road;
		this.jibun = jibun;
		this.idno = idno;
		this.division = division;
		this.lat = lat;
		this.lng = lng;
		this.qrcode = qrcode;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCusttel() {
		return custtel;
	}

	public void setCusttel(String custtel) {
		this.custtel = custtel;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getRoad() {
		return road;
	}

	public void setRoad(String road) {
		this.road = road;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getIdno() {
		return idno;
	}

	public void setIdno(String idno) {
		this.idno = idno;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getQrcode() {
		return qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}

	@Override
	public String toString() {
		return "Member [custid=" + custid + ", password=" + password + ", custname=" + custname + ", name=" + name
				+ ", custtel=" + custtel + ", tel=" + tel + ", postcode=" + postcode + ", road=" + road + ", jibun="
				+ jibun + ", idno=" + idno + ", division=" + division + ", lat=" + lat + ", lng=" + lng + ", qrcode="
				+ qrcode + "]";
	}

}