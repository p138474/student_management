package com.mycom.myapp.controller;

import java.io.InputStream;
import java.sql.*;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.myapp.model.PagingInfo;
import com.mycom.myapp.jdbc.Connector;
import com.mycom.myapp.model.InfoData;

@Controller
@SessionAttributes({"al_infoData", "paging_info"})
public class StudentInfoController {
	
 	/* 학사정보 등록 */
	@GetMapping("/student_info_input")
	public String info_input(Model model, @ModelAttribute("infoData") InfoData infoData) {
		
		return "student_info_input";
	}
	
	
	/* 학사정보 등록 프로세스 */
	@RequestMapping(value = "/student_info_input_process", method = RequestMethod.POST)
	public String info_input_process(
			Model model, 
			@RequestParam("picture") MultipartFile picture,					// Spring MVC에서 파일 업로드
			@Valid @ModelAttribute("infoData") InfoData infoData, Errors errors){
			if(errors.hasErrors()) {
				return "student_info_input";
			}
		
		String strYear = "";
		String last_student_no = "";
		String new_student_no = "";	
		
		String nowSQL = "SELECT now() as 'current_date'";		// 서버의 시간을 가져오는 sql 함수 
		String lastStudentNoSQL = "SELECT student_no as last_student_no FROM student_info ORDER BY student_no desc limit 1";
		String insertSQL = "INSERT INTO student_info(jumin_no, student_no, name, picture, picture_content_type, tel, created_date) VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection con = Connector.getConnection();
			
			/* 서버의 시간을 가져오는 SQL문 */
			PreparedStatement ps = con.prepareStatement(nowSQL);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				Date current_date = rs.getDate("current_date");
				strYear = MessageFormat.format("{0, date,yyyy}", current_date );		// MessageFormat ★★★★
			}
			
