package com.soccer.project.business.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.soccer.project.business.entity.po.SingleBagMatch;
import lombok.Data;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

/**
 * @Author dylan
 * @Description: 北单修改
 * @Create: 2025/4/10 15:37
 */
@Valid
@Data
public class SingleBagEditReqVo implements Serializable {

    /**
     * 分组id
     */
    private Integer id;

    /**
     * 分组赛事时间
     */
    @NotNull(message = "分组赛事时间不能为空")
    @JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
    private LocalDate matchDate;

    /**
     * 支付码
     */
    private String  payCode;

    /**
     * 赛事集合
     */
    private List<SingleBagMatch> matchList;

}
