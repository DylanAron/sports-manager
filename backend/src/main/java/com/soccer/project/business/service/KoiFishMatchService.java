package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.KoiFishMatch;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.project.business.entity.vo.KoiFishListReqVo;
import com.soccer.project.h5.entity.vo.koiFish.H5KoiFishListReqVo;

import java.util.List;

/**
* @author Dell
* @description 针对表【t_koi_fish_match(闪电秘籍赛事表)】的数据库操作Service
* @createDate 2025-04-11 16:28:17
*/
public interface KoiFishMatchService extends IService<KoiFishMatch> {

    /**
     * @Author dylan
     * @Description: 锦鲤扫盘列表查询接口
     * @Create: 2025/4/11 16:30
     */
    PageResp<KoiFishMatch> selectByPage(Page<KoiFishMatch> page, KoiFishListReqVo params);

    /**
     * @Author dylan
     * @Description: h5查询列表
     * @Create: 2025/4/19 10:03
     */
    List<KoiFishMatch> getH5List(H5KoiFishListReqVo request);

}
