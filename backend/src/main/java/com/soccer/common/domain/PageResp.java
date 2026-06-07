package com.soccer.common.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/***
 * @author dylan
 * @description 分页返回数据模型
 * @date 2025/4/5  19:59
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageResp<R> implements Serializable {

    /**
     * 总数
     */
    private long total;

    /**
     * 返回数据集合
     */
    private List<R> list;


}
