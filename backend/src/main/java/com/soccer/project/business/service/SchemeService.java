package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Scheme;
import com.soccer.project.business.entity.vo.SchemeListReqVo;
import com.soccer.project.h5.entity.vo.SchemeListRespVo;

/**
* @author 吴卓跃
* @description 针对表【t_scheme(方案表)】的数据库操作Service
* @createDate 2025-04-06 14:41:27
*/
public interface SchemeService extends IService<Scheme> {
    /**
     * @author dylan
     * @description 请求分页数据
     * @date 2025/4/5  20:16
     */
    PageResp<Scheme> selectByPage(Page<Scheme> page, SchemeListReqVo params);

    /**
     * @author dylan
     * @description 查询h5请求分页
     * @date 2025/4/13  13:43
     */
    Page<SchemeListRespVo> selectH5ByPage(Page<SchemeListRespVo> page, Scheme scheme);

}
