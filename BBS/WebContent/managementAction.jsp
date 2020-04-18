<%@page import="com.sun.org.apache.bcel.internal.generic.INSTANCEOF"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>

<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)request.getParameter("userName");
	System.out.println("넘어온 파라미터 : "+name);
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">


<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
	}
	
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지않습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</sciprt>");
	}
	//User bbs = new UserDAO().InfoUpdate(userID, userPassword, userName, userGender, userEmail);

		if(request.getParameter("userPassword")=="" || request.getParameter("userName")=="" || request.getParameter("userGender")=="" ||request.getParameter("userEmail") ==""){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO =new UserDAO();
			
			int result = userDAO.InfoUpdate(userID,request.getParameter("userPassword"), request.getParameter("userName"), request.getParameter("userGender"), request.getParameter("userEmail"));
			if(result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('정보변경에 실패했습니다.')");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('정보변경이 정상적으로 이루어 졌습니다.')");
				script.println("location.href='main.jsp'");
				
				script.println("</script>");
				/* System.out.println(request.getParameter("userID"));
				System.out.println(request.getParameter("userPassword"));
				System.out.println(request.getParameter("userName"));
				System.out.println(request.getParameter("userGender"));
				System.out.println(request.getParameter("userEmail"));
					테스트 20.02.04  이제 회원정보 수정시 먼저 패스워드확인하고 관리자가 회원자르기기능 추가
				*/
			}
		}
		
	
	
%>
</body>
</html>