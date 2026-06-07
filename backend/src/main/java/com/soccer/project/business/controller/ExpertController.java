package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.common.utils.StringUtils;
import com.soccer.common.utils.bean.BeanUtils;
import com.soccer.common.utils.file.FileUploadUtils;
import com.soccer.common.utils.file.MimeTypeUtils;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.framework.config.RuoYiConfig;
import com.soccer.project.business.entity.po.Expert;
import com.soccer.project.business.entity.vo.ExpertListReqVo;
import com.soccer.project.business.service.ExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import java.time.LocalDateTime;

/**
 * @author dylan
 * @description 专家控制器
 * @date 2025/4/4  23:53
 */
@RequestMapping("/business/expert")
@RestController
public class ExpertController {
    @Autowired
    private ExpertService expertService;

    /**
     * @author dylan
     * @description 查询列表并且分页
     * @date 2025/4/4  23:55
     */
    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<Expert>> selectByPage(@RequestBody PageRequest<ExpertListReqVo> pageRequest) {
        Page<Expert> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<Expert> pageResult = expertService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }


    /**
     * 头像上传
     */
    @Log(title = "专家头像", businessType = BusinessType.INSERT)
    @PostMapping("/uploadAvatar")
    public ResponseEntity<String> uploadAvatar(@RequestParam("avatarFile") MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            if (StringUtils.isNotEmpty(avatar)) {
                return ResponseEntity.success(avatar);
            }
        }
        return ResponseEntity.error(RespEnum.UPLOAD_FAIL);
    }


    /**
     * 添加专家
     */
    @Transactional
    @Log(title = "添加专家", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody @Valid Expert expert) throws Exception {
        if (StringUtils.isEmpty(expert.getName()) || StringUtils.isEmpty(expert.getHitText())
                || StringUtils.isEmpty(expert.getAvatar()) || expert.getContinueNum() == null
        ) {
            return ResponseEntity.error(RespEnum.COLUMN_CAN_NOT_BE_NULL);
        }
        //查看专家是否存在,如果存在修改。如果不存在添加
        Expert old=  expertService.getByName(expert.getName());
        if(old==null){
            expertService.save(expert);
        }else {
            LocalDateTime date=LocalDateTime.now();
            expert.setId(old.getId());
            expert.setStatus(0);
            expert.setUpdateTime(date);
            expert.setCreateTime(date);
            expertService.updateById(expert);
        }
        return ResponseEntity.success();
    }

    /**
     * 修改专家
     */

    @Log(title = "修改专家", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public ResponseEntity<Void> edit(@RequestBody @Valid Expert expert) throws Exception {
        if (expert.getId() == null) {
            return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        }

        expertService.updateById(expert);

        return ResponseEntity.success();
    }

}
