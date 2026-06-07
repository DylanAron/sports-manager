package com.soccer.project.h5.entity.vo.koiFish;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * @Author dylan
 * @Description: 获取竞足列表
 * @Create: 2025/4/19 9:52
 */
@Data
public class H5KoiFishListReqVo implements Serializable {
    /**
     * 创建日期
     */
    @JsonFormat(shape =JsonFormat.Shape.STRING,   pattern = "yyyy-MM-dd")
    private LocalDate matchDate ;

}
