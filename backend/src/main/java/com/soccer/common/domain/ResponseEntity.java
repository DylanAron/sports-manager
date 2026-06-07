package com.soccer.common.domain;

import com.soccer.common.enums.RespEnum;
import com.soccer.common.enums.ResultCode;
import lombok.Data;

import java.io.Serializable;

/**
 * @auth: dylan
 * @Desc:
 * @Time: 2023/6/2
 */
@Data
public class ResponseEntity<T> implements Serializable {

    private Integer code;

    private String message;

    private T data;


    public static <T> ResponseEntity<T> success() {
        ResponseEntity resp = new ResponseEntity<>();
        resp.setCode(RespEnum.SUCCESS.getCode());
        resp.setMessage(RespEnum.SUCCESS.getMessage());
        return resp;
    }
    public static <T> ResponseEntity<T> success(T data) {
        ResponseEntity resp = new ResponseEntity<>();
        resp.setCode(RespEnum.SUCCESS.getCode());
        resp.setMessage(RespEnum.SUCCESS.getMessage());
        resp.setData(data);
        return resp;
    }


    public static <T> ResponseEntity<T> error(ResultCode resultCode) {
        ResponseEntity resp = new ResponseEntity<>();
        resp.setCode(resultCode.code());
        resp.setMessage(resultCode.message());
        return resp;
    }

    public static <T> ResponseEntity<T> error(ResultCode resultCode, T data) {
        ResponseEntity resp = new ResponseEntity<>();
        resp.setCode(resultCode.code());
        resp.setMessage(resultCode.message());
        resp.setData(data);
        return resp;
    }
    public static <T> ResponseEntity<T> error(Integer code ,String message) {
        ResponseEntity resp = new ResponseEntity<>();
        resp.setCode(code);
        resp.setMessage(message);
        return resp;
    }
}
