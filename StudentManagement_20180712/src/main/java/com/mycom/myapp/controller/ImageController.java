package com.mycom.myapp.controller;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycom.myapp.jdbc.Connector;

@Controller
public class ImageController {
	
	@RequestMapping(value="/show_image/{jumin_no}", method = RequestMethod.GET)
	public void showImage(@PathVariable String jumin_no, HttpServletRequest request, HttpServletResponse response) {
		// System.out.println(jumin_no);
		String selectSQL = "SELECT picture FROM student_info WHERE jumin_no=?";
		
		try {
			Connection con = Connector.getConnection();
			PreparedStatement ps = con.prepareStatement(selectSQL);
			ps.setString(1, jumin_no);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				byte[] bPicture = rs.getBytes("picture");
				
				response.getOutputStream().write(bPicture);	
				response.getOutputStream().close();
	
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
