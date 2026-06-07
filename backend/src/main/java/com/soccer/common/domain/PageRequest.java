package com.soccer.common.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * @author dylan
 * @description  分页请求参数
 * @date 2025/4/5  19:56
 */
@Data
public class PageRequest<T> implements Serializable {
    /**
     * 页码
     */
    private long  pageNum;

    /**
     * 每页数量
     */
    private long  pageSize;

    /**
     * 请求参数
     */
    private T data;

}
