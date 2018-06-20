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
                        
                            //ë¤ì´ì¤ë strì´ ëêµ¬ëì ë°ë¼ ì½ë°±í¨ìê° ì´ë»ê²
                            if(str=="#div4_map"){
                                 $.getScript("http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&key=AIzaSyAha88ou3uEZFgOFxBZhqoIJP5_6ihwzbw", function(){
                                var map;
                                var infowindow;
                                function getLocation(){ //ì¢í ìë ìì±
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

                        /* ìíê²ìíë¤ */
                        var a=0;
                        var parent = 0;

                        list = [{title:"ë°ëí 2",image:"deadpool2.jpg",realdate:"2018.05.16",director:"ë°ì´ë¹ ë ì´ì¹",genre:"ì½ë¯¸ë, SF, ì¡ì, ì´ëë²¤ì²",Showtime:"117",Contents:"ë§ì¹¨ë´, ê·¸ ë¶ì´ ì¤ì ë¤! ì´ë²ì í¼ìê° ìëë¤!ìì¹ë£ë¥¼ ìí ë¹ë° ì¤íì ì°¸ì¬í í, ê°ë ¥í íë§í©í° ë¥ë ¥ì ì§ë ìí¼íì´ë¡ ë°ëíë¡ ê±°ë­ë ì¨ì´ë ìì¨(ë¼ì´ì¸ ë ëì¦), ì´ëªì ì¬ìì¹êµ¬ ë°ë¤ì¬(ëª¨ë ë ë°ì¹´ë¦°)ì íë³µí ë¯¸ëë¥¼ ê¿ê¾¸ì§ë§ ë¤ì ëë½ì¼ë¡ ë¨ì´ì§ê³ , ë°ë°ë¥ê¹ì§ ë´ë ¤ê° ë°ëíì ë ëì ì¬ëì´ ëê¸°ë¡ ê²°ì¬íë¤. ì´ë ë , ë¯¸ëìì ìê° ì¬íì´ ê°ë¥í ì©ë³ ì¼ì´ë¸(ì¡°ì ë¸ë¡¤ë¦°)ì´ ì°¾ì ì¤ë©´ì ìë¡ì´ ì¬ê±´ì´ ë°ìíê³  ë°ëíì ìê°ì§ë ëª»í ê¸°ìì²ì¸ í¨ë°ë¦¬ë¥¼ ê²°ì±íê² ëëë°...",point:30,people:8,age:19},
                                {title:"ë¬¼ëë£¨ì¦",image:"MoulinRouge.gif",realdate:"2001.10.27",director:"ë°°ì¦ ë£¨ì´ë¨¼",genre:"ë°±ì¤íì´ì§ ë®¤ì§ì»¬, ì½ë¯¸ë ìí, ë¡ë§¨ì¤, ëë¼ë§",Showtime:"130",Contents:"ë§ì´ ì¤ë¥´ë ìê°, ìëí ì¬ëì´ ììëë¤!1899ë íë¦¬, ì§ììì ê°ì¥ íë ¤í ì¸ê³ âë¬¼ë ë£¨ì¦â ìµê³ ì ë®¤ì§ì»¬ ê°ì ì¤í´ì ì ë¶ ìì¹ê³¼ ì±ê³µì ìí´ í¬ììë¥¼ êµ¬íë¤ê° ì°ì°í ì¬ëì ì°¾ì ëª½ë§ë¥´í¸ë¥´ë¡ íë¬ì¨ ìêµ­ì ë­ë§í ìì¸ í¬ë¦¬ì¤í°ìì ë§ëê² ëë¤. ì¤í´ìê²ì ì´ëªì  ì¬ëì ëë í¬ë¦¬ì¤í°ìì ê·¸ëê° ìë âë¬¼ë ë£¨ì¦âë¼ë ì ë¹ì ì¸ê³ì ë°ì ë¤ì¬ëëë¤. íì§ë§ ê·¸ ë ì¬ì´ì ê±°ì­í  ì ìë ì¬í ì´ëªì´ ììí ë¤ê°ì¤ëë°...",point:100,people:20,age:15},
                                {title:"í¸ë£¨ì¤ì¤ë¸ë°ì´",image:"trueordare.jpg",realdate:"2018.04.13",director:"ì í ìë¤ë¡",genre:"ê³µí¬ ìí, ì¤ë¦´ë¬, ì´ìì°ì íì",Showtime:"103",Contents:"ì íí´. TRUTH OR DAREë¬´ìì ì ííë  ê³µí¬ë ììë  ê±°ì¼",point:30,people:10,age:15},
                                {title:"ë¼ë¼ëë",image:"lalaland.jpg",realdate:"2016.11.09",director:"ë°ì´ë¯¸ì¸ ìì ¤",genre:"ì½ë¯¸ë ìí, ë°±ì¤íì´ì§ ë®¤ì§ì»¬, ë¡ë§¨ì¤, ëë¼ë§",Showtime:"128",Contents:"ê¿ì ê¾¸ë ì¬ëë¤ì ìí ë³ë¤ì ëì âë¼ë¼ëëâ. ì¬ì¦ í¼ìëì¤í¸ âì¸ë°ì¤ì°¬â(ë¼ì´ì¸ ê³ ì¬ë§)ê³¼ ë°°ì° ì§ë§ì âë¯¸ìâ(ì ë§ ì¤í¤), ì¸ììì ê°ì¥ ë¹ëë ìê° ë§ë ë ì¬ëì ë¯¸ìì±ì¸ ìë¡ì ë¬´ëë¥¼ ë§ë¤ì´ê°ê¸° ììíë¤.",point:20,people:5,age:12},
                                {title:"ë£¨ë¹ì¤íì¤",image:"Ruby_Sparks.jpg",realdate:"2012.07.25",director:"ì¡°ëë¨ ë°ì´í¤",genre:"ì½ë¯¸ë ìí, ë¡ë§¨ì¤, ëë¼ë§, ííì§ ìí",Showtime:"104",Contents:"ê¿ ììì ë§ë ì´ìí ë£¨ë¹ë¥¼ ì£¼ì¸ê³µì¼ë¡ë¡ë§¨í±í ìì¤ì ì°ë©° ìì ì°ì  ì¤ì¸ ì²ì¬ìê° ìºë¹.ì´ë ë , ê·¸ìê² ëë¬´ ì¬ëì¤ë¬ì´ ê·¸ëë£¨ë¹ê° ìì¤ì ì°¢ê³  ë ìì ëíë¬ë¤!ë ìì ì¬ëí´ë ë ê¹?ìºë¹ì´ ììíê³  ì°ë ëë¡ ë³ì íë ë£¨ë¹.ì0ë²½í ê·¸ëì íì¤ ì°ì ë¥¼ ììí ìºë¹ìì§ì§ ì¬ëì ë¹ ì§ìë¡ ì ì  í¼ëì¤ë¬ìì§ëë°...ì°ë¦¬, ë§ë²ì¼ê¹? ì¬ëì¼ê¹?",point:100,people:25,age:15},
                                {title:"ëì ",image:"Believer.jpg",realdate:"2012.05.22",director:"ì´í´ì",genre:"ì¡ì, ë²ì£",Showtime:"123",Contents:"ììì ìµë ë§ì½ ì¡°ì§, ì¤ì²´ ìë ì ì ì¶ì íë¼!                ìë¬¸ì í­ë° ì¬ê³  í, ì¤ë«ëì ë§ì½ ì¡°ì§ì ì¶ì í´ì¨ íì¬ 'ìí¸'(ì¡°ì§ì)ì ìì ì¡°ì§ì íê²¬ì¸ 'ì¤ì°ì¥'(ê¹ì±ë ¹)ê³¼ ë²ë¦¼ë°ì ì¡°ì§ì 'ë½'(ë¥ì¤ì´)ì´ ëíëë¤. ê·¸ë¤ì ëìì¼ë¡ ììì ë§ì½ ìì¥ì ê±°ë¬¼ 'ì§íë¦¼'(ê¹ì£¼í)ê³¼ ì¡°ì§ì ì¨ê²¨ì§ ì¸ë¬¼ 'ë¸ë¼ì´ì¸'(ì°¨ì¹ì)ì ë§ëê² ëë©´ì ê·¸ ì¤ì²´ì ëí ê²°ì ì  ë¨ìë¥¼ ì¡ê² ëëë°Â·Â·Â· ëê¹ì§ ìì¬íë¼! 5ì 24ì¼, ëí ìë¤ì ì ìì´ ììëë¤!",point:10,people:2,age:15}];

                        /* ê²ìíë§ë¤ê¸° */
                        var creat_list = function(){
                            list.forEach(function(row){
                                var html="";
                                html+='<div class="moveview">';
                                html+='<div style="background-image: url(img/moveimg/'+row.image+')">';
                                html+='<div class="evaluation">';
                                html+='<div>';
                                html+='<span>â</span><span>â</span><span>â</span><span>â</span><span>â</span>';
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
                                html+='<div><button class="move_info">ìì¸ì ë³´</button></div>';
                                html+='</div>';
                                $("#div4 .div4_view").append(html);
                            });
                        }
                        creat_list();


                        /* ìíê²ìí - í´ë¦­ìëí ì¡ìë¤ */
                        $(".evaluation").on("mouseover",function(){
                            parent = $(this).parent().parent().index();
                            if(a==0){
                            $(".evaluation p").html("íì ì ìë ¥í´ì£¼ì¸ì");
                            a++;
                            }
                        })

                        $(".evaluation span").on({mouseover:function(){
                            var index = $(this).index();
                            for(var i=0;i<=index;i++){
                                $(".moveview").eq(parent).find("div").find(".evaluation").find("span").eq(i).html("â");
                            };
                            switch(index){
                                case 0 : $(".evaluation p").html("ìê°ì´ìê¹ìì"); break;
                                    case 1 : $(".evaluation p").html("ê¸°ëíì§ë§ìì"); break;
                                    case 2 : $(".evaluation p").html("ë³¼ë§íë¤ì"); break;
                                    case 3 : $(".evaluation p").html("ê¸°ëë§í¼ì´ë¤ì"); break;
                                    case 4 : $(".evaluation p").html("ë©ì§ìíìì´ì!!");
                            }
                        },click:function(){


                        },mouseout:function(){
                            for(var j=0;j<=$(".moveview").length-1;j++){
                                for(var i=0;i<=4;i++){
                                    $(".moveview").eq(j).find("div").find(".evaluation").find("span").eq(i).html("â");
                                };
                            }

                            $(".evaluation p").html("íì ì ìë ¥í´ì£¼ì¸ì");
                        }})

                        /* ìí ìì¸ì ë³´ ë²í¼ */
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
                            $("showtime").text(list[index].Showtime+"ë¶");
                            $("#poster_contents p").text(list[index].Contents);

                            for(var i=0;i<=(parseInt(list[index].point/list[index].people))-1;i++){
                                $("#star_point div div").find("span").eq(i).html("â");
                            };

                            $("#star_point people").text(list[index].people+"ëª");
                            $("#star_point point").text(list[index].point/list[index].people);
                            $("#poster_back").css("display","block");  

                        });            

                        /* ìí ìì¸ë³´ê¸° ë³ì£¼ê¸° */
                        $("#poster_back #poster_body #poster_header #header_in #star span").on({mouseover:function(){
                            var index = $(this).index();
                            for(var i=0;i<=index;i++){
                                $("#poster_back #poster_body #poster_header #header_in #star").find("span").eq(i).html("â");
                            };              
                            switch(index){
                                case 0 : $("#poster_back #poster_body #poster_header #header_in p").html("ìê°ì´ìê¹ìì"); break;
                                    case 1 : $("#poster_back #poster_body #poster_header #header_in p").html("ê¸°ëíì§ë§ìì"); break;
                                    case 2 : $("#poster_back #poster_body #poster_header #header_in p").html("ë³¼ë§íë¤ì"); break;
                                    case 3 : $("#poster_back #poster_body #poster_header #header_in p").html("ê¸°ëë§í¼ì´ë¤ì"); break;
                                    case 4 : $("#poster_back #poster_body #poster_header #header_in p").html("ë©ì§ìíìì´ì!!");
                                }
                            },click:function(){

                            },mouseout:function(){
                                for(var i=0;i<=4;i++){
                                    $("#poster_back #poster_body #poster_header #header_in #star").find("span").eq(i).html("â");
                                };   
                                $("#poster_back #poster_body #poster_header #header_in p").html("íì ì ìë ¥í´ì£¼ì¸ì");
                            }
                        })

                        $("#poster_back").on("click",function(){
                            for(var i=0;i<=4;i++){
                                $("#star_point div div").find("span").eq(i).html("â");
                            };                
                            $("#poster_back").css("display","none")
                        })                        
                    }    
                    if(str=="#div4_index1"){
                        /* ìíê²ìíë¤ */
                        var a=0;
                        var parent = 0;

                        list = [{title:"ë¼ì´í¬ í¬ë ì´ì§",image:"new_movie1.jpg",realdate:" 2018.05.30",director:"ëë ì´í¬ ëë¦¬ë¨¸ì¤",genre:"ëë¼ë§, ë©ë¡, ë¡ë§¨ì¤",Showtime:"117",Contents:"ì¬ëíê³ , ì´ë³íê³ , ë¤ì ëìì¤ë¤ ìêµ­ ì¬ì 'ì ë'ì ë¯¸êµ­ ë¨ì 'ì ì´ì½¥'ì LAìì ì²«ëì ë°íë¤. ìë¡ì ëí ì¬ëì ììê°ë©° íë³µí ìê°ì ë³´ë´ë ì¤, ì ëì íì ë¹ìê° ë§ë£ë¼ ìêµ­ì¼ë¡ ë¤ì ëìê°ì¼ íë ìí©ì´ ë°ìíë¤. ìëì¹ ìê² ì¥ê±°ë¦¬ ì°ì ë¥¼ ììí ëì ì ì  ìë¡ê° ìë ì¶ì ìµìí´ì§ê³  ìë¡ì´ ì¬ëì´ ëì ë¤ì´ì¨ë¤. ëª ê°ì ê°ì ê°ë± ëì ì ëë ì¤ëí ê²°ì¬ì íê³  ì ì´ì½¥ìê² ì íë¥¼ ê±´ë¤",point:30,people:8,age:12},
                                {title:"ë¯¸ëëì ì ",image:"new_movie2.jpg",realdate:"2018.06.16",director:"ì¤ì½§ ì¤í¼ì´",genre:"ëë¼ë§, ë©ë¡, ë¡ë§¨ì¤",Showtime:"92",Contents:"ì¬ëì ê¿ê¿¨ë ë®, ì¬ëì´ ì´ë¤ì§ ë°¤ ì´ëì´ ë°¤ìë ë¤ê° ëì íìì´ìì´XP(ììì±ê±´í¼ì¦)ë¼ë í¬ê·ë³ì¼ë¡ íìì í¼í´ì¼ë§ íë ì¼ì´í°. ì¤ì§ ë°¤ìë§ ì¸ì¶ì´ íë½ë ê·¸ëìê²ë ì´ë¨¸ëê° ë¨ê²¨ì¤ ê¸°íì ì°½ë¬¸ ëë¨¸ë¡ 10ëì§¸ ì§ì¬ëí´ì¨ âì°°ë¦¬âê° ì¸ìì ë¹ì´ë¤. ì´ë ë  ìì ê¸°ì°¨ì­ìì íë°¤ì ë²ì¤í¹ì íë âì¼ì´í°âì ìì âì°°ë¦¬âê° ëíëê³ , ë ì¬ëì ë§¤ì¼ ë°¤ë§ë¤ ëª¨ëê° ë¶ë¬ìíë ìë²½í ë°ì´í¸ë¥¼ ì´ì´ê°ë¤. ì²ìì¼ë¡ í¨ê» ì¬íì ë ë ë , ê¿ ê°ì ìê°ì ë³´ë´ë âì¼ì´í°âë ê·¸ë§ ì§ì¼ì¼ë§ íë ê·ì¹ì ì´ê¸°ê² ëê³  ê²°êµ­ í¼í  ì ìë ì íì í´ì¼ë§ íëë°â¦ ",point:30,people:6,age:12},
                                {title:"ë©ì´íìí",image:"new_movie3.jpg",realdate:"2018.06.18",director:"íí¼ ë² ì¼ë¦¬, ëë ë°ë°í ",genre:"ë¤íë©í°ë¦¬",Showtime:"109",Contents:"'ê±°ì¹¨ìê³  ìë²½íë¤!'ì´ ìë ê°ì¥ ë¨ê±°ì ë ë¼ëì ì¤ì¬ì ì  í¬í ê·¸ëí¼ì´ì ë´ìì ìì´ì½ ë¡ë²í¸ ë©ì´íìí ëêµ¬ë³´ë¤ í¹ë³íê³  íë ¤íë ë´ìììì ê¸°ë¡",point:88,people:22,age:19},
                                {title:"ì¤í ë°ì´, ì¬ë",image:"new_movie4.jpg",realdate:"2018.05.30",director:"ë²¤ ë¥´ì",genre:"ëë¼ë§, ì½ë¯¸ë",Showtime:"93",Contents:"ëëì´ âí¼í¸âë ì§ë¦¬ë(?) FMì§ì§ìë âì¬ëâ427íì´ì§ ìëë¦¬ì¤ë¥¼ ì¸ì°ë ë¥ë ¥ì ë§¤ì¼ë§¤ì¼ ìì¼ë³ë¡ ê¹ë§ì¶¤ íë í¨ìë¦¬ë ìë°ìë¤ ê¹ì§ ëë¼ê² ë§ë  ìíëìì¤ì½ ìµê³ ì ì¸ë ê·¼ë° âì¬ëâê° ëë³´ë¤ âì¤í í¸ë âì ë ì¢ìíë ê±° ê°ì ê³ ë¯¼ì´ì ì¤ âì¤í í¸ë â ìëë¦¬ì¤ ìê°ê° ê¿ì´ë¼ê³  ë¬´ìì  LAë¡ ë ëëì¤ ë©ë¬´ë£© 5ììë âì¬ëâ íê³  ì¶ì ê±° ë¤ í´!",point:120,people:40,age:12},
                                {title:"ì¸ë¼ë¹, ì´ê²ì´ ì¸ì!",image:"new_movie5.jpg",realdate:"2018.05.30",director:"ì¬ë¦¬ë¹ìë¥´ ëì¹´ì²´, ìë¦­ í ë ë¤ë¸",genre:"ì½ë¯¸ë",Showtime:"115",Contents:"17ì¸ê¸° ê³ ì±ììì ìë¯¸ ê¹ì ê²°í¼ìì ì¤ë¹íë ì¨ë© íëë ë§¥ì¤ í.ì§.ë§ ì¤ëë°ë¼ ì ë¬ë¦¬ ì¤ì ì°ë°ì ìë° ì í ì ë§ë ì§ìë¤ë¡ ì¸í´ ëë° ì¬ê³ ë ê³ìëê³  ìë¯¼íê³  ê¹ë¤ë¡ì´ í´ë¼ì´ì¸í¸ë ì¤ìê° âì§ì¼ë³´ê³  ìë¤â ëª¨ëì ìêµ¬ ì¬í­ì ì ì  ëì´ë§ ê°ë¤! ê³¼ì° ë§¥ì¤ë ìë§ì§ì°½ íìë¤ê³¼ í¨ê» ê²°í¼ìì ë¬´ì¬í ëë¼ ì ììê¹? ê°ì¥ ìë¦ëµê³  íë³µí ê²°í¼ìì ìì±ìí¤ê¸° ìí ë§¥ì¤ì ê³ êµ°ë¶í¬ê° ììëë¤!",point:90,people:3,age:12},
                                {title:"í",image:"new_movie6.jpg",realdate:"2018.05.30",director:"ê¹ì¢ì°",genre:"ëë¼ë§, ê°ì¡±",Showtime:"100",Contents:"ì´ë ë  ê°ìê¸° íëìì ë ë¨ì´ì§ ê°ì¡±!ì´ë¤ ì´ ìëì íë³µ ë§ë¤ê¸° íë¡ì í¸ê° ììëë¤!ëì ì±í¸, ì±í¸ì ì¹ìë¹  ìì¬, ê·¸ë¦¬ê³  ìì¬ì ë¸ ì§ìê¹ì§. ì´ë ë  ê°ìê¸° ìë¡ì´ ìêµ¬ê° ìê¸´ ì¤í¸ë ë§¤ì¼ë§¤ì¼ íë³µ ë¿ë¿ì´ë¤. ì¤í¸ë¥¼ ìë¤ì²ë¼ ì±ê¸°ë ìì¬ì ì¹íì ì²ë¼ ë°ë¥´ë ëìë¤ ëì´ë¤. âì°ë¦¬ ì´ë ê² ê³ì ê°ì´ ìì¼ë©´ ì¢ê² ë¤âë ì¤í¸ì ë§ì ë¹ì°íë¤ë ë¯ì´ âê°ì´ ìë¤ ìì´ê°âë¼ë©° ìë ëìë¤. ì´ì  ë§ ì ê°ì¡± ìì¼ë¡ ê³¨ì¸í ì¤í¸ì ììì ì´ë¤ì§ ì ììê¹?",point:80,people:20,age:12}];

                        /* ê²ìíë§ë¤ê¸° */
                        var creat_list = function(){
                            list.forEach(function(row){
                                var html="";
                                html+='<div class="moveview">';
                                html+='<div style="background-image: url(img/moveimg/'+row.image+')">';
                                html+='<div class="evaluation">';
                                html+='<div>';
                                html+='<span>â</span><span>â</span><span>â</span><span>â</span><span>â</span>';
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
                                html+='<div><button class="move_info">ìì¸ì ë³´</button></div>';
                                html+='</div>';
                                $("#div4 .div4_view").append(html);
                            });
                        }
                        creat_list();

                        /* ìíê²ìí - í´ë¦­ìëí ì¡ìë¤ */
                        $(".evaluation").on("mouseover",function(){
                            parent = $(this).parent().parent().index();
                            if(a==0){
                            $(".evaluation p").html("íì ì ìë ¥í´ì£¼ì¸ì");
                            a++;
                            }
                        })

                        $(".evaluation span").on({mouseover:function(){
                            var index = $(this).index();
                            for(var i=0;i<=index;i++){
                                $(".moveview").eq(parent).find("div").find(".evaluation").find("span").eq(i).html("â");
                            };
                            switch(index){
                                case 0 : $(".evaluation p").html("ìê°ì´ìê¹ìì"); break;
                                    case 1 : $(".evaluation p").html("ê¸°ëíì§ë§ìì"); break;
                                    case 2 : $(".evaluation p").html("ë³¼ë§íë¤ì"); break;
                                    case 3 : $(".evaluation p").html("ê¸°ëë§í¼ì´ë¤ì"); break;
                                    case 4 : $(".evaluation p").html("ë©ì§ìíìì´ì!!");
                            }
                        },click:function(){


                        },mouseout:function(){
                            for(var j=0;j<=$(".moveview").length-1;j++){
                                for(var i=0;i<=4;i++){
                                    $(".moveview").eq(j).find("div").find(".evaluation").find("span").eq(i).html("â");
                                };
                            }

                            $(".evaluation p").html("íì ì ìë ¥í´ì£¼ì¸ì");
                        }})

                        /* ìí ìì¸ì ë³´ ë²í¼ */
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
                            $("showtime").text(list[index].Showtime+"ë¶");
                            $("#poster_contents p").text(list[index].Contents);

                            for(var i=0;i<=(parseInt(list[index].point/list[index].people))-1;i++){
                                $("#star_point div div").find("span").eq(i).html("â");
                            };

                            $("#star_point people").text(list[index].people+"ëª");
                            $("#star_point point").text(list[index].point/list[index].people);
                            $("#poster_back").css("display","block");  

                        });       

                        /* ìí ìì¸ë³´ê¸° ë³ì£¼ê¸° */
                        $("#poster_back #poster_body #poster_header #header_in #star span").on({mouseover:function(){
                            var index = $(this).index();
                            for(var i=0;i<=index;i++){
                                $("#poster_back #poster_body #poster_header #header_in #star").find("span").eq(i).html("â");
                            };              
                            switch(index){
                                case 0 : $("#poster_back #poster_body #poster_header #header_in p").html("ìê°ì´ìê¹ìì"); break;
                                    case 1 : $("#poster_back #poster_body #poster_header #header_in p").html("ê¸°ëíì§ë§ìì"); break;
                                    case 2 : $("#poster_back #poster_body #poster_header #header_in p").html("ë³¼ë§íë¤ì"); break;
                                    case 3 : $("#poster_back #poster_body #poster_header #header_in p").html("ê¸°ëë§í¼ì´ë¤ì"); break;
                                    case 4 : $("#poster_back #poster_body #poster_header #header_in p").html("ë©ì§ìíìì´ì!!");
                                }
                            },click:function(){

                            },mouseout:function(){
                                for(var i=0;i<=4;i++){
                                    $("#poster_back #poster_body #poster_header #header_in #star").find("span").eq(i).html("â");
                                };   
                                $("#poster_back #poster_body #poster_header #header_in p").html("íì ì ìë ¥í´ì£¼ì¸ì");
                            }
                        })

                        $("#poster_back").on("click",function(){
                            for(var i=0;i<=4;i++){
                                $("#star_point div div").find("span").eq(i).html("â");
                            };                
                            $("#poster_back").css("display","none")
                        })                        
                    }                                
                    if(str="#div4_board"){
                       var board = [
                         {num:5, title: "ì ëª©1", name: "ê¶íê·¼", date: "2018-05-02", count: "1"},
                         {num:4, title: "ì ëª©2", name: "ê¹ì ê²½", date: "2018-05-03", count: "2"},
                         {num:3, title: "ì ëª©3", name: "ì¡°íì", date: "2018-05-04", count: "3"},
                         {num:2, title: "ì ëª©4", name: "ì¡°ìí¬", date: "2018-05-05", count: "4"},
                         {num:1, title: "ì ëª©5", name: "ê¶íê·¼", date: "2018-05-06", count: "5"}
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
                         {num:9, title: "í´ì¥", name: "ê¶íê·¼", date: "2018-05-24", count: "1"},
                         {num:8, title: "ìë½", name: "ê¶íê·¼", date: "2018-05-23", count: "1"},
                         {num:7, title: "ì´ë¬ì ìíì¤...", name: "ê¶íê·¼", date: "2018-05-22", count: "1"},
                         {num:6, title: "ë¤ë¥¸ ìí ì¶ì²", name: "ê¶íê·¼", date: "2018-05-21", count: "1"},   
                         {num:5, title: "ì´ë²ì ì´ë²¤ì ì¤...", name: "ê¶íê·¼", date: "2018-05-20", count: "1"},
                         {num:4, title: "ê²ìíì ì ëª© ì ì¨ì§ëì§?", name: "ê¹ì ê²½", date: "2018-05-18", count: "2"},
                         {num:3, title: "íì¤í¸ ì¤~", name: "ì¡°íì", date: "2018-05-01", count: "3"},
                         {num:2, title: "ìì¼ë¡ì ìë°ì´í¸", name: "ì¡°ìí¬", date: "2018-04-21", count: "4"},
                         {num:1, title: "íì¤í¸2", name: "ê¶íê·¼", date: "2018-04-06", count: "5"}
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
                         {num:9, title: "ì¬ê¸´", name: "ê¶íê·¼", date: "2018-05-24", count: "1"},
                         {num:8, title: "ìì ", name: "ê¶íê·¼", date: "2018-05-23", count: "1"},
                         {num:7, title: "ê²ìí", name: "ê¶íê·¼", date: "2018-05-22", count: "1"},
                         {num:6, title: "ìëë¤", name: "ê¶íê·¼", date: "2018-05-21", count: "1"},   
                         {num:5, title: "íì", name: "ê¶íê·¼", date: "2018-05-20", count: "1"},
                         {num:4, title: "í©ëë¤", name: "ê¹ì ê²½", date: "2018-05-18", count: "2"},
                         {num:3, title: "ëª¨ë", name: "ì¡°íì", date: "2018-05-01", count: "3"},
                         {num:2, title: "ìì¼ë¡", name: "ì¡°ìí¬", date: "2018-04-21", count: "4"},
                         {num:1, title: "ê¸°ëí´ì£¼ì¸ì", name: "ê¶íê·¼", date: "2018-04-06", count: "5"}
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
                                 /* ìë ì¬ë¼ì´ë ì¼*/
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

                                 /* ìëì¬ë¼ì´ë ì¼ */
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
            
            // a íì´í¼ ì£½ì´ê³  ììê²ì²ë¼ ê¸°ë¥ë¶ì¬í´ì¼í¨ ë ë ¤ë? ë¨ã
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
            
            
            /* ìë ì¬ë¼ì´ë ì¼*/
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
            
             /* ìëì¬ë¼ì´ë ì¼ */
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
                            <div><span>â</span><span>â</span><span>â</span><span>â</span><span>â</span></div>
                            <people>10ëª ì°¸ì¬</people>
                        </div>
                        <div>
                            <point>7.8</point>                        
                       </div>
                   </div>
                   <div id="date">
                        <span class="parent_text">ê°ë´ì¼ : </span><realdate class="item_text">2001.10.27</realdate>
                   </div>
                   <div >
                        <span class="parent_text">ê°ë : </span><director class="item_text">director</director>
                   </div>
                   <div c>
                       <span class="parent_text">ì¥ë¥´ : </span><genre class="item_text">ë°±ì¤íì´ì§ ë®¤ì§ì»¬, ì½ë¯¸ë ìí, ë¡ë§¨ì¤, ëë¼ë§</genre>
                   </div>
                   <div id="div_showtime">
                       <span class="parent_text">ìììê° : </span><showtime class="item_text">114ë¶</showtime>
                   </div>
                    <div id="star">
                        <span>â</span><span>â</span><span>â</span><span>â</span><span>â</span>
                    </div>
                    <div>
                        <p></p>
                    </div>
               </div>
            </div>
            <div id="poster_contents">
                <h1>ì¤ê±°ë¦¬</h1>
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
                   <li class='active has-sub'><span>ìí</span>
                      <ul>
                         <li id="menu_btn1" class='has-sub'><span>íì¬ììì</span>
                         </li>
                         <li id="menu_btn2" class='has-sub'><span>ê°ë´ìì ìí</span>
                         </li>
                      </ul>
                   </li>
                   <li class='active has-sub'><span>ê²ìí</span>
                      <ul>
                          <li id="menu_btn3" class='has-sub'><span>ìíìíµê²ìí</span>
                         </li>
                          <li id="menu_btn4" class='has-sub'><span>ìì ê²ìí</span>
                         </li>
                      </ul>
                   </li>
                   <li id="menu_btn5" class='active has-sub'><span>ë´ê·¼ì²ìíê´</span></li>
                   <li id="menu_btn6" class='active has-sub'><span>Q&A</span></li>
                   <li id="menu_btn7" class='active has-sub'><span>Login</span></li>
                </ul>
                </div>
    
               
                <div id="reg" class="atag" href="#"><img id="img1" src="img/register%20icon.png"></div>
                <div id="login" class="atag" href="#"><img id="img2" src="img/login_icon.png"></div>
            </div>
            <nav id="navigation-menu">
                <ul>
                        <li><a>íì¬ ììì</a></li><hr>
                        <li><a>ê°ë´ìì ìí</a></li><hr>
                        <li><a>ìíìíµ ê²ìí</a></li><hr>
                        <li><a>ìì  ê²ìí</a></li><hr>
                        <li><a>ë´ ê·¼ì² ìíê´</a></li><hr>
                        <li><a>Q & A</a></li>
                </ul>
            </nav>          
            <div id="navigation-login">
            <form>
                <p>ID: &nbsp;&nbsp;<input id="id" class="input_type" type="text" placeholder="ìì´ëë¥¼ ìë ¥íì¸ì." autofocus required><img src=""></p>
                <p>PW: <input id="pw" class="input_type" type="text" placeholder="ë¹ë°ë²í¸ë¥¼ ìë ¥íì¸ì." required></p>
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


