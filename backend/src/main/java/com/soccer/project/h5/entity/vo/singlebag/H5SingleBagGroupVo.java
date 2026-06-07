package com.soccer.project.h5.entity.vo.singlebag;

import com.soccer.project.business.entity.po.SingleBagMatch;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author dylan
 * @Description: 分组数据 第机组
 * @Create: 2025/4/16 14:08
 */
@Data
public class H5SingleBagGroupVo implements Serializable {

    private String title;

    private String payCode;

    private List<SingleBagMatch> list;
}
