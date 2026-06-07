package com.soccer.project.business.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.project.business.entity.po.Scheme;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.soccer.project.h5.entity.vo.SchemeListRespVo;
import org.apache.ibatis.annotations.Param;

/**
* @author 吴卓跃
* @description 针对表【t_scheme(方案表)】的数据库操作Mapper
* @createDate 2025-04-06 14:41:27
* @Entity com.soccer.project.business.entity.po.Scheme
*/
public interface SchemeMapper extends BaseMapper<Scheme> {
    /**
     * @author dylan
     * @description: 查询H5分页列表
     * @date 2025/4/13  13:46
     */
    Page<SchemeListRespVo> selectH5ByPage(Page<SchemeListRespVo> page,@Param("scheme") Scheme scheme);
}




