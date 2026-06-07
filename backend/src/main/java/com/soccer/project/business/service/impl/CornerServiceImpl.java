package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Corner;
import com.soccer.project.business.entity.vo.CornerListReqVo;
import com.soccer.project.business.mapper.CornerMapper;
import com.soccer.project.business.service.CornerService;
import org.springframework.stereotype.Service;

@Service
public class CornerServiceImpl extends ServiceImpl<CornerMapper, Corner> implements CornerService {
    @Override
    public PageResp<Corner> selectByPage(Page<Corner> page, CornerListReqVo params) {
        LambdaQueryWrapper<Corner> wrapper = new LambdaQueryWrapper<>();
        if (params != null && params.getMatchDate() != null) {
            wrapper.apply("DATE(match_date) = {0}", params.getMatchDate());
        }
        wrapper.orderByDesc(Corner::getMatchDate).orderByDesc(Corner::getId);
        Page<Corner> pageResult = baseMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }
}
