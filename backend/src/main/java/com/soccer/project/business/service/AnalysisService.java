package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Analysis;
import com.soccer.project.business.entity.vo.AnalysisListReqVo;

public interface AnalysisService extends IService<Analysis> {
    PageResp<Analysis> selectByPage(Page<Analysis> page, AnalysisListReqVo params);
}
