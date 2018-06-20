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
<script src="http://localhost:8080/exam/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="http://localhost:8080/exam/js/ms.js"></script>
<script>
/* 영화게시판들 */
$(function(){
	var image = "http://localhost:8080/exam/img/moveimg/";
	
	var a=0;
	var parent = 0;

    list = [{title:"라이크 크레이지",image:"new_movie1.jpg",realdate:" 2018.05.30",director:"드레이크 도리머스",genre:"드라마, 멜로, 로맨스",Showtime:"117",Contents:"사랑하고, 이별하고, 다시 돌아오다 영국 여자 '애나'와 미국 남자 '제이콥'은 LA에서 첫눈에 반한다. 서로에 대한 사랑을 쌓아가며 행복한 시간을 보내던 중, 애나의 학생 비자가 만료돼 영국으로 다시 돌아가야 하는 상황이 발생한다. 의도치 않게 장거리 연애를 시작한 둘은 점점 서로가 없는 삶에 익숙해지고 새로운 사람이 눈에 들어온다. 몇 개월 간의 갈등 끝에 애나는 중대한 결심을 하고 제이콥에게 전화를 건다",point:30,people:8,age:12},
        {title:"미드나잇 선",image:"new_movie2.jpg",realdate:"2018.06.16",director:"스콧 스피어",genre:"드라마, 멜로, 로맨스",Showtime:"92",Contents:"사랑을 꿈꿨던 낮, 사랑이 이뤄진 밤 어두운 밤에도 네가 나의 태양이었어XP(색소성건피증)라는 희귀병으로 태양을 피해야만 하는 케이티. 오직 밤에만 외출이 허락된 그녀에게는 어머니가 남겨준 기타와 창문 너머로 10년째 짝사랑해온 ‘찰리’가 세상의 빛이다. 어느 날 작은 기차역에서 한밤의 버스킹을 하던 ‘케이티’의 앞에 ‘찰리’가 나타나고, 두 사람은 매일 밤마다 모두가 부러워하는 완벽한 데이트를 이어간다. 처음으로 함께 여행을 떠난 날, 꿈 같은 시간을 보내던 ‘케이티’는 그만 지켜야만 하는 규칙을 어기게 되고 결국 피할 수 없는 선택을 해야만 하는데… ",point:30,people:6,age:12},
        {title:"메이플쏘프",image:"new_movie3.jpg",realdate:"2018.06.18",director:"펜튼 베일리, 랜디 바바토",genre:"다큐멘터리",Showtime:"109",Contents:"'거침없고 완벽하다!'이 시대 가장 뜨거웠던 논란의 중심에 선 포토그래퍼이자 뉴욕의 아이콘 로버트 메이플쏘프 누구보다 특별하고 화려했던 뉴욕에서의 기록",point:88,people:22,age:19},
        {title:"스탠바이, 웬디",image:"new_movie4.jpg",realdate:"2018.05.30",director:"벤 르윈",genre:"드라마, 코미디",Showtime:"93",Contents:"댕댕이 ‘피트’도 지리는(?) FM직진소녀 ‘웬디’427페이지 시나리오를 외우는 능력자 매일매일 요일별로 깔맞춤 하는 패션리더 알바생들 깜짝 놀라게 만든 샌프란시스코 최고의 썸녀 근데 ‘웬디’가 나보다 ‘스타 트렉’을 더 좋아하는 거 같아 고민이애오 ‘스타 트렉’ 시나리오 작가가 꿈이라고 무작정 LA로 떠난대오 멍무룩 5월에는 ‘웬디’ 하고 싶은 거 다 해!",point:120,people:40,age:12},
        {title:"세라비, 이것이 인생!",image:"new_movie5.jpg",realdate:"2018.05.30",director:"올리비에르 나카체, 에릭 토레다노",genre:"코미디",Showtime:"115",Contents:"17세기 고성에서의 의미 깊은 결혼식을 준비하는 웨딩 플래너 맥스 하.지.만 오늘따라 유달리 실수 연발에 손발 전혀 안 맞는 직원들로 인해 돌발 사고는 계속되고 예민하고 까다로운 클라이언트는 실시간 ‘지켜보고 있다’ 모드에 요구 사항은 점점 늘어만 간다! 과연 맥스는 엉망진창 팀원들과 함께 결혼식을 무사히 끝낼 수 있을까? 가장 아름답고 행복한 결혼식을 완성시키기 위한 맥스의 고군분투가 시작된다!",point:90,people:3,age:12},
        {title:"홈",image:"new_movie6.jpg",realdate:"2018.05.30",director:"김종우",genre:"드라마, 가족",Showtime:"100",Contents:"어느 날 갑자기 하늘에서 뚝 떨어진 가족!열네 살 소년의 행복 만들기 프로젝트가 시작된다!동생 성호, 성호의 친아빠 원재, 그리고 원재의 딸 지영까지. 어느 날 갑자기 새로운 식구가 생긴 준호는 매일매일 행복 뿜뿜이다. 준호를 아들처럼 챙기는 원재와 친형제처럼 따르는 동생들 덕이다. “우리 이렇게 계속 같이 있으면 좋겠다”는 준호의 말에 당연하다는 듯이 “같이 있다 아이가”라며 웃는 동생들. 이제 막 새 가족 속으로 골인한 준호의 소원은 이뤄질 수 있을까?",point:80,people:20,age:12}];

	/* 게시판만들기 */
	var creat_list = function(){
	    list.forEach(function(row){
	        var html="";
	        html+='<div class="moveview">';
	        html+='<div style="background-image: url('+image+row.image+')">';
	        html+='<div class="evaluation">';
	        html+='<div>';
	        html+='<span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>';
	        html+='</div>';
	        html+='<div>';
	        html+='<p></p>';
	        html+='</div>';
	        html+='</div>';
	        html+='</div>';
	        switch(row.age){
	            case 0 : html+='<div><div style="background-color: green;" class="age">'+row.age+'</div>'; break;
	            case 12 : html+='<div><div style="background-color: skyblue;" class="age">'+row.age+'</div>'; break;
	            case 15 : html+='<div><div style="background-color: rgb(230, 189, 17);" class="age">'+row.age+'</div>'; break;
	            case 19 : html+='<div><div style="background-color: red;" class="age">'+row.age+'</div>'; break;
	        }
	        html+='<div class="title"><p>'+row.title+'</p></div></div>';
	        html+='<div><button class="move_info">상세정보</button></div>';
	        html+='</div>';
	        $("#div4 .div4_view").append(html);
	    });
	}
	creat_list();


	/* 영화게시판 - 클릭에대한 액션들 */
	$(".evaluation").on("mouseover",function(){
	    parent = $(this).parent().parent().index();
	    if(a==0){
	    $(".evaluation p").html("평점을 입력해주세요");
	    a++;
	    };
	});

	$(".evaluation span").on({mouseover:function(){
	    var index = $(this).index();
	    for(var i=0;i<=index;i++){
	        $(".moveview").eq(parent).find("div").find(".evaluation").find("span").eq(i).html("★");
	    };
	    switch(index){
	        case 0 : $(".evaluation p").html("시간이아까워요"); break;
	            case 1 : $(".evaluation p").html("기대하지말아요"); break;
	            case 2 : $(".evaluation p").html("볼만하네요"); break;
	            case 3 : $(".evaluation p").html("기대만큼이네요"); break;
	            case 4 : $(".evaluation p").html("멋진영화였어요!!");
	    }
	},click:function(){


	},mouseout:function(){
	    for(var j=0;j<=$(".moveview").length-1;j++){
	        for(var i=0;i<=4;i++){
	            $(".moveview").eq(j).find("div").find(".evaluation").find("span").eq(i).html("☆");
	        };
	    }

	    $(".evaluation p").html("평점을 입력해주세요");
	}})

	/* 영화 상세정보 버튼 */
	$(".move_info").on("click",function(){
	    var index = $(this).parent().parent().index();
	    //alert(list[index].title);         

	    $("#age_title .age").text(list[index].age);
	    switch(list[index].age){
	            case 0 : $("#age_title .age").css("background-color","green");
	            break;
	            case 12 : $("#age_title .age").css("background-color","skyblue");
	            break;
	            case 15 : $("#age_title .age").css("background-color","rgb(230, 189, 17)");
	            break;
	            case 19 : $("#age_title .age").css("background-color","red");
	            break;
	    }                
	    $("#poster_header #img").css("background-image","url("+image+list[index].image+")");
	    $("#age_title .title").text(list[index].title);
	    $("realdate").text(list[index].realdate);
	    $("director").text(list[index].director);
	    $("genre").text(list[index].genre);     
	    $("showtime").text(list[index].Showtime+"분");
	    $("#poster_contents p").text(list[index].Contents);

	    for(var i=0;i<=(parseInt(list[index].point/list[index].people))-1;i++){
	        $("#star_point div div").find("span").eq(i).html("★");
	    };

	    $("#star_point people").text(list[index].people+"명");
	    $("#star_point point").text(list[index].point/list[index].people);
	    $("#poster_back").css("display","block");  

	});            

	/* 영화 상세보기 별주기 */
	$("#poster_back #poster_body #poster_header #header_in #star span").on({mouseover:function(){
	    var index = $(this).index();
	    for(var i=0;i<=index;i++){
	        $("#poster_back #poster_body #poster_header #header_in #star").find("span").eq(i).html("★");
	    };              
	    switch(index){
	        case 0 : $("#poster_back #poster_body #poster_header #header_in p").html("시간이아까워요"); break;
	            case 1 : $("#poster_back #poster_body #poster_header #header_in p").html("기대하지말아요"); break;
	            case 2 : $("#poster_back #poster_body #poster_header #header_in p").html("볼만하네요"); break;
	            case 3 : $("#poster_back #poster_body #poster_header #header_in p").html("기대만큼이네요"); break;
	            case 4 : $("#poster_back #poster_body #poster_header #header_in p").html("멋진영화였어요!!");
	        }
	    },click:function(){

	    },mouseout:function(){
	        for(var i=0;i<=4;i++){
	            $("#poster_back #poster_body #poster_header #header_in #star").find("span").eq(i).html("☆");
	        };   
	        $("#poster_back #poster_body #poster_header #header_in p").html("평점을 입력해주세요");
	    }
	})

	$("#poster_back").on("click",function(){
	    for(var i=0;i<=4;i++){
	        $("#star_point div div").find("span").eq(i).html("☆");
	    };                
	    $("#poster_back").css("display","none")
	})
	
	$("#div_main").css("display","block");
})
          
