package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Analysis;
import com.soccer.project.business.entity.vo.AnalysisListReqVo;
import com.soccer.project.business.mapper.AnalysisMapper;
import com.soccer.project.business.service.AnalysisService;
import org.springframework.stereotype.Service;

@Service
public class AnalysisServiceImpl extends ServiceImpl<AnalysisMapper, Analysis> implements AnalysisService {
    @Override
    public PageResp<Analysis> selectByPage(Page<Analysis> page, AnalysisListReqVo params) {
        LambdaQueryWrapper<Analysis> wrapper = new LambdaQueryWrapper<>();
        if (params != null && params.getMatchTime() != null) {
            wrapper.apply("DATE(match_time) = {0}", params.getMatchTime());
        }
        wrapper.orderByDesc(Analysis::getMatchTime).orderByDesc(Analysis::getId);
        Page<Analysis> pageResult = baseMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }
}
