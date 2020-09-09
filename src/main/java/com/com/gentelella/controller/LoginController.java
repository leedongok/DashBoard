package com.com.gentelella.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.com.gentelella.service.KakaoProfile;
import com.com.gentelella.service.SecurityService;
import com.com.gentelella.service.UserService;
import com.com.gentelella.service.UserServiceImpl;
import com.com.gentelella.util.OAuthToken;
import com.com.gentelella.vo.User;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller

public class LoginController {
	  
	 // 카카오톡 OAuth2 정보
	  private final static String K_CLIENT_ID = "나의 앱 키 입력";
      private final static String K_REDIRECT_URI = "리다이렉트 주소입력";
	
	  @Autowired
	  UserService userService;
	  
	  @Autowired
	  UserServiceImpl userServiceImpl;
	  
	  @Autowired
	  private SecurityService securityService;
	  
	
	  
	   KakaoProfile kakaoProfile;
	  
	  // 로그인 
	  @RequestMapping("/login")
	  public String login(Model model, String error, String logout, HttpServletRequest request ){
		  
	    if (logout != null){
	      model.addAttribute("logout", "성공적으로 로그 아웃되었습니다.");
	    }
	    return "login";
	  }
	  
	  // 로그인 실패시
	  @RequestMapping(value="/loginError")
	  public String loginError(Model model, String username ){
	    model.addAttribute("error", "사용자 이름과 비밀번호가 잘못되었습니다.");
	    model.addAttribute("username",username);
	    return "login";
	  }
	  
	  // 회원가입 처리 후 로그인 
	  @RequestMapping(value="/registration",method=RequestMethod.POST)
	  public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, 
	          Model model ,String[] roles ){
	    String password = userForm.getPassword();
	    userService.saveUser(userForm,roles);//회원가입 로직
	    securityService.autologin(userForm.getUsername(),password);//회원가입 후 바로 로그인처리할수있도록
	    return "redirect:dashboard";
	  }
	  
	  // 권한없는 페이지를 들어갔을때 
	  @RequestMapping("/403")
	  public String access(){
	    return "403error";
	  }
	  
	  //카카오톡 OAuth2 로그인 영역
		 
	  @RequestMapping("/auth/kakao/callback")
	    public  @ResponseBody String kakaoCallBack(String code) {
		  
		 //순서 ->인증코드 -> 엑세스 토큰 인증 -> 카카오 로그인 유저정보 리스폰 -> 정보기반 내부시스템 로그인처리 
		 // 1. 카카오로그인 후 인증코드 리스폰 받음 하지만 로그인이 완료되지 않음
		 // 2. 사용자토큰을 받아야 카카오 로그인을 완료하게됨.
		 //인증코드(GET방식) 토큰발급(POST)
		 //토큰 발급 필수 전달 4가지 항목
		 //POST방식으로 key=value 데이터를 요청(카카오쪽으로)

		  //Spring 3부터 지원 되었고 REST API 호출이후 응답을 받을 때까지 기다리는 동기방식이다
		  RestTemplate rt = new RestTemplate();
		  //HttpHeaders오브젝트생성
		  HttpHeaders headers = new HttpHeaders();
		  headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		  //HttpBody 오브젝트 생성
		  MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
		  
		  params.add("grant_type","authorization_code");
		  params.add("client_id","e0fe198a94267329d51b8335fe81e6ea");//카카오로그인 API 클라이언트 코드
		  params.add("redirect_uri","http://localhost:9110/auth/kakao/callback");
		  params.add("code",code);
		  
		  //헤더값을 가진 엔티티가 됨.
		  //HttpEntity란 클래스를 제공하는데 이 클래스의 역할은 Http 프로토콜을 이용하는 통신의 header와 body 관련 정보를 저장할수 있게해줌
		  //HttpHeader와 HttpBody를 하나의 오브젝트로 담기
		  HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest = new HttpEntity<>(params,headers);  
		  
		  //ResponseEntity는 HttpEntity를 상속받음으로써 HttpHeader와 body를 가질 수 있다. 
		  //Http요청하기 -> Post방식으로 -> response변수의 응답받음.
		  ResponseEntity<String> response = rt.exchange(
													  "https://kauth.kakao.com/oauth/token",
													  HttpMethod.POST,
													  kakaoTokenRequest,
													  String.class);
		  
		  //2. 엑세스토큰값 
		  //System.out.println(response.getBody());
		  
		  
		  //gson, json simple, ObjectMapper
		  //엑세스 토큰값처리
		  ObjectMapper obm = new ObjectMapper();
		  OAuthToken oauthToken = null;
		  try {
			  oauthToken = obm.readValue(response.getBody(), OAuthToken.class);
			} catch (JsonParseException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		  
		  RestTemplate rt2 = new RestTemplate();
		  //HttpHeaders오브젝트생성
		  HttpHeaders headers2 = new HttpHeaders();
		  headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
		  headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		   
		  //헤더값을 가진 엔티티가 됨.
		  //HttpHeader와 HttpBody를 하나의 오브젝트로 담기
		  HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest = new HttpEntity<>(headers2);  
		  //Http요청하기 -> Post방식으로 -> response변수의 응답받음.
		  ResponseEntity<String> response2 = rt2.exchange(
													  "https://kapi.kakao.com/v2/user/me",
													  HttpMethod.POST,
													  kakaoProfileRequest,
													  String.class);
		  
		  //카카오에서 받아온 정보
		  //System.out.println(response2.getBody());

			ObjectMapper objectMapper2 = new ObjectMapper();
			KakaoProfile kakaoProfile = null;
			try {
					kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
				} catch (IOException e) {
					e.printStackTrace();
				}
		  
			  //유저정보 가공
			  //System.out.println("kakao ID" + kakaoProfile.getId());
			  //System.out.println("kakao email"+kakaoProfile.getKakao_account().getProfile());
			  //아이디중복방지 닉네임+ID번호 삽입
			  //System.out.println("통합정보시스템 유저ID"+kakaoProfile.getKakao_account().getProfile().nickname+"_"+kakaoProfile.getId());
			  //이미카카오에서 인증절차를밟았기떄문에 내부 패스워드는 필요없는값을사용
				UUID garbagePassWord = UUID.randomUUID();
			  //System.out.println("통합정보시스템 패스워드"+garbagePassWord);
			  //실제 서비스를해야 이메일정보를 카카오톡으로부터받을 수 있음.(프로필값으로 대체하였음)
			  //System.out.println("통합정보시스템 이메일"+kakaoProfile.getKakao_account().getProfile());
			  
			  User kakaoUser = User.builder()
					  .username(kakaoProfile.getKakao_account().getProfile().nickname+"_"+kakaoProfile.getId())
					  .password(garbagePassWord.toString())
					  .build();
					  
			  //가입자 혹은 비가입자 검증후 처리해야됨.
			 User originUser =  userServiceImpl.oauthUserScan(kakaoUser.getUsername());
			 
			 //가입자정보체크
			 if(originUser.getUsername() == null) {
				//DB에 카카오인증정보 저장
				  userServiceImpl.oauthUser(kakaoUser);
				 
			 }
			 
			 //로그인처리 구성해야됨(마지막단계)
			  
			  
		  return "redirect:/dashboard";
    }
}
