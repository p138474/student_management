package com.mycom.myapp.model;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class InfoData {
	
	private int seq;
	@NotNull
	@Size(min=14, max=14, message= "주민번호는 14자리입니다.")
	private String jumin_no;
	
	private String student_no;
	
	@NotNull @Size(min=2, message= "이름은 2자리 이상 입니다.")
	private String name;
	
	@Pattern(regexp= "^01(?:0|1|[6-9])-(?:[0-9]{3}|[0-9]{4})-[0-9]{4}$", message= "\'01X-XXXX-XXXX\' 형식으로 입력하세요")
	private String tel;
	
	private Timestamp created_date;
	
	public InfoData() {
		super();
	}

	public InfoData(int seq, String jumin_no, String student_no, String name, String tel, Timestamp created_date) {
		super();
		this.seq = seq;
		this.jumin_no = jumin_no;
		this.student_no = student_no;
		this.name = name;
		this.tel = tel;
		this.created_date = created_date;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getJumin_no() {
		return jumin_no;
	}

	public void setJumin_no(String jumin_no) {
		this.jumin_no = jumin_no;
	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Timestamp getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Timestamp created_date) {
		this.created_date = created_date;
	}

	@Override
	public String toString() {
		return "InfoData [seq=" + seq + ", jumin_no=" + jumin_no + ", student_no=" + student_no + ", name=" + name
				+ ", tel=" + tel + ", created_date=" + created_date + "]";
	}
	

}
