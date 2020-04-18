package com.lsh.bbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.BbsDAO;

@WebServlet("/mod")
public class ModSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//관리자페이지에서 bbsID를 삭제하는 get, 서블릿
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bbsID = request.getParameter("bbsID");
		int int_bbsID = Integer.parseInt(bbsID);
		System.out.println(bbsID);
		BbsDAO bbsDAO = new BbsDAO();
		bbsDAO.delete(int_bbsID);
		response.sendRedirect("http://192.168.43.203:8080/BBS/control.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
