package com.soccer.project.business.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soccer.common.domain.PageRequest;
import com.soccer.common.domain.PageResp;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.common.utils.bean.BeanUtils;
import com.soccer.framework.aspectj.lang.annotation.Log;
import com.soccer.framework.aspectj.lang.enums.BusinessType;
import com.soccer.project.business.entity.po.KoiFishGroup;
import com.soccer.project.business.entity.po.KoiFishMatch;
import com.soccer.project.business.entity.vo.*;
import com.soccer.project.business.service.KoiFishGroupService;
import com.soccer.project.business.service.KoiFishMatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.constraints.NotNull;
import java.util.List;

/**
 * @author dylan
 * @description 锦鲤扫盘接口
 * @date 2025/4/9  21:11
 */
@RequestMapping("/business/koiFish")
@RestController
public class KoiFishController {
    @Autowired
    private KoiFishMatchService koiFishMatchService;

    @Autowired
    private KoiFishGroupService  groupService;

    /**
     * @author dylan
     * @description 查询列表并且分页
     * @date 2025/4/4  23:55
     */
    @PostMapping("selectByPage")
    public ResponseEntity<PageResp<KoiFishMatch>> selectByPage(@RequestBody PageRequest<KoiFishListReqVo> pageRequest) {
        Page<KoiFishMatch> page = new Page<>(pageRequest.getPageNum(), pageRequest.getPageSize());
        PageResp<KoiFishMatch> pageResult = koiFishMatchService.selectByPage(page, pageRequest.getData());
        return ResponseEntity.success(pageResult);
    }

    /**
     * 添加专家
     */
    @Log(title = "添加赛事", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody @Validated KoiFishMatch request) throws Exception {

        koiFishMatchService.save(request);

        return ResponseEntity.success();
    }

    /**
     * 修改赛事
     */
    @Log(title = "修改赛事", businessType = BusinessType.INSERT)
    @PostMapping("/update")
    public ResponseEntity<Void> update(@RequestBody @Validated KoiFishMatch request) throws Exception {
        if(request.getCreateTime()==null){
            return ResponseEntity.error(RespEnum.ID_CAN_NOT_BE_NULL);
        }
        koiFishMatchService.updateById(request);

        return ResponseEntity.success();
    }


    /**
     * 修改状态
     */
    @Log(title = "修改状态", businessType = BusinessType.UPDATE)
    @PostMapping("updateStatus")
    public ResponseEntity<Void> updateStatus(@RequestBody @Validated UpdateStatusReqVo request) throws Exception {
        KoiFishMatch entity = BeanUtils.copyProperties(request, KoiFishMatch.class);

        koiFishMatchService.updateById(entity);

        return ResponseEntity.success();
    }


    /**
     * @author dylan
     * @description 查询
     * @date 2025/4/4  23:55
     */
    @PostMapping("getPayCode")
    public ResponseEntity<KoiFishGroup> getPayCode(@RequestBody KoiFishGroup  request) {
        if(request.getMatchDate()==null){
            return ResponseEntity.error(RespEnum.COLUMN_CAN_NOT_BE_NULL);
        }
        LambdaQueryWrapper<KoiFishGroup> wrapper=new LambdaQueryWrapper<>();
        wrapper.eq(KoiFishGroup::getMatchDate,request.getMatchDate());
        KoiFishGroup entity = groupService.getOne(wrapper);
        return ResponseEntity.success(entity);
    }


    /**
     * @author dylan
     * @description 查询列表并且分页
     * @date 2025/4/4  23:55
     */
    @PostMapping("editGroup")
    public ResponseEntity<?> editGroup(@RequestBody KoiFishGroup  request) {
        if(request.getMatchDate()==null){
            return ResponseEntity.error(RespEnum.COLUMN_CAN_NOT_BE_NULL);
        }
        if(request.getId()==null){
            groupService.save(request);
        }else {
            groupService.updateById(request);
        }
        return ResponseEntity.success();
    }

}
