package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Goal;
import com.soccer.project.business.entity.vo.GoalListReqVo;
import com.soccer.project.business.mapper.GoalMapper;
import com.soccer.project.business.service.GoalService;
import org.springframework.stereotype.Service;

@Service
public class GoalServiceImpl extends ServiceImpl<GoalMapper, Goal> implements GoalService {
    @Override
    public PageResp<Goal> selectByPage(Page<Goal> page, GoalListReqVo params) {
        LambdaQueryWrapper<Goal> wrapper = new LambdaQueryWrapper<>();
        if (params != null && params.getMatchDate() != null) {
            wrapper.apply("DATE(match_date) = {0}", params.getMatchDate());
        }
        wrapper.orderByDesc(Goal::getMatchDate).orderByDesc(Goal::getId);
        Page<Goal> pageResult = baseMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }
}
