package com.soccer.project.business.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 情报配置表
 * @TableName t_intelligence
 */
@TableName(value ="t_intelligence")
@Data
public class Intel implements Serializable {

    /**
     * 主键自增
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 情报日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date intelDate;

    /**
     * 情报描述
     */
    private String content;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 创建时间
     */
    private Date createTime;
}
