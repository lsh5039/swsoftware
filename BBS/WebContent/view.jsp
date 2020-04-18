<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%request.setCharacterEncoding("UTF-8");%>


<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.css">


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
	
	int bbsID = 0;
	if(request.getParameter("bbsID")!=null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 게시글입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
     <meta charset="UTF-8">
    <title>게시판 글 쓰기</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            color: #333;
            text-decoration: none;
        }

        ul,li {
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

       
        .btn {
            display: block;
            width: 1200px;
            margin: 0 auto;
            cursor: auto;
            overflow: hidden;
            border-left: 0; padding-left: 0;
        }
        .btn a{display: inline-block;width: 100px; height: 50px; background-color: #ddd; margin: 0 30px 0 0; float: left; line-height: 50px;}


        .submit_btn {
            font-size: 30px;
            float: right;
            margin-bottom: 100px;
        }
        .viewArea{width: 1200px; margin: 0 auto; border: 1px solid #ddd;}
        .viewArea > h3{margin: 20xp 0 20px 0;}
        .writeName{width: 100%; overflow: hidden; margin-bottom: 10px;}
        .writeName > *{float: left;height: 40px; background-color: #ddd;}
        .writeName > h3{width: 30%;line-height:40px; font-size:25px;}
        .writeName > p{width: 70%;line-height:40px; font-size:20px;background-color:#f1f1f1;}
        .writerName{width: 100%; overflow: hidden;margin-bottom: 10px;}
        .writerName > *{float: left;height: 40px; background-color: #ddd;}
        .writerName > h3{width: 30%;line-height:40px; font-size:25px;}
        .writerName  p{width: 70%; line-height:40px; font-size:20px;background-color:#f1f1f1;}
        .writeDate{width: 100%; overflow: hidden;margin-bottom: 10px;}
        .writeDate > *{float: left;height: 40px; background-color: #ddd;}
        .writeDate > h3{width: 30%;line-height:40px; font-size:25px;}
        .writeDate > p{width: 70%;line-height:40px; font-size:20px;background-color:#f1f1f1;}
        .writeMain{width: 100%; overflow: hidden;}
        .writeMain > *{float: left;overflow: hidden;}
        .writeMain > img{width: 50%;margin-bottom: 30px;}
        .writeMain > p{width: 50%;}
    </style>
</head>

<body>
    <div class="write_area">
        <div class="state">
            <a href="bbs.jsp">SW게시판</a>
            <a href="main.jsp">메인페이지</a>

        </div>
       
            <div class="write_area_wrap">
                <h2 class="title">게시판 글 쓰기</h2>
                <div class="viewArea">
                    <h3>게시글 보기</h3>
                    <div class="writeName">
                        <h3 style="margin-top:0">글 제목</h3>
                        <p><%= bbs.getBbsTitle() %></p>
                    </div>
                    <div class="writerName">
                        <h3 style="margin-top:0">작성자</h3>
                        <p><%= bbs.getUserID() %></p>
                    </div>
                    <div class="writeDate">
                        <h3 style="margin-top:0">작성일자</h3>
                        <p><%= bbs.getBbsDate()%></p>
                    </div>
                    <div class="writeMain">
                       <img src="https://placehold.it/200x200">
                        <p>
                            <%= bbs.getBbsContent() %>
                        </p>
                    </div>
                    
                </div>

            </div>
            <%
            	if(userID != null && userID.equals(bbs.getUserID()) || userID.equals("lsh5039") ){
            
            %>
            <div class="btn">
                <a href="update.jsp?bbsID=<%= bbsID %>">수정</a>
                <a href="deleteAction.jsp?bbsID=<%= bbsID %>">삭제</a>
            </div>
            	
           <%
           		} 
           %>
        
    </div>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>