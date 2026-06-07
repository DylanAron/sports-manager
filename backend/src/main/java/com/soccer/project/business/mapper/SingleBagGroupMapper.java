package com.soccer.project.business.mapper;

import com.soccer.project.business.entity.po.SingleBagGroup;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Dell
* @description 针对表【t_single_bag_group(北单分组表)】的数据库操作Mapper
* @createDate 2025-04-11 13:45:03
* @Entity com.soccer.project.business.entity.po.SingleBagGroup
*/
public interface SingleBagGroupMapper extends SoccerBaseMapper<SingleBagGroup> {
    /**
     * @Author dylan
     * @Description: 查询多少天以前的数据
     * @Create: 2025/4/16 14:29
     */
    List<SingleBagGroup> selectByDaysAgo(@Param("days") Integer days);
}




