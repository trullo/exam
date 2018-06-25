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
<script src="http://localhost:8080/exam/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="http://localhost:8080/exam/js/ms.js"></script>
<script>
/* 영화게시판들 */
$(function(){
	var image = "http://localhost:8080/exam/img/moveimg/";
	var img = "http://localhost:8080/exam/img/movie/";
	var list;
	var a=0;
	var d;
	var parent = 0;
	var movieNo;
	var point;
	var people;
	
	$.ajax({method:'get',url:"/exam/movie/list2"})
	.done(function(data){
		d = JSON.parse(data);
		list = d;
		console.log(list);
		creat_list(list);
	});

	/* 게시판만들기 */
	var creat_list = function(d){
		for(var i=0;i<d.file.length;i++){
	        var html="";
	        html+='<div class="moveview">';
	        html+='<div style="background-image: url('+img+d.movie[i].movieNo+'/'+d.file[i].fileName+')">';
	        html+='<div class="evaluation">';
	        html+='<input type="hidden" id="num" value="'+d.movie[i].movieNo+'">';
	        html+='<div>';
	        html+='<span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>';
	        html+='</div>';
	        html+='<div>';
	        html+='<p></p>';
	        html+='</div>';
	        html+='</div>';
	        html+='</div>';
	        switch(d.movie[i].age){
	            case '0' : html+='<div><div style="background-color: green;" class="age">'+d.movie[i].age+'</div>'; break;
	            case '12' : html+='<div><div style="background-color: skyblue;" class="age">'+d.movie[i].age+'</div>'; break;
	            case '15' : html+='<div><div style="background-color: rgb(230, 189, 17);" class="age">'+d.movie[i].age+'</div>'; break;
	            case '19' : html+='<div><div style="background-color: red;" class="age">'+d.movie[i].age+'</div>'; break;
	        }
	        html+='<div class="title"><p>'+d.movie[i].title+'</p></div></div>';
	        html+='<div><button class="move_info">상세정보</button></div>';
	        html+='</div>';
	        $("#div4 .div4_view").append(html);
	        console.log(i);
		}
		
		/* 영화게시판 - 클릭에대한 액션들 */
		$(".evaluation").on("mouseover",function(){
		    parent = $(this).parent().parent().index();
		    if(a==0){
		    $(".evaluation p").html("평점을 입력해주세요");
		    a++;
		    };
		});
		var text;
		var point;
		$(".evaluation span").on({mouseover:function(){
		    var index = $(this).index();
		    for(var i=0;i<=index;i++){
		        $(".moveview").eq(parent).find("div").find(".evaluation").find("span").eq(i).html("★");
		    };
		    
		    switch(index){
		        case 0 : $(".evaluation p").html("시간이아까워요"); 
		        		 text = "시간이아까워요"; point = 1;break;
		            case 1 : $(".evaluation p").html("기대하지말아요");
		            	 text = "기대하지말아요"; point = 2; break;
		            case 2 : $(".evaluation p").html("볼만하네요"); 
		            	 text = "볼만하네요";point = 3;  break;
		            case 3 : $(".evaluation p").html("기대만큼이네요");
		            	 text = "기대만큼이네요"; point = 4; break;
		            case 4 : $(".evaluation p").html("멋진영화였어요!!")
		            	 text = "멋진영화였어요!!"; point = 5;
		    }
		},mousedown:function(){
			movieNo = $(this).parent().parent().find("#num").val();
			var bool = confirm("정말 "+text+"\n라고 평가하시겠습니까?")
			console.log(movieNo);
			
 			if(bool){
				$.ajax({method:"post",url:"/exam/mark/insert",data:{movieNo:movieNo,mark:point}})
				.done(function(data){
					var f = JSON.parse(data);
					console.log(f);
					if(f.status==0){
						alert("평가완료");
					}
					else{
						alert(f.result.mark+"점으로 이미 투표하셨습니다.");
					}
				});
				
			} 

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
		    movieNo = $(this).parent().parent().find(".evaluation").find("#num").val();
		    console.log(movieNo);
		    //alert(list[index].title);         

		    $.ajax({method:"get",url:"/exam/mark/list",data:{movieNo:movieNo}})
		    .done(function(data){
		    	console.log(data);
		    	var mp = JSON.parse(data).result;
 			    	 for(var i=0;i<=(parseInt(mp.point/mp.people))-1;i++){
					        $("#star_point div div").find("span").eq(i).html("★");
				     };
				     
				     $("#star_point people").text(mp.people+"명");
				     $("#star_point point").text(mp.point/mp.people); 
		    });		    
		    
		    
		    $("#age_title .age").text(list.movie[index].age);
		    switch(list.movie[index].age){
		            case 0 : $("#age_title .age").css("background-color","green");
		            break;
		            case 12 : $("#age_title .age").css("background-color","skyblue");
		            break;
		            case 15 : $("#age_title .age").css("background-color","rgb(230, 189, 17)");
		            break;
		            case 19 : $("#age_title .age").css("background-color","red");
		            break;
		    }                
		    $("#poster_header #img").css("background-image","url("+img+list.movie[index].movieNo+'/'+list.file[index].fileName+")");
		    $("#age_title .title").text(list.movie[index].title);
		    $("realdate").text(list.movie[index].release);
		    $("director").text(list.movie[index].director);
		    $("genre").text(list.movie[index].zenre);     
		    $("showtime").text(list.movie[index].showtime+"분");
		    $("#poster_contents p").text(list.movie[index].summary);
	

		    
/* 		    for(var i=0;i<=(parseInt(list[index].point/list[index].people))-1;i++){
		        $("#star_point div div").find("span").eq(i).html("★");
		    };
 */	
 
/* 		    $("#star_point people").text(list[index].people+"명");
		    $("#star_point point").text(list[index].point/list[index].people); */
		    $("#poster_back").css("display","block");  
	
		});            
	
		/* 영화 상세보기 별주기 */
		$("#poster_back #poster_body #poster_header #header_in #star span").on({mouseover:function(){
		    var index = $(this).index();
		    for(var i=0;i<=index;i++){
		        $("#poster_back #poster_body #poster_header #header_in #star").find("span").eq(i).html("★");
		    };              
		    switch(index){
	        case 0 : $(".evaluation p").html("시간이아까워요"); 
	        		 text = "시간이아까워요"; point = 1;break;
	            case 1 : $(".evaluation p").html("기대하지말아요");
	            	 text = "기대하지말아요"; point = 2; break;
	            case 2 : $(".evaluation p").html("볼만하네요"); 
	            	 text = "볼만하네요";point = 3;  break;
	            case 3 : $(".evaluation p").html("기대만큼이네요");
	            	 text = "기대만큼이네요"; point = 4; break;
	            case 4 : $(".evaluation p").html("멋진영화였어요!!")
	            	 text = "멋진영화였어요!!"; point = 5;
	    }
		    },mousedown:function(){
				var bool = confirm("정말 "+text+"\n라고 평가하시겠습니까?")
				console.log(movieNo);
				
	 			if(bool){
					$.ajax({method:"post",url:"/exam/mark/insert",data:{movieNo:movieNo,mark:point}})
					.done(function(data){
						var f = JSON.parse(data);
						console.log(f);
						if(f.status==0){
							alert("평가완료");
						}
						else{
							alert(f.result.mark+"점으로 이미 투표하셨습니다.");
						}
					});
					
				} 

			},mouseout:function(){
		        for(var i=0;i<=4;i++){
		            $("#poster_back #poster_body #poster_header #header_in #star").find("span").eq(i).html("☆");
		        };   
		        $("#poster_back #poster_body #poster_header #header_in p").html("평점을 입력해주세요");
		    }
		})
	
		$("#poster_back a").on("click",function(){
		    for(var i=0;i<=4;i++){
		        $("#star_point div div").find("span").eq(i).html("☆");
		    };                
		    $("#poster_back").css("display","none")
		})
		$("#poster_body").on("click",function(){

		})
	}
	//creat_list();

	$("#posterDel").on("click",function(){
		var bdp = confirm("정말 삭제하시겠습니까?");
		if(bdp){
			$.ajax({method:"post",url:"/exam/mark/del",data:{movieNo:movieNo}})
			.done(function(data){
				var s = JSON.parse(data);
				console.log(s);
				if(s.result == 1){
					alert("삭제성공");
				}
				else{
					alert("삭제하는 도중에 문제가 생겼습니다.")
				}
			})
		}
	})




	
	$("#div4_foot #btn").on("click",function(){
		location.href="movieWrite";
	});
	
	$("#div_main").css("display","block");
})
          
</script>
</head>
<body>
   <article id="poster_back">
        <a>X</a>
        <input type="button" id="posterDel" value="Del">
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
                   		<input type="hidden" id="num">
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
		    <div class="div4_index" id="div4_movie">
		            <div>
		                <h1>개봉예정영화</h1>
		            </div>
		            <hr>
		            <div class="div4_view">
		  
		            </div>           
		            <div id="div4_foot">
			            <c:if test="${member.level eq '관리자'}">
			            	<button id="btn">작성</button>
			            </c:if>
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