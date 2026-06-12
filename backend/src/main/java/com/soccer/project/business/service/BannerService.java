package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Banner;
import com.soccer.project.business.entity.vo.BannerListReqVo;

public interface BannerService extends IService<Banner> {
    PageResp<Banner> selectByPage(Page<Banner> page, BannerListReqVo params);
}
