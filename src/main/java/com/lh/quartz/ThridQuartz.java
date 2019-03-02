package com.lh.quartz;


import com.lh.dao.ThirdAppMapper;
import com.lh.model.ThirdAppPending;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ThridQuartz {

    @Autowired
    private ThirdAppMapper thirdAppMapper;

    @Scheduled(cron = "0 0/5 * * * ?")
    public void Taskby5Min(){
        System.out.println("定时器启动");
        ThirdAppPending thirdAppPending=new ThirdAppPending();
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
        }

    }


}
