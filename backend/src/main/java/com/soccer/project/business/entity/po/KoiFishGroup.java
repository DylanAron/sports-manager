package com.soccer.project.business.entity.po;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.time.LocalDate;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 锦鲤扫盘分组表
 * @TableName t_koi_fish_group
 */
@TableName(value ="t_koi_fish_group")
@Data
public class KoiFishGroup {
    /**
     * id自增
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 二维码
     */
    private String payCode;

    /**
     * 日期
     */

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate matchDate;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 创建时间
     */
    private Date createTime;
}