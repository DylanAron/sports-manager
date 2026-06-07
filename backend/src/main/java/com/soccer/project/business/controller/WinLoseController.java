package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.common.utils.StringUtils;
import com.soccer.common.utils.file.FileUploadUtils;
import com.soccer.common.utils.file.MimeTypeUtils;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.framework.config.RuoYiConfig;
import com.soccer.project.business.entity.po.WinLose;
import com.soccer.project.business.entity.vo.WinLoseListReqVo;
import com.soccer.project.business.service.WinLoseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/business/winlose")
@RestController
public class WinLoseController {
    @Autowired
    private WinLoseService winLoseService;

    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<WinLose>> selectByPage(@RequestBody PageRequest<WinLoseListReqVo> pageRequest) {
        Page<WinLose> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<WinLose> pageResult = winLoseService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
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

    @Transactional
    @Log(title = "添加胜负", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody WinLose winLose) {
        winLoseService.save(winLose);
        return ResponseEntity.success();
    }

    @Log(title = "修改胜负", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public ResponseEntity<Void> edit(@RequestBody WinLose winLose) {
        if (winLose.getId() == null) {
            return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        }
        winLoseService.updateById(winLose);
        return ResponseEntity.success();
    }

    @Log(title = "删除胜负", businessType = BusinessType.DELETE)
    @PostMapping("/delete")
    public ResponseEntity<Void> delete(Integer id) {
        if (id == null) {
            return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        }
        winLoseService.removeById(id);
        return ResponseEntity.success();
    }
}
