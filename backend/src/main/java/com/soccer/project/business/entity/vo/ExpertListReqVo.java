package com.soccer.project.business.entity.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author dylan
 * @description: 分页查询专家请求参数
 * @date 2025/4/5  21:18
 */
@Data
public class ExpertListReqVo implements Serializable {

    /**
     * 搜索文本内容
     */
    private String searchText;
}
