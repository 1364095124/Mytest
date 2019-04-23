package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.common.EmailUtils;
import com.lh.dao.MsgMapper;
import com.lh.dao.PersonMapper;
import com.lh.dao.UserMapper;
import com.lh.model.*;
import com.lh.scoket.SocketHandler;
import com.lh.service.IMsgService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
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
    private PersonMapper personMapper;

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
    public String sendMsg(Message msg) {
        JSONObject resultStr=new JSONObject();
        Person person=personMapper.queryPersonByAccount(msg.getSend_id());
        msg.setSendName(person.getName());
        SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        msg.setSendTime(fmt.format(new Date()));

        int result=msgMapper.addMsg(msg);
        if(result>0) {

            Map<String, Object> map = new HashMap<>();
            map.put("MSG", msg);
            socketHandler.sendMessageToUser(msg.getReceive_id(), JSONObject.toJSONString(map));
            resultStr.put("success",true);
            resultStr.put("msg","");
        }else{
            resultStr.put("success",false);
            resultStr.put("msg","失败");
        }
        return JSON.toJSONString(resultStr);
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
    public String updateToRead(String id) {
        JSONObject result=new JSONObject();
        if(msgMapper.updateToRead(id)>0){
            result.put("success",true);
            result.put("msg","");
        }else{
            result.put("success",false);
            result.put("msg","更新信息失败");
        }
        return JSON.toJSONString(result);
    }

    @Override
    public List<Message> selectPageList(Page page) {
        return msgMapper.selectPageList(page);
    }

    @Override
    public Integer selectPageCount(Page page) {
        return msgMapper.selectPageCount(page);
    }

    @Override
    public String delMsg(String id){
        JSONObject result=new JSONObject();
        if(msgMapper.delMsg(id)>0){
            result.put("success",true);
            result.put("msg","");
        }else{
            result.put("success",false);
            result.put("msg","删除失败");
        }
        return JSON.toJSONString(result);
    }


    /**
     * 发送邮件
     * @param account
     * @param content
     * @return
     */
    @Override
    public String sendEmail(String account, String content) {
        User user=(User) SecurityUtils.getSubject().getPrincipal();
        Person sender=personMapper.queryPersonByAccount(user.getAccount());
        Person recevier=personMapper.queryPersonByAccount(account);
        JSONObject rs=new JSONObject();
        MailParameters p=new MailParameters();
        p.setSenderAccount(sender.getEmail());
        p.setSenderPassword("ghlggflzzsayijcc");
        p.setSenderAddress(sender.getEmail());
        p.setMailSubject("OA系统消息-----"+sender.getName());
        p.setMailContent(content);
        p.setRecipientAddress(recevier.getEmail());
        try{
            EmailUtils.send(p);
            rs.put("success",true);
            rs.put("msg","");
        }catch(Exception e){
            rs.put("success",false);
            rs.put("msg",e);
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 发送消息
     * @param account
     * @param content
     * @return
     */
    @Override
    public String sendMsg(String account, String content) {
        JSONObject rs=new JSONObject();
        User user=(User)SecurityUtils.getSubject().getPrincipal();
        Message message=new Message();
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        message.setSendTime(sf.format(new Date()));
        message.setSend_id(user.getAccount());
        message.setReceive_id(account);
        message.setContent(content);
        message.setType("消息");
        if(msgMapper.addMsg(message)>0){
            Map<String, Object> map = new HashMap<>();
            map.put("MSG", message);
            socketHandler.sendMessageToUser(account, JSONObject.toJSONString(map));
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新数据库失败！");
        }

        return JSON.toJSONString(rs);
    }
}
