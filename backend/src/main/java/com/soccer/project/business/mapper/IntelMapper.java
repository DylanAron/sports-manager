package com.soccer.project.business.mapper;

import com.soccer.project.business.entity.po.Intel;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author 吴卓跃
* @description 针对表【t_intel(情报配置表)】的数据库操作Mapper
* @createDate 2025-04-07 23:23:03
* @Entity com.soccer.project.business.entity.po.Intel
*/
public interface IntelMapper extends BaseMapper<Intel> {

    List<Intel> selectByDateRange(String startDate, String endDate);
}








