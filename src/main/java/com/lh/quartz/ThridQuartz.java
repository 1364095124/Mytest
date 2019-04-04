package com.lh.quartz;


import com.alibaba.fastjson.JSON;
import com.lh.dao.SignMapper;
import com.lh.dao.ThirdAppMapper;
import com.lh.model.Memo;
import com.lh.model.Message;
import com.lh.service.IMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

@Component
public class ThridQuartz {

    @Autowired
    private ThirdAppMapper thirdAppMapper;

    @Autowired
    private SignMapper signMapper;

    @Autowired
    private IMsgService msgService;

//    @Scheduled(cron = "0 0/2 * * * ?")
    public void Taskby5Min(){
        System.out.println("定时器启动");
        /*ThirdAppPending thirdAppPending=new ThirdAppPending();
        List<ThirdAppPending> pendingList=thirdAppMapper.queryThirdPending(thirdAppPending);
        if(pendingList!=null&&!pendingList.isEmpty()){
            for(int i=0;i<pendingList.size();i++){
                thirdAppPending=pendingList.get(i);
                if(thirdAppPending.getType()==1){
                    if(thirdAppPending.getRequireTime()!=0){
                        if(thirdAppPending.getRequireTime()==5){
                            System.out.println("---");
                        }
                    }
                }

            }
        }*/

        List<Memo> list=signMapper.queryAvalMemo();
        if(list!=null&&!list.isEmpty()){
            SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String s=sf.format(new Date());

            for(Memo memo:list){
                try {
                    Date date1=sf.parse(s);
                    Date date2=sf.parse(memo.getTigger_Time());
                    if(Math.abs(date1.getTime()-date2.getTime())/1000/60<2){
                        Message message=new Message();
                        message.setContent(memo.getContent());
                        message.setReceive_id(memo.getAccount());
                        message.setType("公告");
                        message.setSend_id("System");
                        message.setSendTime(memo.getTigger_Time());
                        System.out.println("发送公告"+ JSON.toJSONString(message));
                        msgService.sendMsg(message);
                    }

                } catch (ParseException e) {
                    e.printStackTrace();
                }

            }
        }


    }


}
