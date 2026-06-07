package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.utils.bean.BeanUtils;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.project.business.entity.po.SingleBagGroup;
import com.soccer.project.business.entity.po.SingleBagMatch;
import com.soccer.project.business.entity.vo.*;
import com.soccer.project.business.service.SingleBagGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.constraints.NotNull;
import java.util.List;

/**
 * @author dylan
 * @description 北单接口
 * @date 2025/4/9  21:11
 */
@RequestMapping("/business/singleBag")
@RestController
public class SingleBagController {
    @Autowired
    private SingleBagGroupService singleBagGroupService;


    /**
     * @author dylan
     * @description 查询列表并且分页
     * @date 2025/4/4  23:55
     */
    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<SingleBagGroup>> selectByPage(@RequestBody PageRequest<SingleBagListReqVo> pageRequest) {
        Page<SingleBagGroup> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<SingleBagGroup> pageResult = singleBagGroupService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }


    /**
     * 添加北单锦囊
     */
    @Log(title = "添加北单锦囊", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody @Validated SingleBagAddReqVo request) throws Exception {

        singleBagGroupService.add(request);

        return ResponseEntity.success();
    }


    /**
     * 获取分组详情赛事
     */
    @GetMapping("/getMatchListByGroup/{groupId}")
    public ResponseEntity<List<SingleBagMatch>> getMatchListByGroup(@PathVariable @NotNull(message = "分组id不能为空") Integer groupId) throws Exception {

        List<SingleBagMatch> matchList = singleBagGroupService.getMatchListByGroup(groupId);

        return ResponseEntity.success(matchList);
    }


    /**
     * 添加专家
     */
    @Log(title = "修改北单锦囊", businessType = BusinessType.UPDATE)
    @PostMapping("update")
    public ResponseEntity<Void> update(@RequestBody @Validated SingleBagEditReqVo request) throws Exception {

        singleBagGroupService.update(request);

        return ResponseEntity.success();
    }


    /**
     * 添加专家
     */
    @Log(title = "修改北单的状态", businessType = BusinessType.UPDATE)
    @PostMapping("updateStatus")
    public ResponseEntity<Void> updateStatus(@RequestBody @Validated UpdateStatusReqVo request) throws Exception {
        SingleBagGroup entity = BeanUtils.copyProperties(request, SingleBagGroup.class);

        singleBagGroupService.updateById(entity);

        return ResponseEntity.success();
    }

}
