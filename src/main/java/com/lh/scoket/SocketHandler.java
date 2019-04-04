package com.lh.scoket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.lh.model.User;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import javax.servlet.http.HttpSession;

/**
 *@Title SocketHandler.java
 *@description:  Socket请求处理 SocketService
 *@time 创建时间：2019年01月25日 下午6:16:51
 **/
@Component("socketHandler")
public class SocketHandler implements WebSocketHandler{
    private final static Logger log=Logger.getLogger(SocketHandler.class);


    public final static Map<String,WebSocketSession> userMap;
    //在线用户
    static {
        userMap = new HashMap<String,WebSocketSession>();
    }



    /*
    * 建立连接后
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
       /* String userId=this.getUserId(webSocketSession);
        if(userMap.get(userId) ==null ){
            userMap.put(userId, webSocketSession);
            log.info("Websocket："+userId+"用户建立连接成功！");
        }else{
            log.info("Websocket："+userId+"用户已经连接！");
        }*/
       User user=(User)webSocketSession.getAttributes().get("user");

        if(userMap.get(user.getAccount()) ==null ){
            userMap.put(user.getAccount(), webSocketSession);

            log.info("Websocket："+user.getAccount()+"用户建立连接成功！");
        }else{
            log.info("Websocket："+user.getAccount()+"用户已经连接！");
        }


    }


    /**
     * 客户端发送服务器的消息时，的处理函数，在这里收到消息之后可以分发消息
     */
    @Override
    public void handleMessage(WebSocketSession session,
                              WebSocketMessage<?> message) throws Exception {
        // TODO Auto-generated method stub
        Iterator<Map.Entry<String, WebSocketSession>> entries = userMap.entrySet().iterator();
        String s=message.getPayload().toString();
        //User user= JSON.parseObject(s,User.class);
        System.out.println("---"+JSON.toJSONString(s));
        while (entries.hasNext()) {
            Map.Entry<String, WebSocketSession> entry = entries.next();
            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
            if(entry.getKey().equals(session.getAttributes().get("user"))){        //-----------------------------------未处理
                String msg = "后台已收到信息[" + message.getPayload().toString()+ "];用户ID为：" + entry.getKey();
                System.out.println(msg);
                message = new TextMessage(msg);
                entry.getValue().sendMessage(message);
            }
        }
    }

    /*
    * 发送异常时，调用此方法
     */
    @Override
    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {
        if (webSocketSession.isOpen()) {
            webSocketSession.close();
        }
        log.debug("链接出错，关闭链接......");
        userMap.remove(webSocketSession);
    }

    /*
    * 关闭连接后，调用次方法
     */
    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
        log.info("Websocket："+webSocketSession.getId()+"已经关闭！");
        String userAccount=this.getUserAccount(webSocketSession);
        if(userMap.get(userAccount) !=null ){
            userMap.remove(userAccount);
            log.info("Websocket："+userAccount+"用户已经移除！");
        }

    }

    /*
    * 是否支持信息拆分，返回true拆分信息
     */
    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    /*
    * 多线程群发信息
    * @param message 消息内容
     */
    public void broadcast(final String msg) throws IOException{
        final TextMessage message=new TextMessage(msg);
        Iterator<Entry<String,WebSocketSession>> it=userMap.entrySet().iterator();
        while(it.hasNext()){
            final Entry<String, WebSocketSession> entry = it.next();


            if (entry.getValue().isOpen()) {
                // entry.getValue().sendMessage(message);
                new Thread(new Runnable() {

                    public void run() {
                        try {
                            if (entry.getValue().isOpen()) {
                                entry.getValue().sendMessage(message);
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }

                }).start();
            }


        }

    }

    /*
    * 发送信息给特定的人
    *
     */
    public void sendMessageToUser(String user_account,String msg){
        TextMessage message=new TextMessage(msg);
        WebSocketSession session=userMap.get(user_account);
        if(session !=null && session.isOpen()) {
            try {
                session.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * @Title: getUserId
     * @Description: 获取用户id
     * @param @param session
     * @param @return
     * @return String
     * @date createTime：2018年4月26日上午9:44:59
     */
    public String getUserAccount(WebSocketSession session){
        try {

            return String.valueOf(((User)session.getAttributes().get("user")).getAccount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }





}
