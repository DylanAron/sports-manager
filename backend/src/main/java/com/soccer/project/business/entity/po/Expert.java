package com.soccer.project.business.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 专家表
 *
 * @author dylan
 * @since 2025-04-04 23:45
 */
@Data
@TableName("t_expert")
public class Expert implements Serializable {

    /**
     * 行id 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 专家名称
     */
    private String name;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 命中描述（近10中9）
     */
    private String hitText;

    /**
     * 连红次数
     */
    private Integer continueNum;

    /**
     * 0未启用 1已生效 -1已删除
     */
    private Integer status;

    /**
     * 排序字段
     */
    private Integer sort;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime updateTime;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;
}
