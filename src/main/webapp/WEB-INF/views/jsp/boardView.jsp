<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href=" http://localhost:8080/exam/css/team_project.css">
<link rel="stylesheet" type="text/css" media="only screen and (min-width:769px) and (max-width: 1200px) " href=" http://localhost:8080/exam/css/tablet.css">
<link rel="stylesheet" type="text/css" media="only screen and (max-width: 768px)" href=" http://localhost:8080/exam/css/mobile.css">
<link rel="stylesheet" href=" http://localhost:8080/exam/css/menubar.css">
<script src="http://localhost:8080/exam/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="http://localhost:8080/exam/js/ms.js"></script>
<script>
$(function(){
	var localhost = "http://localhost:8080/";
	$("#div_main").css("display","block");	
	var back = localhost+"exam/board/selectList"
	var del = localhost+"exam/board/delete"
	var search = localhost+"exam/board/searchList"
	

	var boardNo = urlParameter('boardNo');
	var boardMenu = urlParameter('boardMenu');
	
	$.ajax({method:"get",url:"/exam/plus",data:{boardNo:boardNo}})
	.done(function(data){
		console.log("조회수상승");
	});
	
	$.ajax({method:"get",url:"http://localhost:8080/exam/board/selectOne",data:{boardNo:boardNo}})
	.done(function(data){
		var d = JSON.parse(data);
		console.log(d);
		$("#textview").html(d.result.content);
		$("#textTitle").text(d.result.title);
	});
	
	$("#load").on("click",function(){
		location.href="http://localhost:8080/exam/move/boardUpdate?boardMenu="+boardMenu+"&boardNo="+boardNo
	});
	$("#del").on("click",function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del){			
			alert("삭제하였습니다");
			location.href="http://localhost:8080/exam/board/delete?boardMenu="+boardMenu+"&page=0&boardNo="+boardNo;
		}
	});
	$("#back").on("click",function(){
		//location.href="http://localhost:8080/exam/board/selectList&boardMenu="+boardMenu+"&page=0";
		location.href="http://localhost:8080/exam/board/selectList?boardMenu="+boardMenu+"&page=0";
	});
});
</script>
</head>
<body>
	<div id="div_main">
        <div id="div1">
            <div id="home">
                <img src="http://localhost:8080/exam/img/small-logo.png">
            </div>
        </div>
        <div id="div1_1">
            <img src="http://localhost:8080/exam/img/side-logo.png">
        </div>
        <nav id="nav_div2">
           <div id="div2">
               <a id="atag2" href="#"><img id="menu1" src="http://localhost:8080/exam/img/menu%20icon.png"></a>           
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
                <div id="reg" class="atag" href="#"><img id="img1" src="http://localhost:8080/exam/img/register%20icon.png"></div>
                <div id="login" class="atag" href="#"><img id="img2" src="http://localhost:8080/exam/img/login_icon.png"></div>
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
                <div><img id="backbutton" src="http://localhost:8080/exam/img/back.png"></div><div><img id="smallloginbutton" src="http://localhost:8080/exam/img/login.png"></div>
            </form>
            </div>
        </nav>
        <div id="div4">
			<section id="view">
				<h1>상세 화면</h1>
				<h2 id="viewTitle"></h2>
				<hr>
				<p id="viewContents"></p>
				<h1 id="textTitle"></h1>
				<div id="textview" style="display: block;">
				</div>
				<button type="button" id="load">수정</button><button type="button" id="del">삭제</button><button type="button" id="back">돌아가기</button>
			</section>        	
        </div>
        <div id="div5">
            <img class="div5_img" src="http://localhost:8080/exam/img/twitter-logo.png">
            <img class="div5_img" src="http://localhost:8080/exam/img/facebook.png">
            <img class="div5_img" src="http://localhost:8080/exam/img/instagram.png">
            <img class="div5_img" src="http://localhost:8080/exam/img/play-store.png">
            <img class="div5_img" src="http://localhost:8080/exam/img/app-store.png">
            <div>Copyright 2018 by Team4. All rights reserved</div>
        </div>
    </div>
</body>
</html>