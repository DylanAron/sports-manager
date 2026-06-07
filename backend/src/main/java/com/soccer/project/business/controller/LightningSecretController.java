package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.utils.bean.BeanUtils;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.project.business.entity.po.LightningSecretGroup;
import com.soccer.project.business.entity.po.LightningSecretMatch;
import com.soccer.project.business.entity.po.SingleBagGroup;
import com.soccer.project.business.entity.po.SingleBagMatch;
import com.soccer.project.business.entity.vo.*;
import com.soccer.project.business.service.LightningSecretGroupService;
import com.soccer.project.business.service.SingleBagGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.constraints.NotNull;
import java.util.List;

/**
 * @author dylan
 * @description 闪电接口
 * @date 2025/4/9  21:11
 */
@RequestMapping("/business/lightningSecret")
@RestController
public class LightningSecretController {
    @Autowired
    private LightningSecretGroupService groupService;


    /**
     * @author dylan
     * @description 查询列表并且分页
     * @date 2025/4/4  23:55
     */
    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<LightningSecretGroup>> selectByPage(@RequestBody PageRequest<LightningSecretListReqVo> pageRequest) {
        Page<LightningSecretGroup> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<LightningSecretGroup> pageResult = groupService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }


    /**
     * 添加
     */
    @Log(title = "添加闪电秘籍", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody @Validated LightningSecretAddReqVo request) throws Exception {

        groupService.add(request);

        return ResponseEntity.success();
    }


    /**
     * 获取分组详情赛事
     */
    @GetMapping("/getMatchListByGroup/{groupId}")
    public ResponseEntity<List<LightningSecretMatch>> getMatchListByGroup(@PathVariable @NotNull(message = "分组id不能为空") Integer groupId) throws Exception {

        List<LightningSecretMatch> matchList = groupService.getMatchListByGroup(groupId);

        return ResponseEntity.success(matchList);
    }


    /**
     * 修改
     */
    @Log(title = "修改闪电秘籍", businessType = BusinessType.UPDATE)
    @PostMapping("update")
    public ResponseEntity<Void> update(@RequestBody @Validated LightningSecretEditReqVo request) throws Exception {

        groupService.update(request);

        return ResponseEntity.success();
    }


    /**
     * 添加专家
     */
    @Log(title = "修改北单的状态", businessType = BusinessType.UPDATE)
    @PostMapping("updateStatus")
    public ResponseEntity<Void> updateStatus(@RequestBody @Validated UpdateStatusReqVo request) throws Exception {
        LightningSecretGroup entity = BeanUtils.copyProperties(request, LightningSecretGroup.class);

        groupService.updateById(entity);

        return ResponseEntity.success();
    }

}
