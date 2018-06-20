<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> Title </title>
	<link rel="stylesheet" type="text/css" href="team_project.css">
	<link rel="stylesheet" type="text/css" media="only screen and (min-width:769px) and (max-width: 1200px) " href="tablet.css">
    <link rel="stylesheet" type="text/css" media="only screen and (max-width: 768px)" href="mobile.css">
    <link rel="stylesheet" href="menubar.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script> src="ms.js"></script>
    <script>
        $(function(){
                    var move_index = (str) => {
                        $("#div4").load(`collection.html ${str}`,function(){
                        
                            //들어오는 str이 누구냐에 따라 콜백함수가 어떻게
                            if(str=="#div4_map"){
                                 $.getScript("http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&key=AIzaSyAha88ou3uEZFgOFxBZhqoIJP5_6ihwzbw", function(){
                                var map;
                                var infowindow;
                                function getLocation(){ //좌표 자동 생성
                                            if(navigator.geolocation){
                                                navigator.geolocation.getCurrentPosition(initMap);
                                            }else{
                                                alert("Not Support Browser");
                                            }
                                    }

                                  function initMap(position) {
                                    geocoder = new google.maps.Geocoder();

                                    var pyrmont = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
                                    map = new google.maps.Map(document.getElementById('div4_map'), {
                                      center: pyrmont,
                                      zoom: 14
                                    });

                                    infowindow = new google.maps.InfoWindow();
                                    var service = new google.maps.places.PlacesService(map);
                                    service.nearbySearch({
                                      location: pyrmont,
                                      radius: 5000,
                                      type: ['movie_theater']
                                    }, callback);
                                  }

                                  //google.maps.event.addDomListener(window, 'load', getLocation);
                                  getLocation();

                                  function callback(results, status) {
                                    if (status === google.maps.places.PlacesServiceStatus.OK) {
                                      for (var i = 0; i < results.length; i++) {
                                        createMarker(results[i]);
                                      }
                                    }
                                  }

                                  function createMarker(place) {
                                    var placeLoc = place.geometry.location;
                                    var marker = new google.maps.Marker({
                                      map: map,
                                      position: place.geometry.location
                                    });

                                    google.maps.event.addListener(marker, 'click', function() {
                                      infowindow.setContent(place.name);
                                      infowindow.open(map, this);
                                    });
                                  }
                                     
                            });
                            }
                    if(str=="#div4_index"){

                        /* 영화게시판들 */
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
                                html+='<div style="background-image: url(img/moveimg/'+row.image+')">';
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
                            }
                        })

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
                            $("#poster_header #img").css("background-image","url(img/moveimg/"+list[index].image+")");
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
                    }    
                    if(str=="#div4_index1"){
                        /* 영화게시판들 */
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
                                html+='<div style="background-image: url(img/moveimg/'+row.image+')">';
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
                            }
                        })

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
                            $("#poster_header #img").css("background-image","url(img/moveimg/"+list[index].image+")");
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
                    }                                
                    if(str="#div4_board"){
                       var board = [
                         {num:5, title: "제목1", name: "권형근", date: "2018-05-02", count: "1"},
                         {num:4, title: "제목2", name: "김유경", date: "2018-05-03", count: "2"},
                         {num:3, title: "제목3", name: "조한서", date: "2018-05-04", count: "3"},
                         {num:2, title: "제목4", name: "조원희", date: "2018-05-05", count: "4"},
                         {num:1, title: "제목5", name: "권형근", date: "2018-05-06", count: "5"}
                       ];
                       board.forEach(function(row) {
                          var html = "";
                          html += '<tr style="border-bottom:1px solid #CCC;">';
                            html += '<td class="boardstyle mobiledisplaynone num">' + row.num + '</td>';
                            html += '<td class="board_btn" style="cursor:pointer;" class="boardstyle mobiletitle title" >' + row.title + '</td>';
                            html += '<td class="boardstyle name" >' + row.name + '</td>';
                            html += '<td class="boardstyle date" >' + row.date + '</td>';
                            html += '<td class="boardstyle mobiledisplaynone count" >' + row.count + '</td>';
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
                        
                    }
                    
                    if(str="#div4_qa"){
                       var board = [
                         {num:9, title: "퇴장", name: "권형근", date: "2018-05-24", count: "1"},
                         {num:8, title: "안뇽", name: "권형근", date: "2018-05-23", count: "1"},
                         {num:7, title: "이달의 영화중...", name: "권형근", date: "2018-05-22", count: "1"},
                         {num:6, title: "다른 영화 추천", name: "권형근", date: "2018-05-21", count: "1"},   
                         {num:5, title: "이번에 어벤저스...", name: "권형근", date: "2018-05-20", count: "1"},
                         {num:4, title: "게시판의 제목 잘 써지는지?", name: "김유경", date: "2018-05-18", count: "2"},
                         {num:3, title: "테스트 중~", name: "조한서", date: "2018-05-01", count: "3"},
                         {num:2, title: "앞으로의 업데이트", name: "조원희", date: "2018-04-21", count: "4"},
                         {num:1, title: "테스트2", name: "권형근", date: "2018-04-06", count: "5"}
                       ];
                       board.forEach(function(row) {
                          var html = "";
                          html += '<tr style="border-bottom:1px solid #CCC;">';
                            html += '<td class="boardstyle mobiledisplaynone num">' + row.num + '</td>';
                            html += '<td class="qna_btn" style="cursor:pointer;" class="boardstyle mobiletitle title" >' + row.title + '</td>';
                            html += '<td class="boardstyle name" >' + row.name + '</td>';
                            html += '<td class="boardstyle date" >' + row.date + '</td>';
                            html += '<td class="boardstyle mobiledisplaynone count" >' + row.count + '</td>';
                            html += '</tr>';
                            $("#data2Table").append(html); 
                       });
                            $(".qna_btn").click(function(event){
                            event.preventDefault();
                            move_index("#qna_view");
                        });
                        $("#qna_cancel").click(function(evnet){
                            event.preventDefault();
                            move_index("#div4_qa")
                        })
                        
                        
                    }
                            if(str="#div4_free"){
                       var board = [
                         {num:9, title: "여긴", name: "권형근", date: "2018-05-24", count: "1"},
                         {num:8, title: "자유", name: "권형근", date: "2018-05-23", count: "1"},
                         {num:7, title: "게시판", name: "권형근", date: "2018-05-22", count: "1"},
                         {num:6, title: "입니다", name: "권형근", date: "2018-05-21", count: "1"},   
                         {num:5, title: "환영", name: "권형근", date: "2018-05-20", count: "1"},
                         {num:4, title: "합니다", name: "김유경", date: "2018-05-18", count: "2"},
                         {num:3, title: "모두", name: "조한서", date: "2018-05-01", count: "3"},
                         {num:2, title: "앞으로", name: "조원희", date: "2018-04-21", count: "4"},
                         {num:1, title: "기대해주세요", name: "권형근", date: "2018-04-06", count: "5"}
                       ];
                       board.forEach(function(row) {
                          var html = "";
                          html += '<tr style="border-bottom:1px solid #CCC;">';
                            html += '<td class="boardstyle mobiledisplaynone num">' + row.num + '</td>';
                            html += '<td class="free_btn" style="cursor:pointer;" class="boardstyle mobiletitle title" >' + row.title + '</td>';
                            html += '<td class="boardstyle name" >' + row.name + '</td>';
                            html += '<td class="boardstyle date" >' + row.date + '</td>';
                            html += '<td class="boardstyle mobiledisplaynone count" >' + row.count + '</td>';
                            html += '</tr>';
                            $("#data3Table").append(html); 
                       });
                            $(".free_btn").click(function(event){
                            event.preventDefault();
                            move_index("#board_view2");
                        });
                            $("#free_cancel").click(function(event){
                            event.preventDefault();
                            move_index("#div4_free");
                        });
                        
                        
                    }
                    if(str="#div4"){
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
                            }
                        if(str=="#div4_regser") {
                            $("#backhome").on("click", function(){
                               move_index("#div4");
                                alert("abc");
                                return false;
                            });
                        }
                            
                            
                    
                    
                });
                
                console.log(str);
            }
            
            /* ------------------------- */            
            
            $("#navigation-menu").hide();
            $("#menu1").click(function() {
                $("#navigation-menu").slideToggle(300);
                return false;
            });
            
            // a 하이퍼 죽이고 위에것처럼 기능부여해야함 될려나? 됨ㅎ
            $("#menu_btn1").click(function(event){
               event.preventDefault();
                move_index("#div4_index");
            });
            $("#menu_btn2").click(function(event){
               event.preventDefault();
                move_index("#div4_index1");
            });
            $("#menu_btn3").click(function(event){
               event.preventDefault();
                move_index("#div4_board");
            });
            $("#menu_btn4").click(function(event){
               event.preventDefault();
                move_index("#div4_free");
            });
            $("#menu_btn5").click(function(event){
               event.preventDefault();
                move_index("#div4_map");
            });
            $("#menu_btn6").click(function(event){
               event.preventDefault();
                move_index("#div4_qa");
            });
            $("#menu_btn7").click(function(event){
               $("#navigation-login").slideToggle(500);
                $("#navigation-login form #id").focusin();                
                return false;
            });
            
            $("#navigation-login").hide();
            $("#login").mousedown(function(){
                $("#navigation-login").slideToggle(500);
                $("#navigation-login form #id").focusin();                
                return false;
            });
            
            $("#backbutton").on("click",function(){
                $("#navigation-login").slideToggle(500);
                $("#navigation-login form #id").focusin();       
            });
            
            $(".submit_reg").click(function(){
                move_index("#div4_regser");
            });      
            $("#reg").mousedown(function(){
                move_index("#div4_regser");
            });
            $("#div1 #home").mousedown(function(){
                move_index("#div4");
            });
            
            $("#btn_div0").on("click",function(){
                $("#div0").css("display","none");
                $("#div_main").slideDown(1500);
                $("#div_main").css("display","block");
            });
            $("#navigation-menu ul li a").click(function(event){
               event.preventDefault();
                $("#navigation-menu").hide();
                var o = $("#navigation-menu ul li a").index(this);
                switch(o){
                    case 0 : move_index("#div4_index"); break;
                    case 1 : move_index("#div4_index1"); break; 
                    case 2 : move_index("#div4_board"); break;
                    case 3 : move_index("#div4_free"); break;
                    case 4 : move_index("#div4_map"); break;
                    case 5 :move_index("#div4_qa"); 
                }
            });
            
            
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

        });

        
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
    <div id="div0">
        <img id="img_div0" src="img/big-logo.png">
        <button id="btn_div0">Visit Website</button>
    </div>
    <div id="div_main">
           <div id="div1">
               <div id="home">
                   <img src="img/small-logo.png">
               </div>
           </div>
           <div id="div1_1">
               <img src="img/side-logo.png">
           </div>

        <nav id="nav_div2">
           <div id="div2">
               <a id="atag2" href="#"><img id="menu1" src="img/menu%20icon.png"></a>           
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
    
               
                <div id="reg" class="atag" href="#"><img id="img1" src="img/register%20icon.png"></div>
                <div id="login" class="atag" href="#"><img id="img2" src="img/login_icon.png"></div>
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
                <p>ID: &nbsp;&nbsp;<input id="id" class="input_type" type="text" placeholder="아이디를 입력하세요." autofocus required><img src=""></p>
                <p>PW: <input id="pw" class="input_type" type="text" placeholder="비밀번호를 입력하세요." required></p>
                <div><img id="backbutton" src="img/back.png"></div><div><img id="smallloginbutton" src="img/login.png"></div>
            </form>
            </div>
        </nav>
        <div id="div4">
                <img class="mySlides" src="img/7.jpg" style="width: 100%; display: block;">
                <img class="mySlides" src="img/2.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="img/3.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="img/4.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="img/5.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="img/6.jpg" style="width: 100%; display: none;">
                <img class="mySlides" src="img/1.jpg" style="width: 100%; display: none;">
                <div id="div4_1">
                   <div id="trailertitle">Venom Trailer</div>
                    <iframe src="https://www.youtube.com/embed/hyetTJz-0AY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                </div>
        </div>
        <div id="div5">
            <img class="div5_img" src="img/twitter-logo.png">
            <img class="div5_img" src="img/facebook.png">
            <img class="div5_img" src="img/instagram.png">
            <img class="div5_img" src="img/play-store.png">
            <img class="div5_img" src="img/app-store.png">
            
            <div>Copyright 2018 by Team4. All rights reserved</div>
        </div>
    </div>
</body>
</html>


