package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Goal;
import com.soccer.project.business.entity.vo.GoalListReqVo;

public interface GoalService extends IService<Goal> {
    PageResp<Goal> selectByPage(Page<Goal> page, GoalListReqVo params);
}
