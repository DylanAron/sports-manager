package com.soccer.project.business.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

/**
 * 北单分组表
 * @TableName t_single_bag_group
 */
@Data
@TableName(value ="t_single_bag_group")
public class SingleBagGroup implements Serializable {
    /**
     * 自增主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 回报率
     */
    private String rateOfReturn;

    /**
     * 支付码
     */
    private String payCode;

    /**
     * 总场次
     */
    private Integer total;

    /**
     * 创建时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * -1已删除 0未发布1已发布
     */
    private Integer status;

    /**
     * 联赛名称集合（查询用）
     */
    private Object leagueNames;

    /**
     * 
     */
    private LocalDate matchDate;


}