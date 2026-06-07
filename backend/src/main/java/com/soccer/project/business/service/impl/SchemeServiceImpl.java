package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.common.utils.StringUtils;
import com.soccer.project.business.entity.po.Scheme;
import com.soccer.project.business.entity.vo.SchemeListReqVo;
import com.soccer.project.business.service.SchemeService;
import com.soccer.project.business.mapper.SchemeMapper;
import com.soccer.project.h5.entity.vo.SchemeListRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author 吴卓跃
* @description 针对表【t_scheme(方案表)】的数据库操作Service实现
* @createDate 2025-04-06 14:41:27
*/
@Service
public class SchemeServiceImpl extends ServiceImpl<SchemeMapper, Scheme> implements SchemeService {
    @Autowired
    private SchemeMapper schemeMapper;
    @Override
    public PageResp<Scheme> selectByPage(Page<Scheme> page, SchemeListReqVo params) {
        LambdaQueryWrapper<Scheme> wrapper = new LambdaQueryWrapper<>();
        wrapper.ne(Scheme::getStatus,-1);
        wrapper.eq(Scheme::getType,params.getType());
        if(params.getExpertId()!=null){
            wrapper.eq(Scheme::getExpertId,params.getExpertId());
        }
        if(StringUtils.isNotEmpty(params.getLeagueName())){
            wrapper.like(Scheme::getLeagueName, "%" + params.getLeagueName() + "%");
        }
        wrapper.orderByDesc(Scheme::getCreateTime);
        Page<Scheme> pageResult = schemeMapper.selectPage(page, wrapper);
        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }

    @Override
    public Page<SchemeListRespVo> selectH5ByPage(Page<SchemeListRespVo> page, Scheme scheme) {
        if(scheme.getType()==null){
            throw new RuntimeException("参数错误");
        }
        return schemeMapper.selectH5ByPage(page,scheme);
    }
}




