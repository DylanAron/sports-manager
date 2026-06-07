package com.soccer.project.business.mapper;

import com.soccer.project.business.entity.po.LightningSecretGroup;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.soccer.project.business.entity.po.SingleBagGroup;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Dell
* @description 针对表【t_lightning_secret_group(闪电秘籍分组表)】的数据库操作Mapper
* @createDate 2025-04-11 15:14:18
* @Entity com.soccer.project.business.entity.po.LightningSecretGroup
*/
public interface LightningSecretGroupMapper extends SoccerBaseMapper<LightningSecretGroup> {

    /**
     * @Author dylan
     * @Description: 查询多少天以前的数据
     * @Create: 2025/4/16 14:29
     */
    List<LightningSecretGroup> selectByDaysAgo(@Param("days") Integer days);

}




