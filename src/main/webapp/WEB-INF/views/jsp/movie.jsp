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
/* 영화게시판들 */
$(function(){
	var image = "http://localhost:8080/exam/img/moveimg/";
	
	var a=0;
	var parent = 0;

	list = [{title:"데드풀 2",image:"deadpool2.jpg",realdate:"2018.05.16",director:"데이빗 레이치",genre:"코미디, SF, 액션, 어드벤처",Showtime:"117",Contents:"마침내, 그 분이 오신다! 이번엔 혼자가 아니다!암치료를 위한 비밀 실험에 참여한 후, 강력한 힐링팩터 능력을 지닌 슈퍼히어로 데드풀로 거듭난 웨이드 윌슨(라이언 레놀즈), 운명의 여자친구 바네사(모레나 바카린)와 행복한 미래를 꿈꾸지만 다시 나락으로 떨어지고, 밑바닥까지 내려간 데드풀은 더 나은 사람이 되기로 결심한다. 어느 날, 미래에서 시간 여행이 가능한 용병 케이블(조슈 브롤린)이 찾아 오면서 새로운 사건이 발생하고 데드풀은 생각지도 못한 기상천외 패밀리를 결성하게 되는데...",point:30,people:8,age:19},
	        {title:"물랑루즈",image:"MoulinRouge.gif",realdate:"2001.10.27",director:"배즈 루어먼",genre:"백스테이지 뮤지컬, 코미디 영화, 로맨스, 드라마",Showtime:"130",Contents:"막이 오르는 순간, 위대한 사랑이 시작된다!1899년 파리, 지상에서 가장 화려한 세계 ‘물랑 루즈’ 최고의 뮤지컬 가수 샤틴은 신분 상승과 성공을 위해 투자자를 구하다가 우연히 사랑을 찾아 몽마르트르로 흘러온 영국의 낭만파 시인 크리스티앙을 만나게 된다. 샤틴에게서 운명적 사랑을 느낀 크리스티앙은 그녀가 있는 ‘물랑 루즈’라는 신비의 세계에 발을 들여놓는다. 하지만 그 둘 사이에 거역할 수 없는 슬픈 운명이 서서히 다가오는데...",point:100,people:20,age:15},
	        {title:"트루스오브데어",image:"trueordare.jpg",realdate:"2018.04.13",director:"제프 워들로",genre:"공포 영화, 스릴러, 초자연적현상",Showtime:"103",Contents:"선택해. TRUTH OR DARE무엇을 선택하든 공포는 시작될 거야",point:30,people:10,age:15},
	        {title:"라라랜드",image:"lalaland.jpg",realdate:"2016.11.09",director:"데이미언 셔젤",genre:"코미디 영화, 백스테이지 뮤지컬, 로맨스, 드라마",Showtime:"128",Contents:"꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’. 재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤), 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.",point:20,people:5,age:12},
	        {title:"루비스팍스",image:"Ruby_Sparks.jpg",realdate:"2012.07.25",director:"조나단 데이톤",genre:"코미디 영화, 로맨스, 드라마, 판타지 영화",Showtime:"104",Contents:"꿈 속에서 만난 이상형 루비를 주인공으로로맨틱한 소설을 쓰며 상상 연애 중인 천재작가 캘빈.어느 날, 그에게 너무 사랑스러운 그녀루비가 소설을 찢고 눈 앞에 나타났다!널 상상 사랑해도 될까?캘빈이 상상하고 쓰는 대로 변신하는 루비.완0벽한 그녀와 현실 연애를 시작한 캘빈은진짜 사랑에 빠질수록 점점 혼란스러워지는데...우리, 마법일까? 사랑일까?",point:100,people:25,age:15},
	        {title:"독전",image:"Believer.jpg",realdate:"2012.05.22",director:"이해영",genre:"액션, 범죄",Showtime:"123",Contents:"아시아 최대 마약 조직, 실체 없는 적을 추적하라!                의문의 폭발 사고 후, 오랫동안 마약 조직을 추적해온 형사 '원호'(조진웅)의 앞에 조직의 후견인 '오연옥'(김성령)과 버림받은 조직원 '락'(류준열)이 나타난다. 그들의 도움으로 아시아 마약 시장의 거물 '진하림'(김주혁)과 조직의 숨겨진 인물 '브라이언'(차승원)을 만나게 되면서 그 실체에 대한 결정적 단서를 잡게 되는데··· 끝까지 의심하라! 5월 24일, 독한 자들의 전쟁이 시작된다!",point:10,people:2,age:15}];

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
		                <h1>현재상영작</h1>
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