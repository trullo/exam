<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> Title </title>
	<link rel="stylesheet" type="text/css" href="css/team_project.css">
	<link rel="stylesheet" type="text/css" media="only screen and (min-width:769px) and (max-width: 1200px) " href="css/tablet.css">
    <link rel="stylesheet" type="text/css" media="only screen and (max-width: 768px)" href="css/mobile.css">
    <link rel="stylesheet" href="css/menubar.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>s
    <script>
        $(function(){
                    var move_index = (str) => {
                    	console.log(str)
                        $("#div4").load(`html/collection.html ${str}`,function(){
                        
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
         
                    }    
                    if(str=="#div4_index1"){
          
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
                <p>ID: &nbsp;&nbsp;<input id="nid" class="input_type" type="text" placeholder="아이디를 입력하세요." autofocus required><img src=""></p>
                <p>PW: <input id="npw" class="input_type" type="text" placeholder="비밀번호를 입력하세요." required></p>
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


