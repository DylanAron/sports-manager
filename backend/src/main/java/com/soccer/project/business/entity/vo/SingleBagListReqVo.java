package com.soccer.project.business.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.validation.annotation.Validated;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * 北单 列表请求参数
 */
@Validated
@Data
public class SingleBagListReqVo implements Serializable {
    /**
     * 创建日期
     */
    @JsonFormat(shape =JsonFormat.Shape.STRING,   pattern = "yyyy-MM-dd")
    private LocalDate matchDate ;

    /**
     * 联赛名称
     */
    private String  leagueName;
}
