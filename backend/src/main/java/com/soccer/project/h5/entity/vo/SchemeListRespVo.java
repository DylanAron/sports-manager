package com.soccer.project.h5.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author dylan
 * @description 方案返回参数
 * @date 2025/4/13  13:27
 */
@Data
public class SchemeListRespVo implements Serializable {
    /**
     * 方案id
     */
    private Integer id;
    /**
     * 专家id
     */
    private Integer expertId;

    /**
     * 专家名称
     */
    private String expertName;

    /**
     * 专家头像
     */
    private String expertAvatar;

    /**
     * 命中文本
     */
    private String hitText;
    /**
     * 连红次数
     */
    private Integer  continueNum;

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
     * 0免费方案1专家方案
     */
    private Integer type;



    /**
     * 是否命中
     */
    private Integer isHit;

    /**
     * 推荐索引
     */
    private String recommendIndex;

}
