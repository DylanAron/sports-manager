package com.soccer.project.business.entity.vo;

import lombok.Data;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @Author dylan
 * @Description: 修改状态
 * @Create: 2025/4/10 15:37
 */
@Valid
@Data
public class UpdateStatusReqVo implements Serializable {

    /**
     * 分组id
     */
    @NotNull(message = "id不能为空")
    private Integer id;

    /**
     * 修改状态 0未发布 1已发布 -1已删除
     */
    @NotNull(message = "状态不能为空")
    private Integer status;
}
