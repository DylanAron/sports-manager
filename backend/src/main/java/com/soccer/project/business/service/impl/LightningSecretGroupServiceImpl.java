package com.soccer.project.business.service.impl;

import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.common.utils.StringUtils;
import com.soccer.common.utils.bean.BeanUtils;
import com.soccer.project.business.entity.po.LightningSecretGroup;
import com.soccer.project.business.entity.po.LightningSecretMatch;
import com.soccer.project.business.entity.vo.LightningSecretAddReqVo;
import com.soccer.project.business.entity.vo.LightningSecretEditReqVo;
import com.soccer.project.business.entity.vo.LightningSecretListReqVo;
import com.soccer.project.business.mapper.LightningSecretGroupMapper;
import com.soccer.project.business.mapper.LightningSecretMatchMapper;
import com.soccer.project.business.service.LightningSecretGroupService;
import com.soccer.project.h5.entity.vo.lightningsecret.H5SecretGroupVo;
import com.soccer.project.h5.entity.vo.lightningsecret.H5SecretListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Dell
 * @description 针对表【t_lightning_secret_group(闪电秘籍分组表)】的数据库操作Service实现
 * @createDate 2025-04-11 15:14:18
 */
@Service
public class LightningSecretGroupServiceImpl extends ServiceImpl<LightningSecretGroupMapper, LightningSecretGroup>
        implements LightningSecretGroupService {


    @Autowired
    private LightningSecretGroupMapper groupMapper;

    @Autowired
    private LightningSecretMatchMapper matchMapper;

    @Override
    public PageResp<LightningSecretGroup> selectByPage(Page<LightningSecretGroup> page, LightningSecretListReqVo params) {
        LambdaQueryWrapper<LightningSecretGroup> wrapper = new LambdaQueryWrapper<>();
        wrapper.ne(LightningSecretGroup::getStatus, -1);

        if (params.getMatchDate() != null) {

            wrapper.eq(LightningSecretGroup::getMatchDate, params.getMatchDate());
        }

        if (StringUtils.isNotEmpty(params.getLeagueName())) {
            wrapper.like(LightningSecretGroup::getLeagueNames, "%" + params.getLeagueName() + "%");
        }

        wrapper.orderByDesc(LightningSecretGroup::getCreateTime).orderByDesc(LightningSecretGroup::getStatus);

        Page<LightningSecretGroup> pageResult = groupMapper.selectPage(page, wrapper);

        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }

    @Transactional
    @Override
    public int add(LightningSecretAddReqVo request) {
        LightningSecretGroup group = BeanUtils.copyProperties(request, LightningSecretGroup.class);
        group.setTotal(request.getMatchList().size());

        //定义联赛名称集合
        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            Set<String> leagueNameSet = request.getMatchList().stream().map(LightningSecretMatch::getLeagueName).collect(Collectors.toSet());
            group.setLeagueNames(JSON.toJSONString(leagueNameSet));
        }
        groupMapper.insert(group);

        //插入完成之后，开始插入赛事信息
        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            for (LightningSecretMatch match : request.getMatchList()) {
                match.setGroupId(group.getId());
            }

            matchMapper.insertBatchSomeColumn(request.getMatchList());
        }
        return 1;
    }

    @Override
    public List<LightningSecretMatch> getMatchListByGroup(Integer groupId) {
        LambdaQueryWrapper<LightningSecretMatch> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(LightningSecretMatch::getGroupId, groupId);
        return matchMapper.selectList(wrapper);
    }

    @Transactional
    @Override
    public int update(LightningSecretEditReqVo request) {
        LightningSecretGroup group = BeanUtils.copyProperties(request, LightningSecretGroup.class);
        group.setTotal(request.getMatchList().size());

        int finishedNum = 0;
        //批量修改赛事，如果存在则修改，不存在则插入
        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            for (LightningSecretMatch match : request.getMatchList()) {
                if (StringUtils.isEmpty(match.getRecommendContent())) {
                    match.setRecommendContent(null);
                }
                if (match.getMatchStatus() == 1) {
                    finishedNum++;
                }
            }
            group.setFinished(finishedNum == request.getMatchList().size() ? 1 : 0);
        }
        //定义联赛名称集合
        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            Set<String> leagueNameSet = request.getMatchList().stream().map(LightningSecretMatch::getLeagueName).collect(Collectors.toSet());
            group.setLeagueNames(JSON.toJSONString(leagueNameSet));
        }
        groupMapper.updateById(group);

        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            matchMapper.insertOrUpdateBatch(request.getMatchList());
        }

        return 1;
    }

    @Override
    public List<H5SecretListVo> getListH5(Integer days) {
        List<LightningSecretGroup> groups = groupMapper.selectByDaysAgo(days);

        //根据分组id查询赛事信息
        if (CollectionUtils.isEmpty(groups)) {
            return Collections.emptyList();
        }
        List<Integer> groupIds = groups.stream().map(LightningSecretGroup::getId).collect(Collectors.toList());
        LambdaQueryWrapper<LightningSecretMatch> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(LightningSecretMatch::getGroupId, groupIds);
        List<LightningSecretMatch> matches = matchMapper.selectList(wrapper);

        //将groups分组
        Set<LocalDate> dateSet = groups.stream().map(LightningSecretGroup::getMatchDate).collect(Collectors.toSet());

        Map<LocalDate, List<LightningSecretGroup>> groupByDateMap = groups.stream().collect(Collectors.groupingBy((LightningSecretGroup::getMatchDate)));

        //创建返回数据集合模型
        List<H5SecretListVo> resultList = new ArrayList<>(dateSet.size());
        H5SecretListVo listVo;
        for (LocalDate date : dateSet) {
            listVo = new H5SecretListVo();
            listVo.setMatchDate(date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            //获取当前日期的分组id
            List<LightningSecretGroup> groupsList = groupByDateMap.get(date);

            //创建分组数据
            List<H5SecretGroupVo> groupVoList = new ArrayList<>(groupsList.size());
            //定义分组
            H5SecretGroupVo groupVo;
            int groupCount = groupsList.size();
            for (int i = 0; i < groupsList.size(); i++) {
                LightningSecretGroup group = groupsList.get(i);
                listVo.setTotal(listVo.getTotal() == null ? group.getTotal() : listVo.getTotal() + group.getTotal());
                groupVo = new H5SecretGroupVo();
                groupVo.setFinished(group.getFinished());
                groupVo.setTitle("第" + (groupCount - i) + "组");
                groupVo.setPayCode(group.getPayCode());
                List<LightningSecretMatch> filterList = matches.stream().filter(e -> e.getGroupId().equals(group.getId())).collect(Collectors.toList());
                filterList.sort(Comparator.comparing(LightningSecretMatch::getMatchTime).reversed());
                groupVo.setList(filterList);
                groupVoList.add(groupVo);
            }

            listVo.setGroup(groupVoList);

            resultList.add(listVo);
        }
        //倒序
        resultList.sort(Comparator.comparing(H5SecretListVo::getMatchDate).reversed());

        return resultList;
    }

}




