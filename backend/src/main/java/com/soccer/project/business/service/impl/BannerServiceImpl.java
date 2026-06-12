package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.common.utils.StringUtils;
import com.soccer.project.business.entity.po.Banner;
import com.soccer.project.business.entity.vo.BannerListReqVo;
import com.soccer.project.business.mapper.BannerMapper;
import com.soccer.project.business.service.BannerService;
import org.springframework.stereotype.Service;

@Service
public class BannerServiceImpl extends ServiceImpl<BannerMapper, Banner> implements BannerService {
    @Override
    public PageResp<Banner> selectByPage(Page<Banner> page, BannerListReqVo params) {
        LambdaQueryWrapper<Banner> wrapper = new LambdaQueryWrapper<>();
        if (params != null && StringUtils.isNotEmpty(params.getTitle())) {
            wrapper.like(Banner::getTitle, params.getTitle());
        }
        wrapper.orderByAsc(Banner::getSortOrder).orderByDesc(Banner::getId);
        Page<Banner> pageResult = baseMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }
}
