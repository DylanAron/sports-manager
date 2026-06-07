package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.HalfFull;
import com.soccer.project.business.entity.vo.HalfFullListReqVo;

public interface HalfFullService extends IService<HalfFull> {
    PageResp<HalfFull> selectByPage(Page<HalfFull> page, HalfFullListReqVo params);
}
