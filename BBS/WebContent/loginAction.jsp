<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />


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
	String userName=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
		userName=(String) session.getAttribute("userName");
	}
	if(userID!=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 했습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	
	if(result==1){//로그인에 성공했다면
		session.setAttribute("userID", user.getUserID());//로그인 한 계정에 아이디로 세션부여
		session.setAttribute("userName", user.getUserName());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		//
	
		//
	}
	else if(result==0){//로그인 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");//로그인 실패시 이전화면으로
		script.println("</script>");
	}
	else if(result==-1){//로그인 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");//로그인 실패시 이전화면으로
		script.println("</script>");
	}
	else if(result==-2){//로그인 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류 발생')");
		script.println("history.back()");//로그인 실패시 이전화면으로
		script.println("</script>");
	}
%>
 
</body>
</html>