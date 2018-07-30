package com.mycom.myapp.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ScoreData {
	private int seq;

	@Size(min=8, max=8, message="!!학번8자리필수입력!!")
	private String student_no;
	
	private String name;
	
	@NotNull
	@Min(0) @Max(100)
	private int guk;
	
	@NotNull
	@Min(0) @Max(100)
	private int math;
	
	@NotNull
	@Min(0) @Max(100)
	private int sahee;
	
	public ScoreData() {
		super();
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public int getGuk() {
		return guk;
	}

	public void setGuk(int guk) {
		this.guk = guk;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getSahee() {
		return sahee;
	}

	public void setSahee(int sahee) {
		this.sahee = sahee;
	}
	
	

}
