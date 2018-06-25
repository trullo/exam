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
        /* 수동 슬라이드 쇼*/
        var slideIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
              x[i].style.display = "none"; 
            }
            slideIndex++;
            if (slideIndex > x.length) {slideIndex = 1} 
            x[slideIndex-1].style.display = "block"; 
            setTimeout(carousel, 1500); // Change image every 1.5 seconds
        }
        
         /* 자동슬라이드 쇼 */
        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
            showDivs(slideIndex += n);
        }

        function showDivs(n) {
            var i;
            var x = document.getElementsByClassName("mySlides");
            if (n > x.length) {slideIndex = 1} 
            if (n < 1) {slideIndex = x.length} ;
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none"; 
            }
            x[slideIndex-1].style.display = "block"; 
        }	
		if("${member}"){
			$("#div_main").css("display","block");
			$("#div0").css("display","none");
		}
	});
</script>
</head>
<body>
 
    <div id="div0">
        <img id="img_div0" src="/exam/img/big-logo.png">
        <button id="btn_div0">Visit Website</button>
    </div>
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
                <p>ID: &nbsp;&nbsp;<input id="nid" class="input_type" type="text" placeholder="아이디를 입력하세요."><img src=""></p>
                <p>PW: <input id="npw" class="input_type" type="text" placeholder="비밀번호를 입력하세요." required></p>
                <div><img id="backbutton" src="/exam/img/back.png"></div><div><img id="smallloginbutton" src="/exam/img/login.png"></div>
            </form>
            </div>
        </nav>
        <div id="div4">
                <img class="mySlides" src="/exam/img/7.jpg" style="width: 100%; display: block;">
                <img class="mySlides" src="/exam/img/2.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="/exam/img/3.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="/exam/img/4.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="/exam/img/5.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="/exam/img/6.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="/exam/img/1.jpg" style="width: 100%; display: none;">
                <div id="div4_1">
                   <div id="trailertitle">Venom Trailer</div>
                    <iframe src="https://www.youtube.com/embed/hyetTJz-0AY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
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