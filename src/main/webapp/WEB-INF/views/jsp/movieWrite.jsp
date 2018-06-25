<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href=" /exam/css/team_project.css">
<link rel="stylesheet" type="text/css" media="only screen and (min-width:769px) and (max-width: 1200px) " href=" /exam/css/tablet.css">
<link rel="stylesheet" type="text/css" media="only screen and (max-width: 768px)" href=" /exam/css/mobile.css">
<link rel="stylesheet" href=" /exam/css/menubar.css">
<script src="/exam/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/exam/js/ms.js"></script>
<script>
	$(function(){
		var localhost = "/";
		$("#div_main").css("display","block");
		
		$("#movieForm").on("submit",function(event){
			event.preventDefault();
			
			$.ajax({type:"post",
				url:"/exam/movie/insert",
				data:new FormData($(this)[0]),
				cache: false,
				contentType: false,
				processData: false})
			.done(function(data){
				var d = JSON.parse(data);
				console.log(d);
				if(d.status == 1 && d.status2 == 1){
					alert("영화게시판 작성완료");
					location.href="/exam/move/index";
				}
				else{
					alert("이상발생");
				}
			});     
		});

	})
</script>
</head>
<body>
	<div id="div_main">
        <div id="div1">
            <div id="home">
                <img src="/exam/img/small-logo.png">
            </div>
        </div>
        <div id="div1_1">
            <img src="/exam/img/side-logo.png">
        </div>
        <nav id="nav_div2">
           <div id="div2">
               <a id="atag2" href="#"><img id="menu1" src="/exam/img/menu%20icon.png"></a>           
                <div id='cssmenu'>
                <ul>
                   <li class='active has-sub'><span>영화</span>
                      <ul>
                         <li id="menu_btn1" class='has-sub'><span>현재상영작</span>
                         </li>
                         <li id="menu_btn2" class='has-sub'><span>개봉예정영화</span>
                         </li>
                      </ul>
                   </li>
                   <li class='active has-sub'><span>게시판</span>
                      <ul>
                          <li id="menu_btn3" class='has-sub'><span>영화소통게시판</span>
                         </li>
                          <li id="menu_btn4" class='has-sub'><span>자유게시판</span>
                         </li>
                      </ul>
                   </li>
                   <li id="menu_btn5" class='active has-sub'><span>내근처영화관</span></li>
                   <li id="menu_btn6" class='active has-sub'><span>Q&A</span></li>
                   <c:if test="${member == null}">
                   	<li id="menu_btn7" class='active has-sub'><span>Login</span></li>
                   	<li id="menu_btn8" class='active has-sub'><span>SingUp</span></li>
                   </c:if>
                   <c:if test="${member != null}">
                   	<li id="menu_btn9" class='active has-sub'><span>Logout</span></li>
                   </c:if>                   
                </ul>
                </div>
                <div id="reg" class="atag" href="#"><img id="img1" src="/exam/img/register%20icon.png"></div>
                <div id="login" class="atag" href="#"><img id="img2" src="/exam/img/login_icon.png"></div>
            </div>
            <nav id="navigation-menu">
                <ul>
                        <li><a>현재 상영작</a></li><hr>
                        <li><a>개봉예정영화</a></li><hr>
                        <li><a>영화소통 게시판</a></li><hr>
                        <li><a>자유 게시판</a></li><hr>
                        <li><a>내 근처 영화관</a></li><hr>
                        <li><a>Q & A</a></li>
                </ul>
            </nav>          
            <div id="navigation-login">
            <form>
                <p>ID: &nbsp;&nbsp;<input id="nid" class="input_type" type="text" placeholder="아이디를 입력하세요." autofocus required><img src=""></p>
                <p>PW: <input id="npw" class="input_type" type="text" placeholder="비밀번호를 입력하세요." required></p>
                <div><img id="backbutton" src="/exam/img/back.png"></div><div><img id="smallloginbutton" src="/exam/img/login.png"></div>
            </form>
            </div>
        </nav>
        <div id="div4" class="rel">
        	<h1 style="text-align: cetner">영화 작성</h1>
        	<form id="movieForm" enctype="multipart/form-data" method="post">
		        <div id="div4_movieWrite">
		        		<div>
		        			<select id="movieMenu" name="movieMenu">
		        				<option value="1">현재상영작</option>
		        				<option value="2">개봉예정영화</option>
		        			</select>	
		        			<input id="title" name="title" type="text" placeholder="영화제목을 입력해주세요"> 
		        		</div>
		        		<div>
		        			연령 : 
		        			<input type="radio"  id="age" name="age" value="0">전체이용가
		        			<input type="radio"  id="age" name="age" value="12">12세
		        			<input type="radio"  id="age" name="age" value="15">15세
		        			<input type="radio"  id="age" name="age" value="19">19세
		        		</div>
		        		<div>
		        			개봉날 : <input id="release" name="release" type="text" placeholder="0000.00.00">
		        		</div>
		        		<div>
		        			감독 : <input id="director" name="director" type="text" placeholder="감독이름">
		        		</div>
	        			<div>
		        			장르 : <input id="zenre" name="zenre" type="text" placeholder="공포, 액션">
		        		</div>
	        			<div>
		        			상영시간 : <input id="showtime" name="showtime" type="number" placeholder="100">
		        		</div>
		        		<div>
		        			이미지 첨부 : <input id="file" name="file" type="file">
		        		</div>				        		
	        			<div>
		        			줄거리 :
		        		</div>	
		        		<div>
		        			<textarea id="summary" name="summary" rows="10" cols="100"></textarea>
		        		</div>   
		        		<div style="display: none;">
		        			<input id="movieNo" name="movieNo" type="text" value="0"> 
		        		</div>     
	        			<div>        			
	        				<input type="submit" value="작성">
	        			</div>
			    </div> 
	   		</form>		    
        </div>
        <div id="div5">
            <img class="div5_img" src="/exam/img/twitter-logo.png">
            <img class="div5_img" src="/exam/img/facebook.png">
            <img class="div5_img" src="/exam/img/instagram.png">
            <img class="div5_img" src="/exam/img/play-store.png">
            <img class="div5_img" src="/exam/img/app-store.png">
            <div>Copyright 2018 by Team4. All rights reserved</div>
        </div>
    </div>
</body>
</html>