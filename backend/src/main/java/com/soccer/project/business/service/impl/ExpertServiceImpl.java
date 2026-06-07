package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageResp;
import com.soccer.common.utils.StringUtils;
import com.soccer.project.business.entity.po.Expert;
import com.soccer.project.business.entity.vo.ExpertListReqVo;
import com.soccer.project.business.mapper.ExpertMapper;
import com.soccer.project.business.service.ExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dylan
 * @description 专家接口实现类
 * @date 2025/4/5  20:14
 */
@Service
public class ExpertServiceImpl extends ServiceImpl<ExpertMapper, Expert> implements ExpertService {
    @Autowired
    private ExpertMapper expertMapper;

    @Override
    public PageResp<Expert> selectByPage(Page<Expert> page, ExpertListReqVo params) {
        LambdaQueryWrapper<Expert> wrapper = new LambdaQueryWrapper<>();
        wrapper.ne(Expert::getStatus,-1);
        if(StringUtils.isNotEmpty(params.getSearchText())){
            wrapper.like(Expert::getName, "%" + params.getSearchText() + "%");
        }
        wrapper.orderByAsc(Expert::getSort).orderByDesc(Expert::getCreateTime);
        Page<Expert> pageResult = expertMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }

    @Override
    public Expert getByName(String name) {
        return expertMapper.selectByName(name);
    }
}