</script>
</head>
<body>
   <article id="poster_back">
        <a>X</a>
        <div id="poster_body"> 
            <div id="poster_header">
               <div id="img">
               </div>            
               <div id="header_in">
                   <div id="age_title">
                       <div class="age" style="background-color: skyblue;" >12</div>
                       <div class="title"></div>
                   </div>
                   <div id="star_point">
                        <div>
                            <div><span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span></div>
                            <people>10명 참여</people>
                        </div>
                        <div>
                            <point>7.8</point>                        
                       </div>
                   </div>
                   <div id="date">
                        <span class="parent_text">개봉일 : </span><realdate class="item_text">2001.10.27</realdate>
                   </div>
                   <div >
                        <span class="parent_text">감독 : </span><director class="item_text">director</director>
                   </div>
                   <div c>
                       <span class="parent_text">장르 : </span><genre class="item_text">백스테이지 뮤지컬, 코미디 영화, 로맨스, 드라마</genre>
                   </div>
                   <div id="div_showtime">
                       <span class="parent_text">상영시간 : </span><showtime class="item_text">114분</showtime>
                   </div>
                    <div id="star">
                        <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                    </div>
                    <div>
                        <p></p>
                    </div>
               </div>
            </div>
            <div id="poster_contents">
                <h1>줄거리</h1>
                <p></p>
            </div>
        </div>
    </article>     
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
		    <div id="div4_index">
		            <div>
		                <h1>개봉예정영화</h1>
		            </div>
		            <hr>
		            <div class="div4_view">
		  
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