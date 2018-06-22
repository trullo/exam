$(function(){
	var localhost = "http://localhost:8080/"; //경로들
	var index = "exam/move/index";
	var movie = "exam/move/movie";
	var movie2 = "exam/move/movie2";
	var board = "exam/board/selectList?boardMenu=1&page=0";
	var board2 = "exam/board/selectList?boardMenu=2&page=0";
	var board3 = "exam/board/selectList?boardMenu=3&page=0";
	var write = "exam/move/boardWrite"
	var reg = "exam/move/reg"
	var login = "http://localhost:8080/exam/user/selectOne";
    $("#navigation-menu").hide();
    
    $("#menu1").click(function() {
        $("#navigation-menu").slideToggle(300);
        return false;
    });
    
    // a 하이퍼 죽이고 위에것처럼 기능부여해야함 될려나? 됨ㅎ
    $("#menu_btn1").click(function(event){
       event.preventDefault();
        location.href=`${localhost}${movie}`;
    });
    $("#menu_btn2").click(function(event){
       event.preventDefault();
       location.href=`${localhost}${movie2}`;
    });
    $("#menu_btn3").click(function(event){
       event.preventDefault();
       location.href=`${localhost}${board}`;
    });
    $("#menu_btn4").click(function(event){
       event.preventDefault();
       location.href=`${localhost}${board2}`;
    });
    $("#menu_btn5").click(function(event){
       event.preventDefault();
        move_index("#div4_map");
    });
    $("#menu_btn6").click(function(event){
       event.preventDefault();
       location.href=`${localhost}${board3}`;
    });
    $("#menu_btn7").click(function(event){
       $("#navigation-login").slideToggle(500);
        $("#navigation-login form #nid").focusin();                
        return false;
    });
    
    $("#navigation-login").hide();
    $("#login").mousedown(function(){
        $("#navigation-login").slideToggle(500);
        $("#navigation-login form #nid").focusin();                
        return false;
    });
    
    //작은로그인창 --
    $("#backbutton").on("click",function(){
        $("#navigation-login").slideToggle(500);
        $("#navigation-login form #nid").focusin();   
    });
    
    $("#smallloginbutton").on("click",function(){
    	if($("#nid").val() == "" || $("#npw").val() == ""){
    		alert("아이디와 비밀번호를 입력해주세요");
    		return false;
    	}
    	$.ajax({method:"post",url:login,data:{id:$("#nid").val(),pw:$("#npw").val()}})
    	.done(function(data){
    		var d = JSON.parse(data);
    		console.log(d);
    		var html="";
    		if(d.status==1){
    			html+="<h1>로그인 성공</h1>";
    			html+="<h3>"+d.id+"님 환영합니다</h3>";
    			html+="<h3>좋은하루되세요</h3>";
        		$("#div4").html(html);    			
    		} 
    		else {
    			alert("                로그인실패\n아이디나 비밀번호를 확인해주세요")
    		}
    	});
    });
    //---------
    
    $(".submit_reg").click(function(){
        move_index("#div4_regser");
    });      
    $("#reg").mousedown(function(){
    	location.href=`${localhost}${reg}`;
    });
    $("#div1 #home").mousedown(function(){
    	location.href=`${localhost}${index}`;
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
            case 0 : location.href=`${localhost}${movie}`; break;
            case 1 : location.href=`${localhost}${movie2}`; break; 
            case 2 : location.href=`${localhost}${board}`; break;
            case 3 : location.href=`${localhost}${board2}`; break;
            case 4 : move_index("#div4_map"); break;
            case 5 :location.href=`${localhost}${board3}`; 
        }
    });
    
    
});
//get파라미터 가져오는 메소드
function urlParameter (name) {
	  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	  results = regex.exec(location.search);
	  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}