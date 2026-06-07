package com.soccer.project.business.entity.vo;

import lombok.Data;
import org.springframework.validation.annotation.Validated;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * @author dylan
 * @description 添加方案请求参数模型
 * @date 2025/4/6  22:31
 */
@Validated
@Data
public class SchemeAddReqVo implements Serializable {

    /**
     * 专家id（外键）可以为空
     */
    @NotNull
    private Integer expertId;

    /**
     * 主队名称
     */
    @NotEmpty
    private String homeName;

    /**
     * 客队名称
     */
    @NotEmpty
    private String guestName;

    /**
     * 联赛名称
     */
    @NotEmpty
    private String leagueName;

    /**
     * 赛事时间
     */
    @NotNull
    private Date matchTime;

    /**
     * 感兴趣人数
     */
    private Integer likeNum;


    /**
     * 0免费方案1专家方案
     */
    @NotNull
    private Integer type;

    /**
     * 玩法类型（1让球2总进球）
     */
    @NotNull
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
    @NotNull
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
     * 文章分析
     */
    private String content;

    /**
     * 支付二维码
     */
    private String payCode;

}
