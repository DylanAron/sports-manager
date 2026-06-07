package com.soccer.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @auth: gp
 * @Desc:
 * @Time: 2023/6/2
 */
@AllArgsConstructor
@Getter
public enum RespEnum implements ResultCode {
    SUCCESS(200, "请求成功"),

    SYSTEM_ERROR(400, "系统异常"),

    UNAUTHORIZED(401,"未登录,请先登录"),

    LOCK_FAIL(402,"加锁失败"),

    UPLOAD_FAIL(403,"图片上传失败"),

    COLUMN_CAN_NOT_BE_NULL(411,"字段不能为空"),

    ID_CAN_NOT_BE_NULL(412,"id不能为空")
        ;

    private Integer code;

    private String message;

    @Override
    public int code() {
        return code;
    }

    @Override
    public String message() {
        return message;
    }}
