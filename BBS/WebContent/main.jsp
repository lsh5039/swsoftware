<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>



<!DOCTYPE html>
<html>
<head>
<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
	
		userID = (String) session.getAttribute("userID");
	}
	
%>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">
    <link rel="stylesheet" href="https://wowjs.uk/css/libs/animate.css">
    <script src="https://wowjs.uk/dist/wow.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="main.js"></script>
    <meta charset="UTF-8">
    <title>SW사업단</title>
    <script>
        $(function(){
            $(".cartegory,  .cartegory2").mouseover(function(){
                $(".gnb_wrap2").css("height","277px");
            })
            $(".cartegory, .cartegory2").mouseleave(function(){
                 $(".gnb_wrap2").css("height","0px");
            })
            
            
            $(".location").fadeOut(0);
            $(window).scroll(function(){
            	var t = $(window).scrollTop();
                if(t>400){
                    $(".location").fadeIn();
                }
                else{
                    $(".location").fadeOut();
                }
//                if($(this).scrollTop()>1000){
//                    $(".location").fadeIn();
//                }else{
//                    $(".location").fadeOut();
//                }
            });
            $(".location").click(function(){
               $("html,body").animate({
                   scrollTop:0
               },400);
                return false;
            });
            
           var infinityroof = setInterval(function(){
            var timeout = setTimeout(function(){
                $("#gnb").css({
                	"backgroundImage":"url('img/back.jpg')"
                });        
            },4000);
            
            var timeout2 = setTimeout(function(){
                $("#gnb").css({
                	"backgroundImage":"url('img/back2.jpg')"
                });    
            },8000);
            
            var timeout3 = setTimeout(function(){
                $("#gnb").css({
                    "backgroundImage":"url('img/back3.jpg')"
                });    
            },12000);
               
            },12000);
            
           var wow = new WOW({
               offset: 200
           });
           wow.init();
            
            
            
        }) //ready end
    </script>
</head>

<body>
    <header>
    
        <div class="header_wrap">
            <div id="logo"><a href="#"><img src="img/logo.png"></a></div>
            <div class="hCenter">
                <h1><a href="#">SW작품 게시판</a></h1>
            </div>
  

     
    <%
    	String masterID = "lsh5039";//관리자 ID
    	if(userID == null){
    		
    %>
    		<div class="hRight">
                <a href="login.jsp">로그인</a>
                <a href="join.jsp">회원가입</a>
            </div>

     <% 
     	
     
    	}else if(userID.equals(masterID)){ 
     %>
    	<div class="hRight">
             <a href="logout.jsp">로그아웃</a>
             <a href="control.jsp">관리자페이지</a>
        </div>     	
     	
     
     <%
    	}else{
     %>
    		 <div class="hRight">
                <a href="logout.jsp">로그아웃</a>
                <a href="management.jsp?userID=<%=userID%>">정보변경</a>
            </div>
     <%
     	}
     %>
     

    
           
        </div>
    </header>
    <nav id="gnb">
        <div class="gnb_wrap">
            <div class="cartegory">
                <a href="#">연도별</a>
            </div>
            <div class="cartegory">
                <a href="excellentProduct.jsp" target="_blank">우수작</a>
            </div>
            <div class="cartegory">
                <a href="#">lorem</a>
            </div>
            <div class="cartegory">
                <a href="write.jsp">작품게시</a>
            </div>
        </div>
        <div class="gnb_wrap2">
            <ul class="cartegory2">
               <li><a href="#">2020</a></li> 
               <li><a href="#">2019</a></li> 
               <li><a href="#">2018</a></li> 
               <li><a href="#">2017</a></li> 
            </ul>
            <ul class="cartegory2">
               <li><a href="excellentProduct.jsp" target="_blank">기업연계형</a></li> 
               <li><a href="excellentProduct.jsp" target="_blank">일반</a></li>  
            </ul>
            <ul class="cartegory2">
                <li><a href="#">lorem</a></li>
                <li><a href="#">lorem</a></li>
                <li><a href="#">lorem</a></li>
            </ul>
            <ul class="cartegory2">
                <li><a href="bbs.jsp">작품게시판</a></li>
                <li><a href="write.jsp">작품등록</a></li>
                
            </ul>
        </div>
        
    </nav>

    <section>
       <h1 class="title wow bounceInUp">올해의 작품</h1>
        <div class="section_wrap">
            <div class="product wow bounceInLeft" data-wow-duration="1.5s">
