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
	var insert = "/exam/user/insert";
	var checkId = "/exam/user/checkId";
	var write = "/exam/move/boardWrite";
	var boardView = "/exam/move/boardView";
	var search = localhost+"exam/board/searchList";
	$("#div_main").css("display","block");
	
	var result = new Array();
	var page = "${page}";		//현재폐이지
	var max = "${max.max}";		//게시판 최대글
	var linkLength = parseInt(max/10 + 1);  		
	var linkStart = parseInt(page/10 +1);	
	var linkStarthead = parseInt(page/10);
	var linkLast = linkStart>=linkLength?linkLength:linkLength==1?1:linkStart + 9; 				//1  + 9 10까지 11 + 9 20 까지 끝단이면 거기까지
	
		var boardMenu = urlParameter("boardMenu");
	console.log(boardMenu)
 	switch(boardMenu)  { 
		case '1' : $("#div4Head").text("영화소통게시판"); break;
		case '2' : $("#div4Head").text("자유 게시판"); break;
		case '3' : $("#div4Head").text("Q&A"); break;
	}
	
	/* 배열을 모델로 넘겨줬을때 jstl로 받는방법 */
	<c:forEach items="${data}" var="info">
		var json = new Object();
		json.boardNo="${info.boardNo}";
		json.boardMenu="${info.boardMenu}";
		json.title="${info.title}";
		json.userNo="${info.userNo}";
		json.id="${info.id}";
		json.regDate="${info.regDate}";
		json.viewCount="${info.viewCount}";
		json.boardDelYn="${info.boardDelYn}";
		json.max="${info.max}";
		result.push(json);
	</c:forEach>
	
	var number=0;
	for(var i = (linkStarthead*10+1);i<=linkLast;i++){
		var html = "";

		if( linkStarthead != 0 && i%10==1 ) {
			number = i;
			html += "<li><a href='/exam/board/selectList?boardMenu="+boardMenu+"&page="+(i-10)+"'><</a></li>";
		}
			html += "<li><a href='/exam/board/selectList?boardMenu="+boardMenu+"&page="+(i-1)+"'>"+i+"</a></li>";
		if(i%10==0 && i!=0){
			html += "<li><a href='/exam/board/selectList?boardMenu="+boardMenu+"&page="+(i+1)+"'>></a></li>";
		}
		$("#link ul").append(html);
		
	}
	

	result.forEach(function(row){
        var html = "";
        html += '<tr style="border-bottom:1px solid #CCC;">';
          html += '<td class="boardstyle mobiledisplaynone num">' + row.boardNo + '</td>';
          html += '<td class="board_btn" style="cursor:pointer;" class="boardstyle mobiletitle title" ><a href="'+boardView+'?boardMenu='+row.boardMenu+'&boardNo='+row.boardNo+'">' + row.title + '</a></td>';
          html += '<td class="boardstyle name" >' + row.id + '</td>';
          html += '<td class="boardstyle date" >' + row.regDate + '</td>';
          html += '<td class="boardstyle mobiledisplaynone count" >' + row.viewCount + '</td>';
          html += '<input type="hidden" name="num" value="'+row.boardNo+'"/>';
          html += '</tr>';
          $("#dataTable").append(html); 
	});
	
	$("#writebtn").on("click",function(){
		location.href=write+"?boardMenu="+boardMenu;
	})
	
	$("#searchbtn").on("click",function(){
		$("#div5").css('display','none');
		var text = $("#text").val();
		$.ajax({method:"get",url:"/exam/board/searchList",data:{text:text,boardMenun:boardMenu}})
		.done(function(data){
			var j = JSON.parse(data);
			console.log(j);
			$("#dataTable").empty();
			$("#link ul").empty();
			for(var i=0;i<j.result.length;i++){
		        var html = "";
		        html += '<tr style="border-bottom:1px solid #CCC;">';
		          html += '<td class="boardstyle mobiledisplaynone num">' + j.result[i].boardNo + '</td>';
		          html += '<td class="board_btn" style="cursor:pointer;" class="boardstyle mobiletitle title" ><a href="'+j.result[i].boardView+'?boardMenu='+j.result[i].boardMenu+'&boardNo='+j.result[i].boardNo+'">' + j.result[i].title + '</a></td>';
		          html += '<td class="boardstyle name" >' + j.result[i].id + '</td>';
		          html += '<td class="boardstyle date" >' + j.result[i].regDate + '</td>';
		          html += '<td class="boardstyle mobiledisplaynone count" >' + j.result[i].viewCount + '</td>';
		          html += '<input type="hidden" name="num" value="'+j.result[i].boardNo+'"/>';
		          html += '</tr>';
		          $("#dataTable").append(html); 
		          
			}
		});
	});
/*       data.forEach(function(row) {
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
       }); */
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
                <p>ID: &nbsp;&nbsp;<input id="nid" class="input_type" type="text" placeholder="아이디를 입력하세요." autofocus required></p>
                <p>PW: <input id="npw" class="input_type" type="text" placeholder="비밀번호를 입력하세요." required></p>
                <div><img id="backbutton" src="/exam/img/back.png"></div><div><img id="smallloginbutton" src="/exam/img/login.png"></div>
            </form>
            </div>
        </nav>
        <div id="div4">
	        <div id="div4_board">
		            <div>
		                <h1 id="div4Head"></h1>
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
			                <input type="text" id="text" name="text" value="">
			                <input id="searchbtn" type="button" value="">
			            </form>
			        </div>
			        <div ID="link">
			        	<ul>
			        		
			        	</ul>
			        </div>
			        <div id="btn_1">
			        	<c:if test="${member != null}">
			            <button id="writebtn"></button>
			            </c:if>
			        </div>
		    </div> 
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