package com.soccer.project.h5.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.project.business.entity.po.Expert;
import com.soccer.project.business.service.ExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author dylan
 * @description 专家控制器
 * @date 2025/4/4  23:53
 */
@RequestMapping("/h5/expert")
@RestController
public class H5ExpertController {
    @Autowired
    private ExpertService expertService;

    /**
     * @author dylan
     * @description 查询列表并且分页
     * @date 2025/4/4  23:55
     */
    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<Expert>> selectByPage(@RequestBody PageRequest<Void> pageRequest) {
        Page<Expert> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        LambdaQueryWrapper<Expert> wrapper=new LambdaQueryWrapper<>();
        wrapper.ne(Expert::getStatus,-1);
        wrapper.orderByAsc(Expert::getSort);

        Page<Expert> pageInfo = expertService.page(page,wrapper);
        PageResp<Expert> pageResp=new PageResp<>();
        pageResp.setList(pageInfo.getRecords());
        pageResp.setTotal(pageInfo.getTotal());
        return ResponseEntity.success(pageResp);
    }

}
