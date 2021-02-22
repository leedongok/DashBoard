package com.com.gentelella.controller;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ErrorConconfiguration implements ErrorController  {//스프링부트 2.3부터 쓰이는 ErrorController로 좀더 간편해짐
	
		@RequestMapping("/error")
		public String handleError(HttpServletRequest request) {
			Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
			Object error1 = 404;
			Object error2 = 500;
			Object error3 = 403;
			
			//에러넘버 별 페이지 커스텀페이지 처리
			if(status.equals(error1)) {
				return  "404error";
			}else if(status.equals(error2)) {
				return  "500error";
			}else if(status.equals(error3)) {
				return  "401error";
			}
			
			return "error";
		}

		@Override
		public String getErrorPath() {
			return null;
		}
}
	// 기존 에러 페이지 처리 방식이였던 것은 스프링부트 1.X까지만 지원했기때문에 
	// 스프링부트 2.0에서는 ConfigurableServletWebServerFactory를 써야하는데 오류만안날뿐 실제로 맵핑이 안되어있음.
	/* @Override
	  public void customize(ConfigurableEmbeddedServletContainer container) {
	    super.customize(container);
	    container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404error"));
	    container.addErrorPages(new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED, "/405error"));
	    container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500error"));
	    container.addErrorPages(new ErrorPage(Exception.class, "/error"));
	  }*/
