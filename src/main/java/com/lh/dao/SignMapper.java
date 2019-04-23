package com.lh.dao;

import com.lh.model.Memo;
import com.lh.model.Sign;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SignMapper {

    Integer addSign(Sign sign);

    List<Sign> querySign(Sign sign);


    Integer addMemo(Memo memo);

    List<Memo> queryNewMemo(@Param("account") String account, @Param("keyWord") String keyWord);

    List<Memo> queryAllMemo();

    List<Memo> queryOldMemo(@Param("account") String account,@Param("keyWord") String keyWord);

    List<Memo> queryAvalMemo();

    Integer updateMemo(Memo memo);

    Integer deleteMemo(String id);

    Integer newMemoCount(String account);

    Integer changeMemoState(String id);


}
