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

<%
String userID=null;
if(session.getAttribute("userID")!=null){
	userID=(String) session.getAttribute("userID");
}
if(userID==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인 후 이용가능합니다.')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
}

%>


<head>
    <link rel="stylesheet" href="css/bootstrap.css">
    <meta charset="UTF-8">
    <title>게시판 글 쓰기</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            color: #333;
            text-decoration: none;
        }

        ul,
        li {
            list-style: none;
        }

        .write_area_wrap {
            width: 1200px;
            margin: 0 auto;
            text-align: center;
            margin-top: 50px;

        }

        .title {
            font-size: 60px;
            margin-bottom: 50px;
        }

        #desc_box {
            width: 100%;
            height: 500px;
        }

        .title_box {
            width: 100%;
            height: 40px;
        }

        .state {
            height: 50px;
            line-height: 50px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
        }

        .state * {
            padding: 30px;
            background-color: gray;
            color: #fff;
            font-weight: bold;
        }

        .state a:hover {
            color: yellow;
        }

        .submit_btn {
            cursor: pointer;
        }

        .btn {
            display: block;
            width: 1200px;
            margin: 0 auto;
        }

        .files {
            border: 1px solid #333;
            font-size: 30px;
            float: left;
        }

        .submit_btn {
            font-size: 30px;
            float: right;
            margin-bottom: 100px;
        }
    </style>
</head>

<body>
    <div class="write_area">
        <div class="state">
            <a href="bbs.jsp">SW게시판</a>
            <a href="main.jsp">메인페이지</a>

        </div>
        <form method="post" action="writeAction.jsp">
            <div class="write_area_wrap">
                <h2 class="title">게시판 글 쓰기</h2>
                <input type="text" class="title_box" class="form-control" placeholder="제목" name="bbsTitle" maxlength="50">
                <textarea id="desc_box" cols="30" rows="10" class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style=height:500px;></textarea>

            </div>
            <div class="btn">
                <input type="file" class="files">
                <input type="submit" class="submit_btn" value="글쓰기">
            </div>
        </form>
    </div>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>