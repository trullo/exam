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
	var insert = "http://localhost:8080/exam/user/insert";
	var checkId = "http://localhost:8080/exam/user/checkId";
	$("#div_main").css("display","block");
	var data = "${data}";
	console.log("${data[2]
	.
	1
	1
	
	}");
      data.forEach(function(row) {
         var html = "";
         html += '<tr style="border-bottom:1px solid #CCC;">';
           html += '<td class="boardstyle mobiledisplaynone num">' + row.boardNo + '</td>';
           html += '<td class="board_btn" style="cursor:pointer;" class="boardstyle mobiletitle title" >' + row.title + '</td>';
           html += '<td class="boardstyle name" >' + row.id + '</td>';
           html += '<td class="boardstyle date" >' + row.regDate + '</td>';
           html += '<td class="boardstyle mobiledisplaynone count" >' + row.viewCount + '</td>';
           html += '</tr>';
           $("#dataTable").append(html); 
      });
       $("#writebtn").on("click", function(){
          move_index("#write_page"); 
       });
       $(".board_btn").click(function(event){
           event.preventDefault();
           move_index("#board_view1");
       });
           $("#board_cancel").click(function(event){
           event.preventDefault();
           move_index("#div4_board");
       });
})
          
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
	        <div id="div4_board">
		            <div>
		                <h1>영화 소통 게시판</h1>
		            </div>
		            <hr>
		        <table class="div4_board_table">
		           <tr id="header" style="background-color: #A99595;">
		               <th class="mobiledisplaynone num" >번호</th>
		               <th class="title">글제목</th>
		               <th class="name">작성자</th>
		               <th class="date">작성일</th>
		               <th class="mobiledisplaynone count">조회수</th>
		           </tr>
		        </table>
		           <table class="div4_board_table div4_board_table2" id="dataTable" ></table>
		        
		        <div id="btn_3">
		            <form>
		                <input type="text" name="search" value="">
		                <input id="searchbtn" type="submit" value="">
		            </form>
		        </div>
		        <div id="btn_1">
		            <button id="writebtn" onclick="btn1_Event"></button>
		        </div>
		    </div> 
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