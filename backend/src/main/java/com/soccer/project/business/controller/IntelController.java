package com.soccer.project.business.controller;

import com.soccer.common.domain.ResponseEntity;
import com.soccer.project.business.entity.po.Intel;
import com.soccer.project.business.service.IntelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author dylan
 * @description 情报控制器
 * @date 2025/4/7  23:24
 */
@RestController
@RequestMapping("/business/intel")
public class IntelController {
    @Autowired
    private IntelService intelService;

    /**
     * 按日期范围获取情报列表
     */
    @GetMapping("list")
    public ResponseEntity<List<Intel>> list(String startDate, String endDate) {
        List<Intel> list = intelService.getByDateRange(startDate, endDate);
        return ResponseEntity.success(list);
    }

    /**
     * 获取情报详情
     */
    @GetMapping("get")
    public ResponseEntity<Intel> get(Integer id) {
        Intel intel = intelService.getById(id);
        return ResponseEntity.success(intel);
    }

    /**
     * 更新情报
     */
    @PostMapping("update")
    public ResponseEntity<Void> update(@RequestBody Intel intel) {
        intelService.updateById(intel);
        return ResponseEntity.success();
    }

    /**
     * 新增情报
     */
    @PostMapping("add")
    public ResponseEntity<Void> add(@RequestBody Intel intel) {
        intelService.save(intel);
        return ResponseEntity.success();
    }
}
