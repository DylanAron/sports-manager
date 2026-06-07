package com.soccer.project.h5.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.project.business.entity.po.Scheme;
import com.soccer.project.business.service.SchemeService;
import com.soccer.project.h5.entity.vo.SchemeListReqVo;
import com.soccer.project.h5.entity.vo.SchemeListRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.constraints.NotNull;

/**
 * @author dylan
 * @description 方案控制器
 * @date 2025/4/13  13:23
 */
@RestController
@RequestMapping("h5/scheme")
public class H5SchemeController {
    @Autowired
    private SchemeService schemeService;

    /**
     * @author dylan
     * @description 查询列表并且分页
     * @date 2025/4/4  23:55
     */
    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<SchemeListRespVo>> selectByPage(@RequestBody PageRequest<SchemeListReqVo> pageRequest) {
        Page<SchemeListRespVo> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        Scheme scheme = new Scheme();
        scheme.setType(pageRequest.getData().getType());

        Page<SchemeListRespVo> pageInfo = schemeService.selectH5ByPage(page, scheme);
        PageResp<SchemeListRespVo> pageResp = new PageResp<>();
        pageResp.setList(pageInfo.getRecords());
        pageResp.setTotal(pageInfo.getTotal());
        return ResponseEntity.success(pageResp);
    }


    /**
     * @Author dylan
     * @Description: 根据id查询详情信息
     * @Create: 2025/4/14 11:38
     */
    @GetMapping("getById/{id}")
    public ResponseEntity<Scheme> getById(@PathVariable @NotNull(message = "id不能为空") Integer id) {
        Scheme scheme = schemeService.getById(id);
        if(scheme.getType()==1){
            scheme.setOddsList(null);
            scheme.setBallNum(null);
            scheme.setIsHit(null);
        }
        return ResponseEntity.success(scheme);
    }
}
