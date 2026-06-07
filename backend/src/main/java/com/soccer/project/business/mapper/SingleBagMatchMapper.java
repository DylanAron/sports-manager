package com.soccer.project.business.mapper;

import com.soccer.project.business.entity.po.SingleBagMatch;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Dell
* @description 针对表【t_single_bag_match(北单赛事表)】的数据库操作Mapper
* @createDate 2025-04-11 13:45:03
* @Entity com.soccer.project.business.entity.po.SingleBagMatch
*/
public interface SingleBagMatchMapper extends SoccerBaseMapper<SingleBagMatch> {

    int insertOrUpdateBatch(@Param("list") List<SingleBagMatch> matchList);

}




