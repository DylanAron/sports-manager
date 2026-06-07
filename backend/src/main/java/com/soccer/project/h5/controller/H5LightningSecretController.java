package com.soccer.project.h5.controller;

import com.soccer.common.domain.ResponseEntity;
import com.soccer.project.business.service.LightningSecretGroupService;
import com.soccer.project.h5.entity.vo.lightningsecret.H5SecretListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.constraints.NotNull;
import java.util.List;

/**
 * @author dylan
 * @description 闪电接口
 * @date 2025/4/9  21:11
 */
@RequestMapping("/h5/lightningSecret")
@RestController
public class H5LightningSecretController {
    @Autowired
    private LightningSecretGroupService groupService;



    /**
     * @author dylan
     * @description 查询列表
     * @date 2025/4/4  23:55
     */
    @GetMapping("getList/{days}")
    public ResponseEntity<List<H5SecretListVo>> getListH5(@PathVariable @NotNull(message = "天数不能为空") Integer days) {
        List<H5SecretListVo> result = groupService.getListH5(days);
        return ResponseEntity.success(result);
    }

}