			// 마지막 student_no를 
			ps = con.prepareStatement(lastStudentNoSQL);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				last_student_no = rs.getString("last_student_no");
			}
			
			// 예외처리
			long nNewNumber = 0;
			if(last_student_no == null || last_student_no == "") {
				nNewNumber = 1;
			} else {
				long number = Long.parseLong(last_student_no.substring(4, 8));			
				nNewNumber = number + 1;
			}
			
			new_student_no = MessageFormat.format("{0}{1, number,0000}", strYear, nNewNumber);			
			System.out.println(new_student_no);
			
			ps = con.prepareStatement(insertSQL);
			ps.setString(1, infoData.getJumin_no());
			ps.setString(2, new_student_no);
			ps.setString(3, infoData.getName());
			
			InputStream is = picture.getInputStream();
			ps.setBlob(4, is);
			ps.setString(5, picture.getContentType());
			
			ps.setString(6, infoData.getTel());

			java.sql.Timestamp ts = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
			ps.setTimestamp(7, ts);

			if(1 == ps.executeUpdate()) {
				System.out.println("정상등록");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("new_student_no", new_student_no);
		model.addAttribute("infoData", infoData);
		return "student_info_input_result";
	}
	
	
	 /* 학사정보 전체조회 */
	@GetMapping("/student_info_all_dis")
	public String info_all_dis(
			@RequestParam(value = "paging_gubun", required = false, defaultValue = "first") String paging_gubun,
			@RequestParam(value = "display_count_per_page", required = false) Integer display_count_per_page, 
			HttpSession session,
			Model model							
			) {
		List<InfoData> al_infoData = new ArrayList<InfoData>();
		PagingInfo pagingInfo = new PagingInfo();
		
		/* 로컬 변수 */
		int nCurrentPage = 0;
		int nTotalPage = 0;
		int nRecordsPerPage = 5;
		int nTotalRecords = 0;
		
		if (session.getAttribute("al_infoData") != null) {
			al_infoData = (List<InfoData>) session.getAttribute("al_infoData");
			pagingInfo = (PagingInfo) session.getAttribute("paging_info");
			
			nCurrentPage = pagingInfo.getnCurrentPage();
			nRecordsPerPage = pagingInfo.getnRecordsPerPage();
			nTotalRecords = pagingInfo.getnTotalRecords();
			

		} else {

			Connection con = Connector.getConnection();
			String countSQL = "SELECT count(jumin_no) totalCounts FROM student_info";
			String selectSQL = "SELECT Row_Number() OVER (order by created_date asc) seq, jumin_no, student_no, name, picture, tel, created_date FROM student_info ORDER BY created_date desc";
			
			try {
				PreparedStatement ps = con.prepareStatement(countSQL);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					pagingInfo.setnTotalRecords(rs.getInt("totalCounts"));
				}

				ps = con.prepareStatement(selectSQL);
				rs = ps.executeQuery();

				while (rs.next()) {
					InfoData infoData = new InfoData();
					infoData.setSeq(rs.getInt("seq"));
					infoData.setJumin_no(rs.getString("jumin_no"));
					infoData.setStudent_no(rs.getString("student_no"));
					infoData.setName(rs.getString("name"));
					infoData.setTel(rs.getString("tel"));
					infoData.setCreated_date(rs.getTimestamp("created_date"));
					
					al_infoData.add(infoData);
				}

				nTotalRecords = al_infoData.size();
				pagingInfo.setnTotalRecords(nTotalRecords);
				pagingInfo.setnRecordsPerPage(nRecordsPerPage);				
				
				model.addAttribute("al_infoData", al_infoData);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (display_count_per_page != null) {
			nRecordsPerPage = display_count_per_page;
			nTotalPage = (int) Math.ceil((double) nTotalRecords / (double) nRecordsPerPage);
		} else {
			nRecordsPerPage = pagingInfo.getnRecordsPerPage();
			nTotalPage = (int) Math.ceil((double) nTotalRecords / (double) nRecordsPerPage);
		}

		switch (paging_gubun) {
		case "first":
			nCurrentPage = 1;
			break;
		case "previous":
			nCurrentPage = nCurrentPage - 1;
			if (nCurrentPage < 1) {
				nCurrentPage = 1;
			}
			break;
		case "next":
			nCurrentPage = nCurrentPage + 1;
			if (nCurrentPage > nTotalPage) {
				nCurrentPage = nTotalPage;
			}
			break;
		case "last":
			nCurrentPage = nTotalPage;
			break;
		}

		pagingInfo.setnTotalRecords(nTotalRecords);
		pagingInfo.setnRecordsPerPage(nRecordsPerPage);
		pagingInfo.setnTotalPage(nTotalPage);
		pagingInfo.setnCurrentPage(nCurrentPage);		
		
		int fromIndex = (nCurrentPage - 1) * nRecordsPerPage;
		int toIndex = fromIndex + nRecordsPerPage;
		
		if (toIndex > nTotalRecords) {
			toIndex = nTotalRecords;
		}

		List<InfoData> al_sub_infoData = al_infoData.subList(fromIndex, toIndex);

		model.addAttribute("paging_info", pagingInfo);
		model.addAttribute("al_sub_infoData", al_sub_infoData);

		return "student_info_all_dis";

	}
	

	/* 이름으로 학사정보 조회 페이지 */
	@GetMapping("/student_info_search")
	public String student_info_search(
			) {
		
		return "student_info_search";
	}
	//https://www.eduon.com/itembank/subjectlist/46
	
	/* 이름으로 학사정보 조회 페이지 */
	@PostMapping("/student_info_search")
	public String student_info_search_process(
			@RequestParam("name") String name_find,
			Model model
			) {
		
		List<InfoData> al_info_data = new ArrayList<InfoData>();
		
		String selectSQL = "SELECT Row_Number() OVER (ORDER BY jumin_no) seq, jumin_no, student_no, name, tel, created_date FROM student_info WHERE name like ?";
		try {
			Connection con = Connector.getConnection();
			PreparedStatement ps = con.prepareStatement(selectSQL);
			ps.setString(1, "%"+name_find+"%");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				InfoData infoData = new InfoData();
				infoData.setSeq(rs.getInt("seq"));
				infoData.setName(rs.getString("name"));
				infoData.setJumin_no(rs.getString("jumin_no"));
				infoData.setStudent_no(rs.getString("student_no"));
				infoData.setTel(rs.getString("tel"));
				infoData.setCreated_date(rs.getTimestamp("created_date"));
				
				al_info_data.add(infoData);
			} 
			
			model.addAttribute("al_info_data", al_info_data);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return "student_info_search";
	}
	

}
