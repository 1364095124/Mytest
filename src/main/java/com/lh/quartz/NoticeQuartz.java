package com.lh.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class NoticeQuartz {

    @Scheduled(cron = "0 0/1 * * * ?")
    public void noticeTask(){

    }
}
