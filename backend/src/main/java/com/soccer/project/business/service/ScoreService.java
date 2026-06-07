package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Score;
import com.soccer.project.business.entity.vo.ScoreListReqVo;

public interface ScoreService extends IService<Score> {
    PageResp<Score> selectByPage(Page<Score> page, ScoreListReqVo params);
}
