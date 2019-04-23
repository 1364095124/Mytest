package com.lh.dao;

import com.lh.model.Metting;
import com.lh.model.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 公告会议dao
 */
public interface NoticeMapper {

    Integer addNotice(Notice notice);

    List<Notice> getAllNotice();

    Integer queryNoticeCount();

    Notice querySameNotice(Notice notice);

    Integer updateNotice(Notice notice);

    Integer delNotice(String id);

    Integer addMetting(Metting metting);

    List<Metting> getAllMetting();

    Integer queryMettingCount();

    Metting querySameMetting(Metting metting);

    Metting queryMettingByAddress(@Param("address") String address, @Param("tiggerTime") String tiggerTime);

    Integer updateMetting(Metting metting);

    Integer delMetting(String id);

    List<Notice> queryAvalNotice();

    List<Metting> queryAvalMetting();

    Integer changeMettingState(String id);

    Notice getNewNotice();

    Metting getNewMetting();

}
