package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.LightningSecretGroup;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.project.business.entity.po.LightningSecretMatch;
import com.soccer.project.business.entity.po.SingleBagMatch;
import com.soccer.project.business.entity.vo.*;
import com.soccer.project.h5.entity.vo.lightningsecret.H5SecretListVo;
import com.soccer.project.h5.entity.vo.singlebag.H5SingleBagListVo;

import java.util.List;

/**
* @author Dell
* @description 针对表【t_lightning_secret_group(闪电秘籍分组表)】的数据库操作Service
* @createDate 2025-04-11 15:14:18
*/
public interface LightningSecretGroupService extends IService<LightningSecretGroup> {

    PageResp<LightningSecretGroup> selectByPage(Page<LightningSecretGroup> page, LightningSecretListReqVo data);


    /**
     * @Author dylan
     * @Description: 添加半全场狙击
     * @Create: 2025/4/10 15:43
     */
    int add(LightningSecretAddReqVo request);


    List<LightningSecretMatch> getMatchListByGroup(Integer groupId);

    /**
     * @Author dylan
     * @Description: 修改半场狙击
     * @Create: 2025/4/10 18:02
     */
    int update(LightningSecretEditReqVo request);


    /**
     * @Author dylan
     * @Description: h5查询列表接口
     * @Create: 2025/4/16 14:21
     */
    List<H5SecretListVo> getListH5(Integer days);

}
