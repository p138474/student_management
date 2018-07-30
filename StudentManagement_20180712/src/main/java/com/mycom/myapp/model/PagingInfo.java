package com.mycom.myapp.model;

public class PagingInfo {
	private int nCurrentPage;			// 현재 페이지 번호
	private int nTotalPage;				// 전체 페이지 번호(수)
	private int nRecordsPerPage;		// 1페이지당 표시하는 레코드 수
	private int nTotalRecords;			// 전체 건수
	
	public PagingInfo() {
		super();
		nCurrentPage = 0;
	}

	public PagingInfo(int nCurrentPage, int nTotalPage, int nRecordsPerPage, int nTotalRecords) {
		super();
		this.nCurrentPage = nCurrentPage;
		this.nTotalPage = nTotalPage;
		this.nRecordsPerPage = nRecordsPerPage;
		this.nTotalRecords = nTotalRecords;
	}

	public int getnCurrentPage() {
		return nCurrentPage;
	}

	public void setnCurrentPage(int nCurrentPage) {
		this.nCurrentPage = nCurrentPage;
	}

	public int getnTotalPage() {
		return nTotalPage;
	}

	public void setnTotalPage(int nTotalPage) {
		this.nTotalPage = nTotalPage;
	}

	public int getnRecordsPerPage() {
		return nRecordsPerPage;
	}

	public void setnRecordsPerPage(int nRecordsPerPage) {
		this.nRecordsPerPage = nRecordsPerPage;
	}

	public int getnTotalRecords() {
		return nTotalRecords;
	}

	public void setnTotalRecords(int nTotalRecords) {
		this.nTotalRecords = nTotalRecords;
	}

	@Override
	public String toString() {
		return "PagingInfo [nCurrentPage=" + nCurrentPage + ", nTotalPage=" + nTotalPage + ", nRecordsPerPage="
				+ nRecordsPerPage + ", nTotalRecords=" + nTotalRecords + "]";
	}

}
