<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ page import="bbs.BbsDAO" %>
 <%@ page import="bbs.Bbs" %>
 <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>게시판 글 쓰기</title>
    <style>
        *{margin: 0; padding: 0; color: #333; text-decoration: none;}
        ul,li{list-style: none;}
        .write_area_wrap {
            width: 1200px;
            margin: 0 auto;
            text-align: center;
            margin-top: 50px;
            
        }
         
        .state{ height: 50px; line-height: 50px;  position:fixed; top:0; left:0; z-index:999;}
        .state *{padding: 30px; background-color:gray; color: #fff; font-weight: bold;}
        .state a:hover{color: yellow;}
        .row{position: relative;}
        #btn{position: absolute; right: 0; bottom: -30px;}
        
    </style>
</head>

<body>
<%
	String userID =null;
	if(session.getAttribute(userID)==null){
		userID=(String)session.getAttribute("userID");
	}
	int pageNumber=1;
	if(request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	if(userID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용가능합니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	
	
	
	
	
%>
    <div class="write_area">
        <div class="state">
            <a href="#">SW게시판</a>
            <a href="main.jsp">메인페이지</a>
        </div>
    </div>
    	<div class="title container">
    		<h2 style="text-align:center; font-size:40px;" >작품게시판</h2>
    	</div>
    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #ddd; margin-top: 200px">
                <thead>
                    <tr>
                        <th style="background-color: #eee; text-align: center">번호</th>
                        <th style="background-color: #eee; text-align: center">제목</th>
                        <th style="background-color: #eee; text-align: center">작성자</th>
                        <th style="background-color: #eee; text-align: center">작성일</th>
                        
                    </tr>
                </thead>
                <tbody style="text-align:center;">
                <%
                	BbsDAO bbsDAO = new BbsDAO();
                	ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                	for(int i=0; i<list.size();i++){

                
                %>
                
                    <tr >
                        <td style="text-align:center;"><%=list.get(i).getBbsID() %></td>
                        <td style="text-align:center;"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
                        <td style="text-align:center;"><%=list.get(i).getUserID() %></td>
                        <td style="text-align:center;"><%=list.get(i).getBbsDate() %></td>
                    </tr>
                   
                    <%
                    	} 
                    %>
                </tbody>
            </table>
            <%
            	if(pageNumber!=1){
            
            %>
				<a href="bbs.jsp?pageNumber=<%=pageNumber-1%>"><i class="fas fa-arrow-right"></i>다음</a>            
            
            
            <% }if(bbsDAO.nextpage(pageNumber+1)){%>
            	<a href="bbs.jsp?pageNumber=<%=pageNumber+1%>" ><i class="fas fa-arrow-left"></i>이전</a>
            
            <%} %>
            
            
            
            <a href="write.jsp" class="btn btn-primary pull-right" id="btn">글쓰기</a>
            
        </div>
    </div>
    
    
    
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>