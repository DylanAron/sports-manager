package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.project.business.entity.po.Corner;
import com.soccer.project.business.entity.vo.CornerListReqVo;
import com.soccer.project.business.service.CornerService;
import com.soccer.common.utils.StringUtils;
import com.soccer.common.utils.file.FileUploadUtils;
import com.soccer.common.utils.file.MimeTypeUtils;
import com.soccer.framework.config.RuoYiConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/business/corner")
@RestController
public class CornerController {
    @Autowired
    private CornerService cornerService;

    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<Corner>> selectByPage(@RequestBody PageRequest<CornerListReqVo> pageRequest) {
        Page<Corner> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<Corner> pageResult = cornerService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }

    @Transactional
    @Log(title = "添加角球", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody Corner corner) {
        cornerService.save(corner);
        return ResponseEntity.success();
    }

    @Log(title = "图片上传", businessType = BusinessType.INSERT)
    @PostMapping("/uploadImage")
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            String path = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            if (StringUtils.isNotEmpty(path)) {
                return ResponseEntity.success(path);
            }
        }
        return ResponseEntity.error(RespEnum.UPLOAD_FAIL);
    }

    @Log(title = "修改角球", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public ResponseEntity<Void> edit(@RequestBody Corner corner) {
        if (corner.getId() == null) return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        cornerService.updateById(corner);
        return ResponseEntity.success();
    }

    @Log(title = "删除角球", businessType = BusinessType.DELETE)
    @PostMapping("/delete")
    public ResponseEntity<Void> delete(Integer id) {
        if (id == null) return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        cornerService.removeById(id);
        return ResponseEntity.success();
    }
}
