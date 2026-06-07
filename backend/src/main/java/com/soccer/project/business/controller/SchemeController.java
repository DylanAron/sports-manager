package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.project.business.entity.po.Scheme;
import com.soccer.project.business.entity.vo.SchemeAddReqVo;
import com.soccer.project.business.entity.vo.SchemeListReqVo;
import com.soccer.project.business.service.SchemeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

/**
 * @author dylan
 * @description 方案控制器
 * @date 2025/4/6  14:44
 */
@RestController
@RequestMapping("/business/scheme")
public class SchemeController {
    @Autowired
    private SchemeService schemeService;

    /**
     * @author dylan
     * @description 查询列表并且分页
     * @date 2025/4/4  23:55
     */
    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<Scheme>> selectByPage(@RequestBody PageRequest<SchemeListReqVo> pageRequest) {
        Page<Scheme> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<Scheme> pageResult = schemeService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }


    /**
     * 添加专家
     */
    @Log(title = "添加方案", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody @Valid SchemeAddReqVo requestVo) throws Exception {

        Scheme scheme = new Scheme();
        //数据转换
        BeanUtils.copyProperties(requestVo,scheme);

        schemeService.save(scheme);

        return ResponseEntity.success();
    }

    /**
     * 修改专家
     */
    @Log(title = "修改方案", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public ResponseEntity<Void> edit(@RequestBody @Valid Scheme scheme) throws Exception {
        if (scheme.getId() == null) {
            return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        }

        schemeService.updateById(scheme);

        return ResponseEntity.success();
    }
}