<!--               data-wow-delay="1s"-->
                <div class="pDesc">
                    <div class="pImg">
                        <img src="http://placehold.it/300x300">
                    </div>
                    
                    <div class="pDesc_info">
                      
                        <div class="left_pDesc">
                           
                            <h2>작품정보</h2>
                            <p class="product_name">작품명 : lorem</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam exercitationem laboriosam, atque ex. Voluptate, quidem aspernatur mollitia quaerat praesentium. Voluptates, culpa explicabo, itaque harum totam aut natus qui asperiores. Voluptate, commodi iusto veritatis voluptates odio quis vitae reprehenderit accusamus architecto molestias voluptatem illum ipsum! Amet, similique voluptates iste velit sit?
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum enim commodi sunt voluptates impedit ad laborum iusto quos magni iure!
                            </p>
                        </div>
                        <div class="right_pDesc">
                            <ul class="developer">
                                <li>개발자</li>
                                <li class="leader">lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                            </ul>
                        </div>
                    </div>
                    <a href="#">상세보기</a>
                </div>
            </div>
            <div class="product wow bounceInLeft" data-wow-duration="1.5s">
                <div class="pDesc">
                    <div class="pImg">
                        <img src="http://placehold.it/300x300">
                    </div>
                    <div class="pDesc_info">
                        <div class="left_pDesc">
                            <h2>작품정보</h2>
                            <p class="product_name">작품명 : lorem</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam exercitationem laboriosam, atque ex. Voluptate, quidem aspernatur mollitia quaerat praesentium. Voluptates, culpa explicabo, itaque harum totam aut natus qui asperiores. Voluptate, commodi iusto veritatis voluptates odio quis vitae reprehenderit accusamus architecto molestias voluptatem illum ipsum! Amet, similique voluptates iste velit sit?
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum enim commodi sunt voluptates impedit ad laborum iusto quos magni iure!
                            </p>
                        </div>
                        <div class="right_pDesc">
                            <ul class="developer">
                                <li>개발자</li>
                                <li class="leader">lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                            </ul>
                        </div>
                    </div>
                    <a href="#">상세보기</a>
                </div>
            </div>
            <div class="product wow bounceInLeft" data-wow-duration="1.5s">
                <div class="pDesc">
                    <div class="pImg">
                        <img src="http://placehold.it/300x300">
                    </div>
                    <div class="pDesc_info">
                        <div class="left_pDesc">
                            <h2>작품정보</h2>
                            <p class="product_name">작품명 : lorem</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam exercitationem laboriosam, atque ex. Voluptate, quidem aspernatur mollitia quaerat praesentium. Voluptates, culpa explicabo, itaque harum totam aut natus qui asperiores. Voluptate, commodi iusto veritatis voluptates odio quis vitae reprehenderit accusamus architecto molestias voluptatem illum ipsum! Amet, similique voluptates iste velit sit?
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum enim commodi sunt voluptates impedit ad laborum iusto quos magni iure!
                            </p>
                        </div>
                        <div class="right_pDesc">
                            <ul class="developer">
                                <li>개발자</li>
                                <li class="leader">lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                            </ul>
                        </div>
                    </div>
                    <a href="product_detail.jsp" target="_blank">상세보기</a>
                </div>
            </div>
            <div class="product wow bounceInLeft" data-wow-duration="1.5s">
                <div class="pDesc">
                    <div class="pImg">
                        <img src="http://placehold.it/300x300">
                    </div>
                    <div class="pDesc_info">
                        <div class="left_pDesc">
                            <h2>작품정보</h2>
                            <p class="product_name">작품명 : lorem</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam exercitationem laboriosam, atque ex. Voluptate, quidem aspernatur mollitia quaerat praesentium. Voluptates, culpa explicabo, itaque harum totam aut natus qui asperiores. Voluptate, commodi iusto veritatis voluptates odio quis vitae reprehenderit accusamus architecto molestias voluptatem illum ipsum! Amet, similique voluptates iste velit sit?
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum enim commodi sunt voluptates impedit ad laborum iusto quos magni iure!
                            </p>
                        </div>
                        <div class="right_pDesc">
                            <ul class="developer">
                                <li>개발자</li>
                                <li class="leader">lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                            </ul>
                        </div>
                    </div>
                    <a href="#">상세보기</a>
                </div>
            </div>
            <div class="product wow bounceInLeft" data-wow-duration="1.5s">
                <div class="pDesc">
                    <div class="pImg">
                        <img src="http://placehold.it/300x300">
                    </div>
                    <div class="pDesc_info">
                        <div class="left_pDesc">
                            <h2>작품정보</h2>
                            <p class="product_name">작품명 : lorem</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam exercitationem laboriosam, atque ex. Voluptate, quidem aspernatur mollitia quaerat praesentium. Voluptates, culpa explicabo, itaque harum totam aut natus qui asperiores. Voluptate, commodi iusto veritatis voluptates odio quis vitae reprehenderit accusamus architecto molestias voluptatem illum ipsum! Amet, similique voluptates iste velit sit?
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum enim commodi sunt voluptates impedit ad laborum iusto quos magni iure!
                            </p>
                        </div>
                        <div class="right_pDesc">
                            <ul class="developer">
                                <li>개발자</li>
                                <li class="leader">lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                                <li>lorem</li>
                            </ul>
                        </div>
                    </div>
                    <a href="#">상세보기</a>
                </div>
            </div>
        <div class="next_page">
        <ul class="next_page_wrap">
           <li><a href="#"><i class="fas fa-arrow-right"></i></a></li>
           <li><a href="#">1</a></li> 
           <li><a href="#">2</a></li> 
           <li><a href="#">3</a></li> 
           <li><a href="#">4</a></li> 
           <li><a href="#"><i class="fas fa-arrow-right"></i></a></li>
        </ul>
        </div>
        </div>
      
    </section>



    <footer>
        <div class="footer_wrap">
            <a href="#" id="footer_logo"><img src="./img/sw.PNG"></a>

            <div class="incidental">
                <ul class="in_top">
                    <a href="#">
                        <li>개인정보처리방침</li>
                    </a>
                    <a href="#">
                        <li>이메일무단수집거부</li>
                    </a>
                    <a href="#">
                        <li>교내전화번호</li>
                    </a>
                    <a href="#">
                        <li>찾아오시는길</li>
                    </a>
                    <a href="#">
                        <li>입찰공고</li>
                    </a>
                    <a href="#">
                        <li>은행계좌입금의뢰서</li>
                    </a>
                    <a href="#">
                        <li>조교임용번호조회</li>
                    </a>
                    <a href="#">
                        <li>예/결산공고</li>
                    </a>
                    <a href="#">
                        <li>대학정보공시제</li>
                    </a>
                    <a href="#">
                        <li>회의록</li>
                    </a>
                    <a href="#">
                        <li>자체평가보고서</li>
                    </a>
                    <a href="#">
                        <li>기관장업무추진비</li>
                    </a>
                </ul>
                <div class="in_bot">
                    <div class="in_bot_desc">
                        <p>38430 경상북도 경산시 하양읍 하양로 13-13</p>
                        <p>전화번호 053-850-3144</p>
                        <p>팩스번호 053-359-7000</p>
                    </div>
                    <div class="in_bot_logo">
                        <a href="#"><img src="img/logo2.jpg"></a>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <p>Copyright by Daegu Catholic University, all rights reserved.
                </p>
            </div>
        </div> 
    </footer>
    <div class="location">
        <p><i class="fas fa-long-arrow-alt-up"></i></p>
        <p>맨위로</p>
    </div>
    
</body>

</html>

