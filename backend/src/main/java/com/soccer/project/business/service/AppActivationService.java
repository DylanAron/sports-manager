package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.AppActivation;
import com.soccer.project.business.entity.vo.ActivationListReqVo;

public interface AppActivationService extends IService<AppActivation> {
    PageResp<AppActivation> selectByPage(Page<AppActivation> page, ActivationListReqVo params);
}
