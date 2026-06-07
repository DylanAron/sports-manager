package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.WinLose;
import com.soccer.project.business.entity.vo.WinLoseListReqVo;
import com.soccer.project.business.mapper.WinLoseMapper;
import com.soccer.project.business.service.WinLoseService;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class WinLoseServiceImpl extends ServiceImpl<WinLoseMapper, WinLose> implements WinLoseService {
    @Override
    public PageResp<WinLose> selectByPage(Page<WinLose> page, WinLoseListReqVo params) {
        LambdaQueryWrapper<WinLose> wrapper = new LambdaQueryWrapper<>();
        if (params != null && params.getMatchDate() != null) {
            wrapper.apply("DATE(match_date) = {0}", params.getMatchDate());
        }
        wrapper.orderByDesc(WinLose::getMatchDate).orderByDesc(WinLose::getId);
        Page<WinLose> pageResult = baseMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }
}
