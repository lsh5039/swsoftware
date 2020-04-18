<%@page import="com.sun.org.apache.bcel.internal.generic.INSTANCEOF"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>

    <style>
        *{margin: 0; padding: 0; color: #333;}
        li,ul{list-style: none;}
        .title{text-align: center; margin: 20px 0;}
        
        .information_title{width: 1000px; margin: 20px auto; margin-bottom: 0; overflow: hidden; background-color: #fab;}
        .information_title li{float: left; width: 200px; text-align: center;font-size: 20px; font-weight: bold; border: 1px solid black; box-sizing: border-box;}
        .information_desc{width: 1000px; margin:0 auto; overflow: hidden;}
        .information_desc li{float: left; width: 200px; text-align: center;border:1px solid black; box-sizing: border-box; height: 50px; line-height: 50px; font-size: 20px;}
        .information_desc li:nth-child(5){
        	word-break:break-all;
        	display:-webkit-box;
        	text-overflow:hidden;
        	width:20%;
        	overflow:hidden;
        	-webkit-line-clamp:1;
        	-webkit-box-orient:vertical;
        }
        .update{width: 1200px; margin: 50px auto;}
        .update *{text-align: center; font-size: 50px;}
            
        #r1,#r2{width: 50px; height: 50px;}
        .check{width: 100%; height: 100%; background-color: rgba(0,0,0,0.7); position: absolute; top: 0; z-index: 999;
/*            display: none;*/
        }
        .check_area{width: 800px; margin: 0 auto; position: relative; top: 50%; transform: translate(0,-50%); background-color: slateblue;}
        .check_area{width: 500px; height: 400px;position: relative;}
        .check p{color: #fff; font-size: 24px;}
        .check *{font-family: 'Jua', sans-serif;}
    
        .check_box{position: absolute; width: 90%; height: 80%; background-color: #fff; top: 50%; left: 50%; transform: translate(-50%,-50%); vertical-align: middle;}
        .check_box > p{text-align: center; color: #000; margin-top: 50px; padding-top: 50px; font-size: 50px;}
        .go_main{position: absolute; top: 20px; right: 20px; z-index: 99999; color: #fff; font-weight: bold; width: 100px; height: 50px; background-color: #fff; text-align: center; line-height: 50px;}
        .go_main:hover{background-color: #333;}
        .go_main:hover.go_main > a{ color: yellow;}
        .go_main > a{ text-decoration: none;}
        #password{width: 200px;height: 100px; position: absolute; left: 50%; transform: translateX(-50%); border: 1px solid #333; margin-top: 20px; text-align: center; font-size: 34px;}
        .confirm{position: absolute; right: 30px; bottom: 30px;width: 100px;height: 50px;}
        
.check_box {
   position: relative; /* #wrapper에 투명도를 주면 컨텐츠도 같이 투명해지기 때문에.. */
}
.check_box:after {
    content : "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    background-image: url("img/logo2.jpg");
    background-size: 100% 100%;
    width: 100%;
    height: 100%;
    opacity : 0.8;
    z-index: -1;
}
        
    </style>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	$(function(){
		
	
		$("#userName").click(function(){
			
			var firstPassword = $("#firstPass").val();
			var confirmPassword = $("#confirmPass").val();
			if(firstPassword != confirmPassword){
				$("#confirmPass").css("color","red");
				$("#updateInfo").fadeOut();
			}
			if(firstPassword == confirmPassword){
				$("#confirmPass").css("color","");
				$("#updateInfo").fadeIn();
			}
		})
	})
	</script>
</head>
<body>
	
<%
	
	String userID2=null;
	if(session.getAttribute("userID")!=null){
		userID2=(String) session.getAttribute("userID");
	}

	int userID = 0;
	if(request.getParameter("userID")!=null){
		
		userID = Integer.parseInt(request.getParameter("userID"));
	}		
	if(userID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 게시글입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	String userID3 = String.valueOf(userID);
	
	
	User user = new UserDAO().getUserInfo(userID3);
	//현재 integer tpye만 통과
	//lsh5039인 사람만 관리자로 통과하게 만들자
%>
	

    <h1 class="title" style="margin-bottom:50px"> <%=user.getUserName()%>님의 계정정보</h1>
    
    <ul class="information_title">
        <li>학번</li>
        <li>비밀번호</li>
        <li>이름</li>
        <li>성별</li>
        <li>이메일</li>
    </ul>
    <ul class="information_desc">
        <li><%=user.getUserID() %></li>
        <li>*****</li>
        <li><%=user.getUserName() %></li>
        <li><%=user.getUserGender() %></li>
        <li><%=user.getUserEmail() %></li>
    </ul>
    
    <div class="update">
        <form method="post" action="managementAction.jsp?bbsID=<%=userID%>">
					<h3 style="text-align: center;">정보변경 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="학번은 변경불가" name="userID" maxlength="0" autocomplete="off" title="학번변경은 053-xxx-xxxx">
					</div>
					<div class="form-group">
						<input type="password" id="firstPass"class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
						<input type="password" id="confirmPass" placeholder="비밀번호재확인"  maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="성명" name="userName" maxlength="20" id="userName">
					</div>
					
						<div class="Check_Gender">
							<input type="radio" id="r1" name="userGender" value="Man" checked> <label for="r1">남자</label>
							<input type="radio" id="r2" name="userGender" value="Woman"><label for="r2">여자</label>
						</div>
					
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					
					<input type="submit" class="btn btn-primary form control" value="변경" id="updateInfo">
				</form>
    </div>
       <div class="check">
        <div class="check_area">
           <div class="check_box">
                <p>비밀번호 확인</p>
                <input type="password" placeholder="password" id="password" autocomplete="off">
                <input type="submit" value="확인" class="confirm">
            </div>
        </div>
    </div>
    <div class="go_main">
         <a href="main.jsp">메인화면</a>
    </div>
<script>
	var rootPassword = "<%=user.getUserPassword() %>";//로그인 한 계정 비밀번호
	$(".confirm").click(function(){
		var password = $("#password").val(); 
		if(password==""){
			alert("비밀번호를 입력하세요");
		}
		else if(rootPassword == password){
			$(".check").css("display","none");
		}
		else{
			alert("비밀번호가 일치하지 않습니다.");
		}
	})
 
</script>
</body>
</html>