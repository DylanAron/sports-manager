package com.soccer.project.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.soccer.project.business.entity.po.Intel;

import java.util.List;

public interface IntelService extends IService<Intel> {
    List<Intel> getByDateRange(String startDate, String endDate);
}
