<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href=" http://localhost:8080/exam/css/team_project.css">
<link rel="stylesheet" type="text/css" media="only screen and (min-width:769px) and (max-width: 1200px) " href=" http://localhost:8080/exam/css/tablet.css">
<link rel="stylesheet" type="text/css" media="only screen and (max-width: 768px)" href=" http://localhost:8080/exam/css/mobile.css">
<link rel="stylesheet" href=" http://localhost:8080/exam/css/menubar.css">
<script src="http://localhost:8080/exam/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="http://localhost:8080/exam/js/ms.js"></script>
<script>
$(function(){
	var localhost = "http://localhost:8080/";
	$("#div_main").css("display","block");	

	var CDN_FULL = "https://cdn.ckeditor.com/4.7.3/full-all/ckeditor.js";
	var CDN_STANDARD = "https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js";
	var CDN_BASIC = "https://cdn.ckeditor.com/4.9.2/basic/ckeditor.js";
	$.getScript(CDN_FULL).done(function() {
          if (CKEDITOR.instances['edit']) {
              CKEDITOR.instances['edit'].destroy(); /* 기존 CKEDITOR 종료 */
          }
          /* CKEDITOR 생성*/
          CKEDITOR.replace('edit', {
        	  customConfig: '${pageContext.request.contextPath}/resources/js/config.js',
        	  filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload'
          });
      });
	
	
	var json = new Object();
	json.boardNo="${data.boardNo}";
	json.boardMenu="${data.boardMenu}";
	json.title="${data.title}";
	$("#view h1").text(<c:out value="${data.content}"/>);
	json.userNo="${data.userNo}";
	json.id="${data.id}";
	json.regDate="${data.regDate}";
	json.viewCount="${data.viewCount}";
	json.boardDelYn="${data.boardDelYn}";
	console.log(json);
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
                   <li id="menu_btn7" class='active has-sub'><span>Login</span></li>
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
				<textarea id="edit" name="edit"></textarea>
				<button type="button" id="load">수정</button>
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