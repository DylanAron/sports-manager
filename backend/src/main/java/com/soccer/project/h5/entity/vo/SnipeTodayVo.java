package com.soccer.project.h5.entity.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author dylan
 * @description: 半全场狙击今天返回参数模型
 * @date 2025/4/14  21:57
 */
@Data
public class SnipeTodayVo implements Serializable {
    /**
     * 自增主键
     */
    private Integer id;

    /**
     * 回报率
     */
    private String rateOfReturn;

    /**
     * 总场次
     */
    private Integer total;

    /**
     * 联赛名称集合
     */
    private String leagueNames;

    /**
     * 状态 -1 已删除 0未发布 1已发布
     */
    private Integer status;


}
