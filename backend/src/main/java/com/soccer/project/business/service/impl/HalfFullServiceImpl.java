package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.HalfFull;
import com.soccer.project.business.entity.vo.HalfFullListReqVo;
import com.soccer.project.business.mapper.HalfFullMapper;
import com.soccer.project.business.service.HalfFullService;
import org.springframework.stereotype.Service;

@Service
public class HalfFullServiceImpl extends ServiceImpl<HalfFullMapper, HalfFull> implements HalfFullService {
    @Override
    public PageResp<HalfFull> selectByPage(Page<HalfFull> page, HalfFullListReqVo params) {
        LambdaQueryWrapper<HalfFull> wrapper = new LambdaQueryWrapper<>();
        if (params != null && params.getMatchDate() != null) {
            wrapper.apply("DATE(match_date) = {0}", params.getMatchDate());
        }
        wrapper.orderByDesc(HalfFull::getMatchDate).orderByDesc(HalfFull::getId);
        Page<HalfFull> pageResult = baseMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }
}
