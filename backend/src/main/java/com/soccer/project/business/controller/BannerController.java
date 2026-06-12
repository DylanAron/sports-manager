package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.project.business.entity.po.Banner;
import com.soccer.project.business.entity.vo.BannerListReqVo;
import com.soccer.project.business.service.BannerService;
import com.soccer.common.utils.StringUtils;
import com.soccer.common.utils.file.FileUploadUtils;
import com.soccer.common.utils.file.MimeTypeUtils;
import com.soccer.framework.config.RuoYiConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/business/banner")
@RestController
public class BannerController {

    @Autowired
    private BannerService bannerService;

    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<Banner>> selectByPage(@RequestBody PageRequest<BannerListReqVo> pageRequest) {
        Page<Banner> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<Banner> pageResult = bannerService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }

    @Log(title = "图片上传", businessType = BusinessType.UPDATE)
    @PostMapping("/uploadImage")
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            String path = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            if (StringUtils.isNotEmpty(path)) {
                return ResponseEntity.success(path);
            }
        }
        return ResponseEntity.error(RespEnum.UPLOAD_FAIL);
    }

    @Transactional
    @Log(title = "新增轮播图", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody Banner banner) {
        bannerService.save(banner);
        return ResponseEntity.success();
    }

    @Log(title = "修改轮播图", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public ResponseEntity<Void> edit(@RequestBody Banner banner) {
        if (banner.getId() == null) return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        bannerService.updateById(banner);
        return ResponseEntity.success();
    }

    @Log(title = "删除轮播图", businessType = BusinessType.DELETE)
    @PostMapping("/delete")
    public ResponseEntity<Void> delete(Integer id) {
        if (id == null) return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        bannerService.removeById(id);
        return ResponseEntity.success();
    }
}
