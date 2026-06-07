package com.soccer.project.h5.entity.vo.lightningsecret;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author dylan
 * @Description: h5北单接口参数返回模型
 * @Create: 2025/4/16 14:03
 */
@Data
public class H5SecretListVo implements Serializable {
    /**
     * 日期
     */
    private String matchDate;
    /**
     * 赛事数量
     */
    private Integer total;

    /**
     * 分组数据
     */
    private List<H5SecretGroupVo> group;
}
