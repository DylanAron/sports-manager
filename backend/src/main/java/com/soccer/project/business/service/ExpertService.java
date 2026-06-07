package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.common.domain.PageResp;
import com.soccer.project.business.entity.po.Expert;
import com.soccer.project.business.entity.vo.ExpertListReqVo;
import org.apache.ibatis.annotations.Select;

/**
 * @author dylan
 * @description 专家接口
 * @date 2025/4/5  20:13
 */
public interface ExpertService extends IService<Expert> {
    /**
     * @author dylan
     * @description 请求分页数据
     * @date 2025/4/5  20:16
     */
    PageResp<Expert> selectByPage(Page<Expert> page, ExpertListReqVo params);

    /**
     * @author dylan
     * @description 根据名称查询专家
     * @date 2025/4/13  0:28
     */
    Expert getByName(String name);
}
