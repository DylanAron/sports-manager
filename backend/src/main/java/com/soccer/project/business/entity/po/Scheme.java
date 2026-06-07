package com.soccer.project.business.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 方案表
 * @TableName t_scheme
 */
@Data
@TableName(value ="t_scheme")
public class Scheme implements Serializable {
    /**
     * 主键id 自增
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 专家id（外键）可以为空
     */
    private Integer expertId;

    /**
     * 主队名称
     */
    private String homeName;

    /**
     * 客队名称
     */
    private String guestName;

    /**
     * 联赛名称
     */
    private String leagueName;

    /**
     * 赛事时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date matchTime;

    /**
     * 发布时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date publishTime;

    /**
     * 感兴趣人数
     */
    private Integer likeNum;

    /**
     * 0未发布1已发布99删除
     */
    private Integer status;

    /**
     * 0免费方案1专家方案
     */
    private Integer type;

    /**
     * 玩法类型（1让球2总进球）
     */
    private Integer playType;

    /**
     * 玩法球数
     */
    private String ballNum;

    /**
     * json指数集合
     */
    private String oddsList;

    /**
     * 是否命中
     */
    private Integer isHit;

    /**
     * 推荐索引
     */
    private Integer recommendIndex;

    /**
     * 命中索引
     */
    private Integer hitIndex;

    /**
     * 全场比分
     */
    private String fullScore;

    /**
     * 支付二维码
     */
    private String payCode;

    /**
     * 文章分析
     */
    private String content;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

}