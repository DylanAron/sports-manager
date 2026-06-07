package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.WinLose;
import com.soccer.project.business.entity.vo.WinLoseListReqVo;

public interface WinLoseService extends IService<WinLose> {
    PageResp<WinLose> selectByPage(Page<WinLose> page, WinLoseListReqVo params);
}
