package com.com.gentelella.socket;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



@Component
public class SocketHandler extends TextWebSocketHandler{
	
	private final Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	//웹소켓 세션을 담아둘 맵
	HashMap<String,WebSocketSession> sessionMap = new HashMap<>();

	//메세지 발송 - 메시지를 수신하면 실행되는 것
	//웹소켓 서버단으로 메세지가 도착했을 때 처리할 프로세스
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg); 
		logger.info("채팅내역 >>"+msg);
		for(String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
			try {
				wss.sendMessage(new TextMessage(obj.toJSONString()));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	 //웹소켓 연결되고나서 진행될 프로세스
	//체크 안하도록 미리 선언
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓연결
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session);
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));//생성된 ID값  클라이언트로 전달하는 기능
	 
	 }
	 
	//웹소켓 연결 종료 후 처리할때 쓰이는 영역
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		 //소켓 종료 후 처리
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status);
	}
	
	
	//json-simple 사용한 제이슨 파싱 후 오브젝트 담아 전송(성능 Up)
	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null; 
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return obj;
	}
	
}
