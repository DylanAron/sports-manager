package com.soccer.project.h5.entity.vo.koiFish;

import com.soccer.project.business.entity.po.KoiFishMatch;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Author dylan
 * @Description: 锦鲤扫盘列表返回参数模型
 * @Create: 2025/4/19 10:39
 */
@Data
public class H5KoiFishListRespVo implements Serializable {

    /**
     * 命中率
     */
    private Integer hitRate;
    /**
     * 总场次
     */
    private Integer count;

    /**
     * 赛事列表
     */
    private List<KoiFishMatch> list;
}
