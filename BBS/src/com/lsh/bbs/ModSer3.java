package com.lsh.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.BbsDAO;

/**
 * Servlet implementation class ModSer3
 */
@WebServlet("/mod3")
public class ModSer3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bbsID = request.getParameter("bbsID");
		int int_bbsID = Integer.parseInt(bbsID);
		BbsDAO bbsDAO = new BbsDAO();
		bbsDAO.revival(int_bbsID);
		response.sendRedirect("http://192.168.43.203:8080/BBS/control.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
