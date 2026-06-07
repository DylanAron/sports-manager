package com.soccer.project.business.entity.vo;

import lombok.Data;

import jakarta.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @author dylan
 * @description: 分页查询专家请求参数
 * @date 2025/4/5  21:18
 */
@Data
public class SchemeListReqVo implements Serializable {

    /**
     * 专家id
     */
    private Integer expertId;

    /**
     * 联赛名称
     */
    private String leagueName;

    /**
     * 方案类型 0免费方案 1 专家方案
     */
    @NotNull
    private Integer type;
}
