<%@page import="com.sun.org.apache.bcel.internal.generic.INSTANCEOF"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import ="user.User" %>
<%@ page import ="user.UserDAO" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%
	

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        $(function() {
       
            var current=null;
            $(".list").mouseover(function() {
                $(this).css({
                    borderColor: "yellow",
                    borderWidth: "3px"
                })

            })
            $(".list").mouseleave(function() {

                $(this).css({
                    borderColor: "#333",
                    borderWidth: "1px"
                })
            })
            
            $("#info").stop().click(function() {
                
                $(".desc_title").fadeOut();
                setTimeout(function(){
                    $(".desc_title").html("회원정보 변경").fadeIn();
                },400)
                $(".desc_title").fadeIn();
            });
            $("#delete").stop().click(function() {
                $(".desc_title").fadeOut();
                setTimeout(function(){
                    $(".desc_title").html("게시글 관리").fadeIn();
                },400)
                $(".desc_title").fadeIn();
            });
            $("#db").stop().click(function() {
                $(".desc_title").fadeOut();
                setTimeout(function(){
                    $(".desc_title").html("데이터베이스 현황").fadeIn();
                },400)
                $(".desc_title").fadeIn();
            });
            $("#message").stop().click(function() {
                $(".desc_title").fadeOut();
                setTimeout(function(){
                    $(".desc_title").html("메시지 전송").fadeIn();
                },400)
                $(".desc_title").fadeIn();
            });
            
            $(".list").click(function(){
                $(".list").css("backgroundColor","transparent");
                $(this).css("backgroundColor","yellow");
               
                
                
                //$("#send").click();
            })
            
			$("#info").click(function(){
				$("section").css("display","none");
				setTimeout(function(){
					$(".all_user_desc").css("display","block");
				},400)
				
			});
            $("#delete").click(function(){
            	$("section").css("display","none");
				setTimeout(function(){
					 $(".all_bbs_desc").css("display","block");
				},400)
				
			});
            
            var number_of_move = $(".move").length;
            var moveWidth = $(".move").width();
            var bbsAnimate =false;
            var i = 0;//화살표를 누른 횟 수를 기억
            console.log(moveWidth);
            console.log(number_of_move);
            
            $(".move_wrap").css({
                width:number_of_move * moveWidth,
                overflow:"hidden"
            })
            $(".right_arrow").click(function(){
                if(bbsAnimate==true){return;}
                bbsAnimate=true;
                i++;
                if(i>=number_of_move){i=number_of_move -1;}
                console.log(i);
                var ml=$(".move").width();//한개당 width
                $(".move_wrap").stop().animate({
                    marginLeft:-ml*i+"px"
                },1000,function(){bbsAnimate=false;})
                
                console.log(-moveWidth);
            });
            $(".left_arrow").click(function(){
                if(bbsAnimate==true){return;}
                bbsAnimate=true;
                 i--;
                if(i<0){i=0;}
                console.log(i);
                var ml=$(".move").width();//한개당 width
                $(".move_wrap").stop().animate({
                    marginLeft:-ml*i+"px"
                },1000,function(){bbsAnimate=false;})
                
                console.log(-moveWidth);
            });
           

           
          
        }) //ready
    </script>
    <style>
        *{margin: 0;padding: 0;}
        a{text-decoration: none;}
        .control_list{width: 1200px; margin: 0 auto; overflow: hidden;}
        .list{width: 200px;height: 200px; float: left; margin: 50px; border: 1px solid #333; box-sizing: border-box; box-shadow: 0 0 5px rgba(0,0,0,0.7); background-color: transparent; border-radius: 10px; overflow: hidden; position: relative; cursor: pointer;}
        .list.active{border: 3px solid yellow;}
        .title{font-size: 50px; text-align: center; margin: 40px 0;}
        .list > h2{text-align: center; margin-top: 10px;}
        .list > i{font-size: 100px; display: inline-block; position: absolute;top: 50%;left: 50%; transform: translate(-50%,-45%);}
        
        .desc_title{font-size: 50px; text-align: center; margin-top: 40px; }
        #send{position: relative; left: -500px;}
        .user_title_list{width:1200px; margin: 50px auto; margin-bottom:0; overflow: hidden; text-align:center; font-size:24px; font-weight:bold;}
        .user_title_list > h4{float:left; width:200px; height:50px;line-height:50px; border:1px solid #ddd;box-sizing: border-box;}
        .user_title_list > h4:nth-child(5){width: 300px;}
        .user_desc_list{width:1200px; margin: 0 auto; overflow: hidden; text-align:center; font-size:24px; font-weight:normal;}
        .user_desc_list > p{float:left; width:200px;  border:1px solid #ddd;box-sizing: border-box;}
        .user_desc_list > p:nth-child(5){width: 300px;}
        .all_user_desc{display: none;}
        .description{width:1200px; margin:0 auto;}
        
        
       .bbs_title_list{width: 1200px;margin: 50px auto; position: relative;}
        
        .bbstop > h4{width: 300px; float: left; border:1px solid #333; box-sizing: 
            border-box; text-align: center;font-size: 30px;}
        .bbstop{overflow: hidden;}
        .bbscontent{width: 1200px; border: 1px solid #333; box-sizing: border-box; height: 500px;}
        .right_arrow{position: absolute; right: 43%; cursor: pointer; font-size: 30px; border-radius: 50%; background-color: #111; color: #fff; width: 50px; height: 50px; text-align: center; line-height: 50px;margin-top: 20px;}
        .left_arrow{position: absolute; left: 43%; cursor: pointer; font-size: 30px; border-radius: 50%; background-color: #111; color: #fff; width: 50px; height: 50px; text-align: center; line-height: 50px; margin-top: 20px;}
        .move{width: 1200px; height: 542px; float: left;}
        .move_see{height: 542px; position: relative; width: 1200px;
            overflow: hidden;
        }
        .move_wrap{background-color: #f4f4f4;}
        .all_bbs_desc{display:none;}
        .deleteBtn, .modBtn{overflow:hidden;  display:inline-block; margin-top:16px;}
        .deleteBtn > * , .modBtn > *{ font-size:30px; text-align:center;}
   		.deleteBtn input:nth-child(2){letter-spacing:14px;}
        
    </style>
</head>
<body>
   <a href="http://192.168.43.203:8080/BBS" style="font-size:20px; padding:20px 20px; font-weight:bold;">Main</a>
    <div class="control">
       <h1 class="title">관리자 페이지</h1>
        <div class="control_list">
            <div class="list" id="info">
                <h2>회원정보</h2>
                <i class="fas fa-users-cog"></i>
            </div>
            <div class="list" id="delete">
                <h2>게시글 관리</h2>
                <i class="fas fa-file-excel"></i>
            </div>
            <div class="list" id="db">
                <h2>DataBase현황</h2>    
                <i class="fas fa-database"></i>
            </div>
            <div class="list" id="message">
                <h2>경고 보내기</h2>
                <i class="fas fa-envelope-square"></i>
            </div>
        </div>
    </div>
    
    <h3 class="desc_title">Management System</h3>
    <section class="all_user_desc">
        <div class="user_title_list">
			<h4>아이디/학번</h4>
			<h4>패스워드</h4>
			<h4>이름</h4>
			<h4>성별</h4>
			<h4>이메일</h4>
			<h5>추방</h5>
		</div>
    <%
		UserDAO userDAO = new UserDAO();
		ArrayList<User> list = userDAO.getList();
		for(int i=0; i<list.size();i++){
	%>
		
		<div class="user_desc_list">
			<p><%=list.get(i).getUserID() %> </p>
			<p><%=list.get(i).getUserPassword() %></p>
			<p><%=list.get(i).getUserName() %></p>
			<p><%=list.get(i).getUserGender() %></p>
			<p><%=list.get(i).getUserEmail()%> </p>
			<button onclick="userDel(<%=list.get(i).getUserID() %>)">삭제</button>
		</div>
		
	<%
		}
	%>
    </section>
    <section class="all_bbs_desc">
    	<div class="bbs_title_list">
       <div class="bbstop">
           <h4>게시번호</h4>
           <h4>제목</h4>
           <h4>날짜</h4>
           <h4>게시판 존재유무</h4>
       </div>
       <div class="move_see">
          <div class="move_wrap">
         <%
    		BbsDAO bbsDAO = new BbsDAO();
    		ArrayList<Bbs> list2 = bbsDAO.getList();
    		
    		for(int i=0;i<list2.size(); i++){
    	
    	%>
  
    	
           <div class="move">
               <div class="bbstop">
                   <h4><%=list2.get(i).getBbsID() %></h4>
                   <h4><%=list2.get(i).getBbsTitle()%></h4>
                   <h4><%=list2.get(i).getBbsDate() %></h4>
                   <h4>
                   		<%if(list2.get(i).getBbsAvailable()==1){%>
                   			존재	
                   			
                   		<% }else{ %>
                   			삭제 된 게시물
                   		<% }%>
                   		
                   </h4>
               </div>
               <div class="bbscontent">
                   <%=list2.get(i).getBbsContent() %>
               </div>
           </div>
           
        <%
    		}
    	%>
            
           
       </div>
       </div>
        
        <div class="right_arrow">
            <i class="fas fa-arrow-right"></i>
        </div>
        <div class="left_arrow">
            <i class="fas fa-arrow-left"></i>
        </div>
        <form method="post" id="frm" onsubmit="return del()" >
        	<div class="deleteBtn">
	   			<input type="text" id="text" placeholder="삭제할  게시번호" name="deleteNum">
	  			<input type="submit" value="삭제">	  		
	  		</div>
	  	 </form>
	  	 
	  	  <form method="post" id="frm2" onsubmit="return mod()" >
        	<div class="modBtn">
	   			<input type="text" id="text" placeholder="되 살릴 게시물번호" name="modNum">
	  			<input type="submit" value="살리기">	  		
	  		</div>
	  	 </form>
   </div>
   		

    	
    </section>
    <script>
    	function del(){
    		if(confirm(frm.deleteNum.value+"번의 게시물을 삭제합니다.")){
    			location.href="mod?bbsID="+frm.deleteNum.value;
    		}
    		return false;
    	}
		function mod(){
    		if(confirm(frm2.modNum.value+"번의 게시물을 재등록합니다.")){
    			location.href="mod3?bbsID="+frm2.modNum.value;
    		}
    		return false;
    	}
    	
    	
    	function userDel(userID, userName){
    		if(confirm("학번 : "+userID+"을 추방합니다.")){
    			location.href="mod2?userID="+userID;
    		}
    	}
    	
    
    </script>
</body>
</html>