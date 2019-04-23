package com.lh.service;

import com.lh.model.Metting;
import com.lh.model.Notice;
import com.lh.model.ResultMap;

import java.util.List;

public interface INoticeService {

    ResultMap<List<Notice>> getAllNotice();

    String addNotice(Notice notice);

    String delNotice(String id);

    String updateNotice(Notice notice);

    ResultMap<List<Metting>> getAllMetting();

    String addMetting(Metting metting);

    String delMetting(String id);

    String updateMetting(Metting metting);

    String getNew();
}
