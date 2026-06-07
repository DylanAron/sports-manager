package com.soccer.project.business.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.soccer.project.business.entity.po.LightningSecretMatch;
import com.soccer.project.business.entity.po.SingleBagMatch;
import lombok.Data;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

/**
 * @Author dylan
 * @Description: 闪电秘籍修改
 * @Create: 2025/4/10 15:37
 */
@Valid
@Data
public class LightningSecretEditReqVo implements Serializable {

    /**
     * 分组id
     */
    private Integer id;

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
    @NotEmpty(message = "赛事集合不能为空")
    private List<LightningSecretMatch> matchList;

}
