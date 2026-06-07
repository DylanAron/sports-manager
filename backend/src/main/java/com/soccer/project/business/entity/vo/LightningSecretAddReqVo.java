package com.soccer.project.business.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.soccer.project.business.entity.po.LightningSecretMatch;
import lombok.Data;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

/**
 * @Author dylan
 * @Description: 闪电添加
 * @Create: 2025/4/10 15:37
 */
@Valid
@Data
public class LightningSecretAddReqVo implements Serializable {

    /**
     * 回报率
     */
    private String rateOfReturn;

    /**
     * 收款码
     */
    private String payCode;


    /**
     * 分组赛事时间
     */
    @NotNull(message = "分组赛事时间不能为空")
    @JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
    private LocalDate matchDate;

    /**
     * 赛事集合
     */
    private List<LightningSecretMatch> matchList;

}
