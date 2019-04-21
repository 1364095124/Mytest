package com.lh.dao;

import com.lh.model.Authorization;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 授权
 */
public interface AutMapper {
    /**
     * 新增授权记录
     * @param authorization
     * @return
     */
    Integer addAut(Authorization authorization);

    /**
     * 查询所有的公告授权
     * @return
     */
    List<Authorization> getAllNoticeAut();

    /**
     * 查询公告授权总数
     * @return
     */
    Integer queryNoticeAutCount();

    /**
     * 查询所有的会议授权
     * @return
     */
    List<Authorization> getAllMettingAut();

    /**
     * 查询会议授权总数
     * @return
     */
    Integer queryMettingAutCount();
    /**
     * 根据id删除授权记录
     * @param id
     * @return
     */
    Integer delAut(String id);

    /**
     * 查询是否有相同的授权记录
     * @param permission 权限
     * @param account 被授权人
     * @return
     */
    Authorization queryAut(@Param("permission") String permission, @Param("account") String account);

    Integer queryMetAutByAccount(String account);

    Integer queryNotAutByAccount(String account);

}
