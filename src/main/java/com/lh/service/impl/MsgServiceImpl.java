package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.MsgMapper;
import com.lh.dao.UserMapper;
import com.lh.model.Message;
import com.lh.model.Page;
import com.lh.model.User;
import com.lh.scoket.SocketHandler;
import com.lh.service.IMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("msgService")
public class MsgServiceImpl implements IMsgService {
    @Autowired
    private SocketHandler socketHandler;

    @Autowired
    private MsgMapper msgMapper;

    @Autowired
    private UserMapper userMapper;

/**
 * @Title: sendMessage
 * @Description:    给某个人推送消息
 * @param @param send_id
 * @param @param receive_id
 * @param @param type
 * @param @param content
 * @param @param sendTime
 * @param @param url
 * @return void
 */


    @Override
    public void sendMsg(Message message) {
        Message msg=new Message();
        msg.setSend_id(message.getSend_id());
        msg.setReceive_id(message.getReceive_id());
        msg.setType(message.getType());
        msg.setContent(message.getContent());
        SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        msg.setSendTime(fmt.format(new Date()));
        msg.setUrl(message.getUrl());
        int result=msgMapper.addMsg(msg);
        if(result>0) {
            msg.setSendName(message.getSend_id());
            Map<String, Object> map = new HashMap<>();
            map.put("MSG", msg);
            socketHandler.sendMessageToUser(message.getReceive_id(), JSONObject.toJSONString(map));
        }
    }

    @Override
    public String queryMsg(Message message) {
        String result="";
        List<Map<String,Object>> list=msgMapper.queryMsg(message);

        if(list!=null&&!list.isEmpty()){
            result= JSON.toJSONString(list);

        }

        return result;
    }

    @Override
    public int updateToRead(String id) {
        return msgMapper.updateToRead(id);
    }

    @Override
    public List<Message> selectPageList(Page page) {
        return msgMapper.selectPageList(page);
    }

    @Override
    public Integer selectPageCount(Page page) {
        return msgMapper.selectPageCount(page);
    }
}
