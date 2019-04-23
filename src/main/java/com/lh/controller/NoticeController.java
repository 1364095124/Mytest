package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.lh.model.Metting;
import com.lh.model.Notice;
import com.lh.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NoticeController {

    @Autowired
    private INoticeService noticeService;

    /**
     * 跳转到公告页面
     * @return
     */
    @RequestMapping("notice/noticeList")
    public String noticeList(){
        return "notice/noticeList";
    }

    /**
     * 跳转到会议页面
     * @return
     */
    @RequestMapping("notice/mettingList")
    public String mettingList(){
        return "notice/mettingList";
    }

    /**
     * 得到所有的公告
     * @return
     */
    @ResponseBody
    @RequestMapping(value="notice/getAllNotice",produces = "text/plain;charset=utf-8")
    public String getAllNotice(){
        return JSON.toJSONString(noticeService.getAllNotice());
    }

    /**
     * 查询所有的会议
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "notice/getAllMetting",produces = "text/plain;charset=utf-8")
    public String getAllMetting(){
        return JSON.toJSONString(noticeService.getAllMetting());
    }

    /**
     * 新增公告
     * @param notice
     * @return
     */
    @ResponseBody
    @RequestMapping(value="notice/addNotice",produces = "text/plain;charset=utf-8")
    public String addNotice(Notice notice){
        return noticeService.addNotice(notice);
    }

    /**
     * 更新公告
     * @param notice
     * @return
     */
    @ResponseBody
    @RequestMapping(value="notice/updateNotice",produces = "text/plain;charset=utf-8")
    public String updateNotice(Notice notice){
        return noticeService.updateNotice(notice);
    }

    /**
     * 删除公告
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="notice/delNotice",produces = "text/plain;charset=utf-8")
    public String delNotice(String id){
        return noticeService.delNotice(id);
    }

    /**
     * 新增会议
     * @param metting
     * @return
     */
    @ResponseBody
    @RequestMapping(value="notice/addMetting",produces = "text/plain;charset=utf-8")
    public String addMetting(Metting metting){
        return noticeService.addMetting(metting);
    }

    /**
     * 更新会议
     * @param metting
     * @return
     */
    @ResponseBody
    @RequestMapping(value="notice/updateMetting",produces = "text/plain;charset=utf-8")
    public String updateMetting(Metting metting){
        return noticeService.updateMetting(metting);
    }

    /**
     * 删除会议
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="notice/delMetting",produces = "text/plain;charset=utf-8")
    public String delMetting(String id){
        return noticeService.delMetting(id);
    }


    /**
     * 得到最新公告和会议
     */
    @ResponseBody
    @RequestMapping(value="notice/getNew",produces = "text/plain;charset=utf-8")
    public String getNew() {
        return noticeService.getNew();
    }
}
