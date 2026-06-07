package com.soccer.project.business.mapper;

import com.soccer.project.business.entity.po.LightningSecretMatch;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.soccer.project.business.entity.po.SingleBagMatch;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Dell
* @description 针对表【t_lightning_secret_match(闪电秘籍赛事表)】的数据库操作Mapper
* @createDate 2025-04-11 15:14:18
* @Entity com.soccer.project.business.entity.po.LightningSecretMatch
*/
public interface LightningSecretMatchMapper extends SoccerBaseMapper<LightningSecretMatch> {

    int insertOrUpdateBatch(@Param("list") List<LightningSecretMatch> matchList);

}




