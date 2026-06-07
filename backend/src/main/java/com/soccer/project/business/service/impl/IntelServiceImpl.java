package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.project.business.entity.po.Intel;
import com.soccer.project.business.mapper.IntelMapper;
import com.soccer.project.business.service.IntelService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IntelServiceImpl extends ServiceImpl<IntelMapper, Intel> implements IntelService {
    @Override
    public List<Intel> getByDateRange(String startDate, String endDate) {
        return baseMapper.selectByDateRange(startDate, endDate);
    }
}
