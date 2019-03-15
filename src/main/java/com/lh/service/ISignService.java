package com.lh.service;

import com.lh.model.Memo;
import com.lh.model.Sign;

import java.util.List;

public interface ISignService {

    String doSign(Sign sign);

    String querySign(String account);

    Integer checkSign(String account);

    String addMemo(Memo memo);

    String queryMemo(String account,String keyWord);

    String updateMemo(Memo memo);

    String deleteMemo(String id);
}
