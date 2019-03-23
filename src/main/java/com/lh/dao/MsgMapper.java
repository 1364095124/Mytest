package com.lh.dao;

import com.lh.model.Message;
import com.lh.model.Page;

import java.util.List;
import java.util.Map;

public interface MsgMapper {
    /*
    *@Param message 消息
    * 新增一条消息
     */
    public int addMsg(Message message);

    /*
    *@Param message 消息
    * 可以根据任意条件查询信息
     */
    public List<Map<String,Object>> queryMsg(Message message);

    /*
    @Param id 消息主键id
    *修改消息状态为已读
     */
    public int updateToRead(String id);

    /*
    @Param page
    通过关键字查询分页查询数据列表
     */
    public List<Message> selectPageList(Page page);

    /*
    @Param page
    通过关键字分页查询，返回总记录数
     */
    public Integer selectPageCount(Page page);

    /**
     * @Param id
     * 删除消息
     */
    public Integer delMsg(String id);

}
