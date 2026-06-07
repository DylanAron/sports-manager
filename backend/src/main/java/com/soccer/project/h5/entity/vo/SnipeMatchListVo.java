package com.soccer.project.h5.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * @author dylan
 * @description: 半全场返回参数
 * @date 2025/4/14  21:38
 */
@Data
public class SnipeMatchListVo implements Serializable {
    /**
     * 赛事所属日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate matchDate;

    /**
     * id主键
     */
    private Integer id;

    /**
     * 分组id
     */
    private Integer groupId;

    /**
     * 联赛名称
     */
    private String leagueName;

    /**
     * 比赛时间
     */
    private LocalDateTime matchTime;

    /**
     * 比赛状态0未完场1已完场
     */
    private Integer matchStatus;

    /**
     * 序列号 (周二003)
     */
    private String serialize;

    /**
     * 主队名称
     */
    private String homeName;

    /**
     * 客队名称
     */
    private String guestName;

    /**
     * 半场比分
     */
    private String halfScore;

    /**
     * 全场比分
     */
    private String fullScore;

    /**
     * 推荐内容  胜平负 JSON字符串
     */
    private String recommendContent;

    /**
     * 是否命中 0 未命中 1命中
     */
    private Integer isHit;

    /**
     * 命中结果
     */
    private Integer hitIndex;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime updateTime;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;
}
