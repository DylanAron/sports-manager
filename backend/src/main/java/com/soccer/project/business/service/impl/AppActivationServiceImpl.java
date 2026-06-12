package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.AppActivation;
import com.soccer.project.business.entity.vo.ActivationListReqVo;
import com.soccer.project.business.mapper.AppActivationMapper;
import com.soccer.project.business.service.AppActivationService;
import org.springframework.stereotype.Service;

@Service
public class AppActivationServiceImpl extends ServiceImpl<AppActivationMapper, AppActivation> implements AppActivationService {
    @Override
    public PageResp<AppActivation> selectByPage(Page<AppActivation> page, ActivationListReqVo params) {
        LambdaQueryWrapper<AppActivation> wrapper = new LambdaQueryWrapper<>();
        if (params != null && params.getReportDate() != null) {
            wrapper.apply("DATE(report_time) = {0}", params.getReportDate());
        }
        wrapper.orderByDesc(AppActivation::getReportTime).orderByDesc(AppActivation::getId);
        Page<AppActivation> pageResult = baseMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }
}
