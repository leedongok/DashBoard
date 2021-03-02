package com.com.gentelella.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.com.gentelella.vo.WebSocketGroundVO;

@Controller
public class WebSocketController {

	List<WebSocketGroundVO> roomList = new ArrayList<WebSocketGroundVO>();
	static int roomNumber = 0;
	
	//챗 으로 넘기기
//	@RequestMapping("/chat")
//	public ModelAndView chat() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("chat");
//		return mv;
//	}
	
	//room 경로로 이동
	@RequestMapping("/socketRoom")
	public ModelAndView socketRoom() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("socketRoom");
	    return mv;
	}
	
	//생성하기
	@RequestMapping("/createSocketRoom")
	public @ResponseBody List<WebSocketGroundVO> createSocketRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			WebSocketGroundVO wsgvo = new WebSocketGroundVO();
			wsgvo.setGroundNumber(++roomNumber);
			wsgvo.setGroundName(roomName);
			roomList.add(wsgvo);
		}
		return roomList;
		
	}
	
	//정보가져오기
	@RequestMapping("/getSocketRoom")
	public @ResponseBody List<WebSocketGroundVO> getSocketRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}

	
	@RequestMapping("/moveChat")
	public ModelAndView moveChat(@RequestParam HashMap<Object, Object> param) {
		ModelAndView mv = new ModelAndView();
		int socketRoomNumber = Integer.parseInt((String) param.get("socketRoomNumber"));
		
		List<WebSocketGroundVO> new_list = roomList.stream().filter(o->o.getGroundNumber()==socketRoomNumber).collect(Collectors.toList());
		
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("groundName", param.get("groundName"));
			mv.addObject("groundNumber", param.get("groundNumber"));
			mv.setViewName("chat");
		}else {
			mv.setViewName("socketRoom");
		}
		return mv;
		
		
	}
	
	
	
}
