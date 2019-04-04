package com.lh.service;

import com.lh.model.Message;
import com.lh.model.Page;

import java.util.List;

public interface IMsgService {
    /*
    *@Param message 消息
    * 发送消息
     */
    public String sendMsg(Message message);

    String sendEmail(String account,String content);

    String sendMsg(String account,String content);

    /*
    *@Param message 消息
    * 查询消息
     */
    public String queryMsg(Message message);

    /*
    *@Param id 消息主键id
    * 修改消息状态为已读
     */
    public String updateToRead(String id);


    //分页数据
    List<Message> selectPageList(Page page);
    //分页数据总数
    Integer selectPageCount(Page page);

    /**
     * @Param id
     * 删除消息
     */
    String delMsg(String id);
}
