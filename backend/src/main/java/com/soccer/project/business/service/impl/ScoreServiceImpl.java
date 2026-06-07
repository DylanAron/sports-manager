package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Score;
import com.soccer.project.business.entity.vo.ScoreListReqVo;
import com.soccer.project.business.mapper.ScoreMapper;
import com.soccer.project.business.service.ScoreService;
import org.springframework.stereotype.Service;

@Service
public class ScoreServiceImpl extends ServiceImpl<ScoreMapper, Score> implements ScoreService {
    @Override
    public PageResp<Score> selectByPage(Page<Score> page, ScoreListReqVo params) {
        LambdaQueryWrapper<Score> wrapper = new LambdaQueryWrapper<>();
        if (params != null && params.getMatchDate() != null) {
            wrapper.apply("DATE(match_date) = {0}", params.getMatchDate());
        }
        wrapper.orderByDesc(Score::getMatchDate).orderByDesc(Score::getId);
        Page<Score> pageResult = baseMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }
}
