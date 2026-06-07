package com.soccer.project.business.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author dylan
 * @description: 分页查询专家请求参数
 * @date 2025/4/5  21:18
 */
@Data
public class BIllListReqVo implements Serializable {

    /**
     * 搜索日期
     */
    @JsonFormat(shape =JsonFormat.Shape.STRING,   pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime date;
}
