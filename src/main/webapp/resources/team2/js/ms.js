$(function(){
	var localhost = "http://localhost:8080/"; //경로들
	var index = "exam/move/index";
	var movie = "exam/move/movie";
	var movie2 = "exam/move/movie2";
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
    		if(d.status==1){
    			alert("로그인성공");
    		} 
    		else {
    			alert("로그인실패");
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
            case 2 : move_index("#div4_board"); break;
            case 3 : move_index("#div4_free"); break;
            case 4 : move_index("#div4_map"); break;
            case 5 :move_index("#div4_qa"); 
        }
    });
});