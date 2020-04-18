<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />


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
	if(userID!=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 했습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}


	//입력이 안 된 항목을 거부
	if(user.getUserID()==null || user.getUserPassword()==null || user.getUserName()==null || user.getUserGender()==null || user.getUserEmail()==null){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 형목이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result==-1){//회원가입 DB오류 ,현 상황은 PK인 userID가 중복
			//System.out.println(result);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('가입된 학번이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{//가입성공
			session.setAttribute("userID", user.getUserID());//가입 한 계정에 아이디로 세션부여
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('가입에 성공했습니다 메인화면으로 이동합니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}		
		
	}




%>
 
</body>
</html>