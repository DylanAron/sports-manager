package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.project.business.entity.po.Score;
import com.soccer.project.business.entity.vo.ScoreListReqVo;
import com.soccer.project.business.service.ScoreService;
import com.soccer.common.utils.StringUtils;
import com.soccer.common.utils.file.FileUploadUtils;
import com.soccer.common.utils.file.MimeTypeUtils;
import com.soccer.framework.config.RuoYiConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/business/score")
@RestController
public class ScoreController {
    @Autowired
    private ScoreService scoreService;

    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<Score>> selectByPage(@RequestBody PageRequest<ScoreListReqVo> pageRequest) {
        Page<Score> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<Score> pageResult = scoreService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }

    @Transactional
    @Log(title = "添加比分", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody Score score) {
        scoreService.save(score);
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

    @Log(title = "修改比分", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public ResponseEntity<Void> edit(@RequestBody Score score) {
        if (score.getId() == null) return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        scoreService.updateById(score);
        return ResponseEntity.success();
    }

    @Log(title = "删除比分", businessType = BusinessType.DELETE)
    @PostMapping("/delete")
    public ResponseEntity<Void> delete(Integer id) {
        if (id == null) return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        scoreService.removeById(id);
        return ResponseEntity.success();
    }
}
