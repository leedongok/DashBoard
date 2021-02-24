<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 사용자 구분 CSS -->
<style>
.chating .me{
	color: #F6F6F6;
	text-align: right;
}
.chating .others{
	color: #FFE400;
	text-align: left;
}
</style>

<div class="profile clearfix">
    <div class="profile_pic">
        <img src="/static/images/user.png" alt="..." class="img-circle profile_img">
    </div>
    <div class="profile_info">
        <span>환영합니다. </span>
        <h2><sec:authentication property="principal.username" /></h2>
    </div>
</div>
<br />
	<!-- sidebar 메뉴 창 -->
	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	    <div class="menu_section">
	        <h3>업무관리 목록</h3>
	        <ul class="nav side-menu">
	        	<li><a href="dashboard" ><i class="fa fa-desktop"></i> 통합정보 <span class="label label-success pull-right">청산파트</span></a></li>
	            <li><a href="hyopage"><i class="fa  fa-bar-chart-o"></i> 차트정보 <span class="label label-success pull-right">결제파트</span></a></li>
	            <li><a href="calendar"><i class="fa fa-calendar"></i>일정정보</a></li>
	            <li><a href="secondery"><i class="fa fa-tachometer"></i>모니터링</a></li>
	        </ul>
	    </div>
	</div>


	<!-- 사이드 바 메인 타이머 -->
	<body onload="printClock()">
		<div style="overflow:hidden; width:100%; height:150px; line-height:60px; color:#f37031;font-size:30px; text-align:center;" id="clock">
		</div>
	</body>
	<!-- /menu footer buttons -->
	<div class="sidebar-footer hidden-small">
	    <a data-toggle="tooltip" data-placement="top" title="mypage" href="mypage" style="color:#fff; background:#0a0a0a;">
	        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="FullScreen" style="color:#fff; background:#0a0a0a;">
	        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true" onclick="toggleFullScreen();" ></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="chatting" id="compose" style="color:#fff; background:#0a0a0a;">
	        <span class="glyphicon glyphicon-send" id="onOff"   aria-hidden="true"></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="Logout" href="logout"  style="color:#fff; background:#0a0a0a;" >
	        <span class="glyphicon glyphicon-off" aria-hidden="true" ></span>
	    </a>
	</div>
	
	
	 <!-- compose -->
	<div class="compose col-md-4  " id="compose_window">
		<div class="compose-header">
			문의하기
			<button type="button" class="close compose-close">
				<span>×</span>
			</button>
		</div>
	
		<div class="compose-body">
			<div id="alerts"></div>
			<div id="contaner" class="container">
			<input type="hidden" id="sessionId" value=""><!-- 세션 아이디 임시저장공간 -->
				<div id="chating" class="jumbotron" style="overflow:auto; font-size:1em; width:auto; height:200px; padding:20px; color:#000;"></div>
				<div id="yourName">
					<table class="inputTable">
						<tr>
							<th><input type="text" name="userName" style="color:#000" id="userName" placeholder="유저명 입력하시오."></th>
							<th><button onclick="chatName()" id="startBtn" class="btn btn-sm btn-dark">등록</button></th>
						</tr>
					</table>
				</div>
				<div id="yourMsg">
					<table class="inputTable">
						<tr>
							<th><input id="chatting" style="color:#000" placeholder="보내실 메세지를 입력하시오."></th>
							<th><button id="send" class="btn btn-sm btn-success" onclick="send()" type="button">Send</button></th>
						</tr>
					</table>
				</div>
				
			</div>
		</div>
	</div>
    
    
 <!-- jQuery -->
