package com.soccer.project.business.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import lombok.Data;

/**
 * 闪电秘籍分组表
 * @TableName t_lightning_secret_group
 */
@TableName(value ="t_lightning_secret_group")
@Data
public class LightningSecretGroup implements Serializable {
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
     * 总场次
     */
    private Integer total;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * -1已删除 0未发布1已发布
     */
    private Integer status;

    /**
     * 收款码
     */
    private String payCode;


    /**
     * 联赛名称集合（查询用）
     */
    private String leagueNames;

    /**
     * 全部完场
     */
    private Integer finished;

    /**
     * 
     */
    private LocalDate matchDate;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}