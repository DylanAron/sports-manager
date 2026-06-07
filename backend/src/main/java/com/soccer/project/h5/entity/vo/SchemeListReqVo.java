package com.soccer.project.h5.entity.vo;

import lombok.Data;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;
/**
 * @author dylan
 * @description 方案查询请求参数
 * @date 2025/4/13  13:25
 */
@Valid
@Data
public class SchemeListReqVo implements Serializable {

    @NotNull(message = "方案类型不能为空")
    private Integer type;

}
