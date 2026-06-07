package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Corner;
import com.soccer.project.business.entity.vo.CornerListReqVo;

public interface CornerService extends IService<Corner> {
    PageResp<Corner> selectByPage(Page<Corner> page, CornerListReqVo params);
}
