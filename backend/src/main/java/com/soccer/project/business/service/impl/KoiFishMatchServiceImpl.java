package com.soccer.project.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.common.utils.StringUtils;
import com.soccer.project.business.entity.po.KoiFishMatch;
import com.soccer.project.business.entity.vo.KoiFishListReqVo;
import com.soccer.project.business.mapper.KoiFishMatchMapper;
import com.soccer.project.business.service.KoiFishMatchService;
import com.soccer.project.h5.entity.vo.koiFish.H5KoiFishListReqVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Dell
 * @description 针对表【t_koi_fish_match(闪电秘籍赛事表)】的数据库操作Service实现
 * @createDate 2025-04-11 16:28:17
 */
@Service
public class KoiFishMatchServiceImpl extends ServiceImpl<KoiFishMatchMapper, KoiFishMatch>
        implements KoiFishMatchService {

    @Autowired
    private KoiFishMatchMapper koiFishMatchMapper;

    @Override
    public PageResp<KoiFishMatch> selectByPage(Page<KoiFishMatch> page, KoiFishListReqVo params) {
        LambdaQueryWrapper<KoiFishMatch> wrapper = new LambdaQueryWrapper<>();
        wrapper.ne(KoiFishMatch::getStatus, -1);
        if (params.getMatchDate() != null) {
            wrapper.eq(KoiFishMatch::getMatchDate, params.getMatchDate());
//            LocalDateTime begin = DateUtils.getBegin(params.getMatchDate());
//            LocalDateTime last = DateUtils.getLast(params.getMatchDate());
//            wrapper.between(KoiFishMatch::getCreateTime,begin,last);
        }

        if (StringUtils.isNotEmpty(params.getLeagueName())) {
            wrapper.like(KoiFishMatch::getLeagueName, "%" + params.getLeagueName() + "%");
        }

        wrapper.orderByDesc(KoiFishMatch::getCreateTime).orderByDesc(KoiFishMatch::getStatus);

        Page<KoiFishMatch> pageResult = koiFishMatchMapper.selectPage(page, wrapper);

        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());

    }

    @Override
    public List<KoiFishMatch> getH5List(H5KoiFishListReqVo request) {
        LambdaQueryWrapper<KoiFishMatch> wrapper = new LambdaQueryWrapper<>();
        wrapper.ne(KoiFishMatch::getStatus, -1);
        wrapper.eq(KoiFishMatch::getMatchDate, request.getMatchDate());
        wrapper.orderByDesc(KoiFishMatch::getMatchTime);
        return koiFishMatchMapper.selectList(wrapper);
    }
}




