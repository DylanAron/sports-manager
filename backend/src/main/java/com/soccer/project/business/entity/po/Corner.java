package com.soccer.project.business.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@TableName(value ="t_corner")
@Data
public class Corner implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String leagueName;
    private String leagueLogo;
    private String homeName;
    private String homeLogo;
    private String awayName;
    private String awayLogo;
    private String recommendContent;
    private String result;
    private Integer isTodayData;
    private Integer isHit;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime matchDate;
    private static final long serialVersionUID = 1L;
}
