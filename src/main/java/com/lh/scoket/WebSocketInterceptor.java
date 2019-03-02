package com.lh.scoket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.lh.model.User;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;



/**
 *@Title WebSocketInterceptor.java
 *@description:  WebSocket 适配器 拦截器
 *@time 创建时间：2019年01月26日 上午9:16:09
 **/
public class WebSocketInterceptor implements HandshakeInterceptor{

    private final static Logger log=Logger.getLogger(WebSocketInterceptor.class);

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler handler, Exception exceptions) {
        log.info("=================执行 afterHandshake ：handler: "+handler+"exceptions: "+exceptions);
    }


    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler handler,
                                   Map<String, Object> map)  {
        log.info("==================执行 beforeHandshake ：handler: "+handler+"map: "+map.values());
       User user=(User) SecurityUtils.getSubject().getPrincipal();
       map.put("user",user);
        return true;

    }

}
