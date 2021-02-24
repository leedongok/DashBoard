<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>통계정보사이트 </title>
    <!-- favicon -->
 	<link rel="shortcut icon" type="image/x-icon" href="/static/images/favicon.ico">
    <!-- Bootstrap -->
    <link href="/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/static/vendors/animate.css/animate.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/static/css/custom.min.css" rel="stylesheet">
   
    <!-- 비밀번호 이메일 찾기 -->
	<script type="text/javascript">	
		function passEmail(){
			var	passId = $('#passId').val(),
			passMail = $('#passMail').val();
			
			if(passId ==""){
				alert("아이디를 입력하시오.");
				passId.focus();
				return false;
			}else if(passMail ==""){
				alert("이메일 주소를 입력하시오.");
				passMail.focus();
				return false;
			}
			$.ajax({
					url : '/sendPw',
					data : {
						"userId" : passId,
						"email" : passMail
					},
					type : 'POST',
					success : function(data) {
						alert(data);
						alert("이메일 전송 완료");
						$('#PassModal').modal('hide')
					}
				});
		}
	</script>
	<!-- 모달 인풋 데이터 초기화 -->
	<script type="text/javascript">
		function modalClose(){
			$('#passId').val('');
			$('#passMail').val('');
		}
	</script>
	  
  </head>
  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form accept-charset="UTF-8" role="form" method="post" action="${contextPath}/login">
              <h1>환영합니다.</h1>
              		<div class="form-group">
						 <input name="username" id="username" value=''
							 placeholder="id" type="text" class="form-control" />
					</div>
					<div class="form-group">
						 <input name="password" id="password" value='' placeholder="Password" type="password"
							class="form-control" />
					</div>
					<!-- spring security는 form 전송시 csrf 공격 방어를 하기위해  토큰값을 보내야 하도록 규정되어있어 히든값으로 넣어준다-->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button type="submit" class="btn btn-sm btn-dark">로그인</button>		 
					
					 <!-- 카카오로그인 -->
                <div id="social_id_login" style="text-align: center"> 
               		<a href="https://kauth.kakao.com/oauth/authorize?client_id=e0fe198a94267329d51b8335fe81e6ea&redirect_uri=http://localhost:9110/auth/kakao/callback&response_type=code"> 
               		<img height="38" src="/static/images/kakao_login_small.png" />
               		</a> 
               		<a href="${github_url}"> 
               		<img width="38" src="/static/images/github-.png" />
               		</a> 
               		 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
					<!--   <div id="naver_id_login"></div> -->
           		</div>
					
					 <!--  <script type="text/javascript">
					  	var naver_id_login = new naver_id_login("YOUR_CLIENT_ID", "YOUR_CALLBACK_URL");
					  	var state = naver_id_login.getUniqState();
					  	naver_id_login.setButton("white", 2,40);
					  	naver_id_login.setDomain("YOUR_SERVICE_URL");
					  	naver_id_login.setState(state);
					  	naver_id_login.setPopup();
					  	naver_id_login.init_naver_id_login();
					  </script> -->
					
              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">처음 방문이신가요?
                  <a href="#signup" class="to_register"> 회원가입 </a>
                </p>
				
                <div class="clearfix"></div>
                <br />
                <c:if test="${error!=null}"> 
						    ${error} 
						</c:if>  
				<button type="button" class="btn btn-sm btn-dark"
							data-toggle="modal" data-target="#PassModal">비밀번호 찾기</button>		 
                        		
                
                <div>
                  <h1><i class="fa fa-desktop"></i> LDK Developer Site</h1>
                  <p>©2019 All Rights Reserved.</p>
                </div>
              </div>
              
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
          <form name="userForm" accept-charset="UTF-8" role="role" method="post" action="${contextPath}/registration">
              <h2>계정을 생성하세요.</h2>
              <br/>
               <div class="item form-group">
                	<input id="username1" class="form-control"
                	name="username" placeholder="아이디" required="required" type="text">
               </div>
              
                <div class="item form-group">
                 	<input id="password1" type="password" name="password" placeholder="비밀번호" 
                 	 data-validate-length="6,14" class="form-control" required="required">
           	 	</div>
               <div class="item form-group">
                <input id="nickname" class="form-control"
                	name="nickname" placeholder="가입자  닉네임" required="required" type="text">
               </div>
               
               
               <div class="item form-group">
                      <input type="email" id="email" name="email" placeholder="이메일 주소" required="required" class="form-control">
               </div>
               
               <div class="item form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">성별</label>
                  <div class="col-md-9 col-sm-9 col-xs-12">
                    <div id="sex" class="btn-group" data-toggle="buttons">
                      <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                        <input type="radio" name="sex" value="M"> &nbsp; 남자 &nbsp;
                      </label>
                      <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                        <input type="radio" name="sex" value="F"> &nbsp; 여자 &nbsp;
                      </label>
                    </div>
                  </div>
                </div>
                <div class="clearfix"></div>
                <br />
			  <div class="form-group">
                 <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                 <!-- spring security는 form 전송시 csrf 공격 방어를 하기위해  토큰값을 보내야 하도록 규정되어있어 히든값으로 넣어준다-->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                 	<button type="submit" class="btn btn-dark" >가입</button>
                 	<button type="reset" class="btn btn-dark" onclick = "location.href = '#signin' " >취소</button>
                 </div>
              </div>
              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">환영합니다.
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                
                  <h1><i class="fa fa-desktop"></i> LDK Developer Site</h1>
                  <p>© 2018 All Rights Reserved.</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
     			<!-- 비밀번호 분실정보 모달  SMTP 로직 구현했지만 정보유출관련  propertie 정보 변경-->
				<div class="modal fade" id="PassModal" tabindex="-1" role="dialog"
					aria-labelledby="ModalLabel" >
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="ModalLabel">비밀번호 분실 찾기</h4>
							</div>
							<div class="modal-body">
								<div class="modal-body">
									<label for="userid_acc">아이디 </label>
									<input name="userid_acc" value=''
										id="passId" placeholder="ID" type="text" class="form-control" />
								</div>
								<div class="modal-body">
									<label for="email_acc">이메일</label> <input name="email_acc"
										id="passMail" value='' placeholder="E-Mail" type="text"
										class="form-control" />
								</div>
								</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-dark" OnClick="passEmail()">메일 보내기</button>
								<button type="button" class="btn btn-dark" data-dismiss="modal" OnClick="modalClose()">닫기</button>
							</div>
						</div>
					</div>
				</div>
				
	<!-- 네이버 인증로그인 -->		
 	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <!-- jQuery -->
    <script src="/static/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/static/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/static/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/static/vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
    <script src="/static/vendors/validator/validator.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="/static/js/custom.min.js"></script>
  </body>

<!-- IE접근 제어 -->
<script type="text/javascript">
	var agent = navigator.userAgent.toLowerCase();

	if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
		alert("이 시스템은 인터넷 익스플로러를 지원하지 않습니다.");
		
		$('#accessCancel').hide();
		$('#accessCancel1').hide();
	} 
</script>