<script src="/static/vendors/jquery/dist/jquery.min.js"></script>   


	<!-- 웹소켓 통신 프로세스 -->
	<script type="text/javascript">
	var ws;
	
	//웹소켓 오픈
	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();//이벤트 펑션 호출
	}
	
	//웹소켓 이벤트
	function wsEvt(){
		//소켓이 열리면 동작
		ws.onopen = function(data){
			
		}
		
		//메세지 띄우는 코드
		ws.onmessage = function(data){
			var msg = data.data;
			if(msg != null && msg.trim() != ''){ //메세지 중 널과 공백에 대한 예외처리
				var d = JSON.parse(msg);//메세지 제이슨변환
				if(d.type == "getId"){ //JSON 파싱된 메세지 값 중 getId라는 일치하는 값을 캐치한다.
					var si = d.sessionId != null ? d.sessionId : ""; //JSon값 중 세션아이디의 널과 공백 값이 아닌 값을 si에 담는다.
					if(si != ''){  //si가 공백이 아닐경우
						$("#sessionId").val(si);//제이슨 파싱된 결과값 넣어버리기	
					}
				}else if(d.type == "message"){
						if(d.sessionId == $("#sessionId").val()){
							$("#chating").append("<p class='me'>나 :"+ d.msg+ "</p>");
							$("#chating").scrollTop($("#chating")[0].scrollHeight);//중요 - 스크롤바 하단내리기 상대가 입력했을경우 하단으로 안내려가는 문제가발생함 찾느라애먹음;;  제이쿼리 방식을 썼음
						}else{
							$("#chating").append("<p class='others'>"+ d.userName + " :" + d.msg + "</p>");
							$("#chating").scrollTop($("#chating")[0].scrollHeight);//중요 - 스크롤바 하단내리기 상대가 입력했을경우 하단으로 안내려가는 문제가발생함 찾느라애먹음;;  제이쿼리 방식을 썼음
						}
				}else{
					console.warn("unknown type!");
				}
			}
		}
		//엔터키 인식 코드
		document.addEventListener("keypress",function(e){
			if(e.keyCode == 13){ 
				send();
			}
		});
		
	}
	//ws.onclose; x버튼 누르면 웹소켓도 닫아버리는 기능 구현하기
	
	//사용자명 지정
	function chatName(){
		var userName = $("#userName").val();
		//사용자명 널이나 공백에 대한 예외처리
		if(userName == null || userName.trim() == ""){
			alert("사용자명 입력하시오.");
			$("#userName").focus();
		}else{
			wsOpen();//사용자명 입력되면 웹소켓 오픈 명령
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}
	
	//내용전달
	function send(){
		var option = {
				type : "message", //구분자
				sessionId : $("#sessionId").val(), //세션별 아이디
				userName : $("#userName").val(), //유저명
				msg : $("#chatting").val() //메세지 쓴거 
		}
		ws.send(JSON.stringify(option));//채팅정보 전송
		$('#chatting').val("");//채팅입력값 날리기
	}
	</script>

	<!-- 대시보드 풀스크린 적용 -->
	<script type="text/javascript">
		function toggleFullScreen() {
		  var doc = window.document;
		  var docEl = doc.documentElement;
		
		  var requestFullScreen = docEl.requestFullscreen || docEl.mozRequestFullScreen || docEl.webkitRequestFullScreen || docEl.msRequestFullscreen;
		  var cancelFullScreen = doc.exitFullscreen || doc.mozCancelFullScreen || doc.webkitExitFullscreen || doc.msExitFullscreen;
		
		  if(!doc.fullscreenElement && !doc.mozFullScreenElement && !doc.webkitFullscreenElement && !doc.msFullscreenElement) {
		    requestFullScreen.call(docEl);
		  }
		  else {
		    cancelFullScreen.call(doc);
		  }
		}
	</script>
	
	<!-- 시계 30초기점으로 컬러 변경 액션 기능 -->
	<script type="text/javascript">
		function printClock() {
		    var clock = document.getElementById("clock");            // 출력할 장소 선택
		    var currentDate = new Date();                                     // 현재시간
		    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
		    var amPm = 'AM'; // 초기값 AM
		    var currentHours = addZeros(currentDate.getHours(),2); 
		    var currentMinute = addZeros(currentDate.getMinutes() ,2);
		    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
		    
		    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
		    	amPm = 'PM';
		    	currentHours = addZeros(currentHours - 12,2);
		    }
		
		    if(currentSeconds >= 30){// 50초 이상일 때 색을 변환해 준다.
		       currentSeconds = '<span style="color:#8fbc8f;">'+currentSeconds+'</span>'
		       currentMinute = '<span style="color:#8fbc8f;">'+currentMinute+'</span>'
		       currentHours = '<span style="color:#8fbc8f;">'+currentHours+'</span>'
		    }
		    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:20px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
		    
		    setTimeout("printClock()",1000); // 1초마다 printClock() 함수 호출
		}
		
		function addZeros(num, digit) { // 자릿수 맞춰주기
			  var zero = '';
			  num = num.toString();
			  if (num.length < digit) {
			    for (i = 0; i < digit - num.length; i++) {
			      zero += '0';
			    }
			  }
			  return zero + num;
		}
	</script>
