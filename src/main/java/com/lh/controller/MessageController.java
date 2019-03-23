package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.model.Message;
import com.lh.model.Page;
import com.lh.model.ResultMap;
import com.lh.service.IMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MessageController {

    @Autowired
    private IMsgService msgService;
    /*
    * 发送消息
     */
    @RequestMapping(value="/msg/addMsg",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addMsg(@RequestBody Message message){

         return msgService.sendMsg(message);
    }
    //跳转到未读消息界面
    @RequestMapping("msg/unreadMsg")
    public String unreadMsg(){
        return "message/unreadMsg";
    }

    /*
    *@Param message 信息
    查询信息
     */
    @RequestMapping("msg/selectMsg")
    @ResponseBody
    public String selectUnMsg(Message message){

        return msgService.queryMsg(message);
    }

    /*
    *@Param id 消息主键id
    * 响应ajax请求，修改消息状态为已读
     */
    @RequestMapping("msg/updateToRead")
    @ResponseBody
    public String updateToRead(@RequestParam("id") String id){
        return msgService.updateToRead(id);
    }

    @RequestMapping("/msg/msgList")
    @ResponseBody
    public ResultMap<List<Message>> backContent(Page page, @RequestParam("limit") int limit){
        System.out.println("backContent========================"+limit);
        page.setRows(limit);
        System.out.println("page:"+page.toString());
        List<Message> contentList=msgService.selectPageList(page);
        System.out.println(JSONObject.toJSONString(contentList));
        int totals=msgService.selectPageCount(page);
        page.setTotalRecord(totals);
        return new ResultMap<List<Message>>("",contentList,0,totals);
    }

    /**
     * @Param id
     * 删除信息
     */
    @RequestMapping(value="/msg/delMsg")
    @ResponseBody
    public String delMsg(@RequestParam("id") String id){
        return msgService.delMsg(id);
    }
}
