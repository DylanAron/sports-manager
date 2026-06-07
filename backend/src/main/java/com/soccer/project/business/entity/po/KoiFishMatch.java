package com.soccer.project.business.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 闪电秘籍赛事表
 * @TableName t_koi_fish_match
 */
@TableName(value ="t_koi_fish_match")
@Data
public class KoiFishMatch implements Serializable {
    /**
     * id主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 联赛名称
     */
    private String leagueName;

    /**
     * 比赛时间
     */
    @DateTimeFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime matchTime;

    /**
     * 比赛状态0未完场1已完场
     */
    private Integer matchStatus;

    /**
     * 赛事日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate matchDate;

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
     * 命中的下标
     */
    private Integer hitIndex;

    /**
     * 状态 -1 已删除 0未发布 1已发布
     */
    private Integer status;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime updateTime;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime createTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}