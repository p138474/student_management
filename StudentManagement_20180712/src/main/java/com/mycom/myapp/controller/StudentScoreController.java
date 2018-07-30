package com.mycom.myapp.controller;

import java.sql.*;
import java.util.ArrayList;
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
import com.mycom.myapp.model.ScoreData;

@Controller
@SessionAttributes({"al_score_data", "pagingInfo"})
public class StudentScoreController {
	
	 /* 성적 전체조회 */
	@GetMapping("/student_score_all_dis")
	public String info_all_dis(
			@RequestParam(value = "paging_gubun", defaultValue = "first") String paging_gubun,
			@RequestParam(value = "recordsPerPage", required = false) Integer nRecordsPerPage, 
			Model model, 																	
			HttpSession session) {
		List<ScoreData> al_score_data = new ArrayList<ScoreData>();
		PagingInfo pagingInfo = new PagingInfo();

		if (session.getAttribute("al_score_data") != null) {
			al_score_data = (List<ScoreData>) session.getAttribute("al_score_data");

			pagingInfo = (PagingInfo) session.getAttribute("pagingInfo");
			if (nRecordsPerPage == null) { // Integer는 null 가능
				nRecordsPerPage = pagingInfo.getnRecordsPerPage();
			}

		} else {
			nRecordsPerPage = 5;
			Connection con = Connector.getConnection();
			String countSQL = "SELECT count(student_no) totalCounts FROM student_score";
			String selectSQL = "SELECT Row_Number() OVER (order by(guk+math+sahee)/3 desc )  seq, A.student_no, B.name, A.guk, A.math, A.sahee, (guk+math+sahee)/3 avg FROM student_score A INNER JOIN student_info B ON A.student_no = B.student_no ORDER BY avg desc";
			//String selectSQL = "SELECT student_no, guk, math, sahee FROM student_score";
			try {
				PreparedStatement ps = con.prepareStatement(countSQL);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					pagingInfo.setnTotalRecords(rs.getInt("totalCounts"));
				}
 
				ps = con.prepareStatement(selectSQL);
				rs = ps.executeQuery();
 
				while (rs.next()) {
					ScoreData scoreData = new ScoreData();
					scoreData.setSeq(rs.getInt("seq"));
					scoreData.setStudent_no(rs.getString("student_no"));
					scoreData.setName(rs.getString("name"));
					scoreData.setGuk(rs.getInt("guk"));
					scoreData.setMath(rs.getInt("math"));
					scoreData.setSahee(rs.getInt("sahee"));
					
					al_score_data.add(scoreData);
				}
 
				model.addAttribute("al_score_data", al_score_data);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
 
		int nTotalPage = (int) Math.ceil((double) pagingInfo.getnTotalRecords() / (double) (nRecordsPerPage));
 
		pagingInfo.setnRecordsPerPage(nRecordsPerPage);
		pagingInfo.setnTotalPage(nTotalPage);
		int nCurrentPage = pagingInfo.getnCurrentPage();
 
		switch (paging_gubun) {
		case "first":
			nCurrentPage = 1;
			break;
		case "previous":
			nCurrentPage = nCurrentPage > 1 ? --nCurrentPage : 1;
			break;
		case "next":
			nCurrentPage = nCurrentPage < nTotalPage ? ++nCurrentPage : nTotalPage;
			System.out.println("next");
			break;
		case "last":
			nCurrentPage = pagingInfo.getnTotalPage();
			System.out.println("last");
			break;
		}
		pagingInfo.setnCurrentPage(nCurrentPage);

		int fromIndex = (nCurrentPage - 1) * nRecordsPerPage;
		int toIndex = fromIndex + nRecordsPerPage;
		
		if (toIndex >= pagingInfo.getnTotalRecords()) {
			toIndex = pagingInfo.getnTotalRecords();
		}

 

		List<ScoreData> al_sub_scoreData = al_score_data.subList(fromIndex, toIndex);

		model.addAttribute("al_sub_scoreData", al_sub_scoreData);
		model.addAttribute("pagingInfo", pagingInfo);

		model.addAttribute("current_page", pagingInfo.getnCurrentPage());
		model.addAttribute("total_page", pagingInfo.getnTotalPage());
		model.addAttribute("recordsPerPage", nRecordsPerPage);
		model.addAttribute("totalCounts", pagingInfo.getnTotalRecords());

		return "student_score_all_dis";

	}
	
 	/* 학사정보 등록 */
	@GetMapping("/student_score_input")
	public String info_input(
			Model model, 
			@ModelAttribute("scoreData") ScoreData scoreData) {
		
		return "student_score_input";
	}
	
	
	/* 성적등록 프로세스 */
	@PostMapping("/student_score_input_process")
	public String score_input_process(
			Model model, 
			@Valid @ModelAttribute("scoreData") ScoreData scoreData, Errors errors){
		
			if(errors.hasErrors()) {
				return "student_score_input";
			}
		
		String insertSQL = "INSERT INTO student_score(student_no, guk, math, sahee) VALUES(?, ?, ?, ?)";
		try {
			Connection con = Connector.getConnection();
			PreparedStatement ps = con.prepareStatement(insertSQL);
			ps.setString(1, scoreData.getStudent_no());
			ps.setInt(2, scoreData.getGuk());
			ps.setInt(3, scoreData.getMath());
			ps.setInt(4, scoreData.getSahee());
			
			ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("scoreData", scoreData);
		return "student_score_input_result";
	}
	

}
