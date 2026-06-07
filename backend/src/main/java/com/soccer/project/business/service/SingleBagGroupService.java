package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.SingleBagGroup;
import com.soccer.project.business.entity.po.SingleBagMatch;
import com.soccer.project.business.entity.vo.SingleBagAddReqVo;
import com.soccer.project.business.entity.vo.SingleBagEditReqVo;
import com.soccer.project.business.entity.vo.SingleBagListReqVo;
import com.soccer.project.h5.entity.vo.singlebag.H5SingleBagListVo;

import java.util.List;

public interface SingleBagGroupService extends IService<SingleBagGroup> {

    PageResp<SingleBagGroup> selectByPage(Page<SingleBagGroup> page, SingleBagListReqVo data);


    /**
     * @Author dylan
     * @Description: 添加半全场狙击
     * @Create: 2025/4/10 15:43
     */
    int add(SingleBagAddReqVo request);


    List<SingleBagMatch> getMatchListByGroup(Integer groupId);

    /**
     * @Author dylan
     * @Description: 修改半场狙击
     * @Create: 2025/4/10 18:02
     */
    int update(SingleBagEditReqVo request);

    /**
     * @Author dylan
     * @Description: h5查询列表接口
     * @Create: 2025/4/16 14:21
     */
    List<H5SingleBagListVo> getListH5(Integer days);
}
