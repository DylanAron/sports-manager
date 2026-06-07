package com.soccer.project.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.soccer.project.business.entity.po.Expert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 专家表 Mapper
 *
 * @author dylan
 * @since 2025-04-04 23:45
 */
@Mapper
public interface ExpertMapper extends BaseMapper<Expert> {
    Expert selectByName(@Param("name") String name);
}
