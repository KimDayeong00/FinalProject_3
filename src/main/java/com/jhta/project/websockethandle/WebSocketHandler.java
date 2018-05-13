package com.jhta.project.websockethandle;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler{
   @Autowired SqlSession session;
   private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      System.out.println("家南 谗辫 : " + session.getId());
   }
   
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      sessionList.add(session);
      System.out.println("家南 楷搬 : " + session.getId());
   }
   
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      System.out.println(message.getPayload());
      for(WebSocketSession wss : sessionList) {
         wss.sendMessage(new TextMessage(message.getPayload()));
      }
   }
}
