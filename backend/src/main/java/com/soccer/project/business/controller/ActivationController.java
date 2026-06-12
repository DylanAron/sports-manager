package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.project.business.entity.po.AppActivation;
import com.soccer.project.business.entity.vo.ActivationListReqVo;
import com.soccer.project.business.service.AppActivationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/business/activation")
@RestController
public class ActivationController {

    @Autowired
    private AppActivationService appActivationService;

    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<AppActivation>> selectByPage(@RequestBody PageRequest<ActivationListReqVo> pageRequest) {
        Page<AppActivation> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<AppActivation> pageResult = appActivationService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }

    @Log(title = "删除激活记录", businessType = BusinessType.DELETE)
    @PostMapping("/delete")
    public ResponseEntity<Void> delete(Integer id) {
        if (id == null) return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        appActivationService.removeById(id);
        return ResponseEntity.success();
    }
}
