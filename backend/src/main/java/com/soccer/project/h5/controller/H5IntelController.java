package com.soccer.project.h5.controller;

import com.soccer.common.domain.ResponseEntity;
import com.soccer.project.business.entity.po.Intel;
import com.soccer.project.business.service.IntelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author dylan
 * @description: 情报数据控制器
 * @date 2025/4/14  20:32
 */
@RequestMapping("/h5/intel")
@RestController
public class H5IntelController {
    @Autowired
    private IntelService intelService;

    @GetMapping("list")
    public ResponseEntity<List<Intel>> list(String startDate, String endDate) {
        List<Intel> list = intelService.getByDateRange(startDate, endDate);
        return ResponseEntity.success(list);
    }
}
