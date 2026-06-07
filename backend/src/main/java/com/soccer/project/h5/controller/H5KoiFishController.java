package com.soccer.project.h5.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soccer.common.domain.ResponseEntity;
import com.soccer.common.enums.RespEnum;
import com.soccer.project.business.entity.po.KoiFishGroup;
import com.soccer.project.business.entity.po.KoiFishMatch;
import com.soccer.project.business.service.KoiFishGroupService;
import com.soccer.project.business.service.KoiFishMatchService;
import com.soccer.project.h5.entity.vo.koiFish.H5KoiFishListReqVo;
import com.soccer.project.h5.entity.vo.koiFish.H5KoiFishListRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author dylan
 * @description 锦鲤扫盘接口
 * @date 2025/4/9  21:11
 */
@RequestMapping("/h5/koiFish")
@RestController
public class H5KoiFishController {
    @Autowired
    private KoiFishMatchService koiFishMatchService;
    @Autowired
    private KoiFishGroupService groupService;

    /**
     * @author dylan
     * @description 查询列表
     * @date 2025/4/4  23:55
     */
    @PostMapping("getList")
    public ResponseEntity<H5KoiFishListRespVo> selectByPage(@RequestBody H5KoiFishListReqVo request) {
        List<KoiFishMatch> list = koiFishMatchService.getH5List(request);
        H5KoiFishListRespVo resp = new H5KoiFishListRespVo();
        resp.setList(list);
        resp.setCount(list.size());
        resp.setHitRate(0);
        if (CollectionUtils.isEmpty(list)) {
            return ResponseEntity.success(resp);
        }

        //统计命中场次
        List<KoiFishMatch> hitList = list.stream().filter(e -> e.getIsHit() == 1).collect(Collectors.toList());
        if (!hitList.isEmpty()) {
            int hitRate = new BigDecimal(hitList.size()).divide(new BigDecimal(resp.getCount())).multiply(new BigDecimal(100)).intValue();
            resp.setHitRate(hitRate);
        }
        return ResponseEntity.success(resp);
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

}
