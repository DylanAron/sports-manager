package com.soccer.project.business.service.impl;

import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soccer.common.domain.PageResp;
import com.soccer.common.utils.StringUtils;
import com.soccer.common.utils.bean.BeanUtils;
import com.soccer.project.business.entity.po.SingleBagGroup;
import com.soccer.project.business.entity.po.SingleBagMatch;
import com.soccer.project.business.entity.vo.SingleBagAddReqVo;
import com.soccer.project.business.entity.vo.SingleBagEditReqVo;
import com.soccer.project.business.entity.vo.SingleBagListReqVo;
import com.soccer.project.business.mapper.SingleBagGroupMapper;
import com.soccer.project.business.mapper.SingleBagMatchMapper;
import com.soccer.project.business.service.SingleBagGroupService;
import com.soccer.project.h5.entity.vo.singlebag.H5SingleBagGroupVo;
import com.soccer.project.h5.entity.vo.singlebag.H5SingleBagListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author dylan
 * @Description: 北单业务实现类
 * @Create: 2025/4/11 13:48
 */
@Service
public class SingleBagGroupServiceImpl extends ServiceImpl<SingleBagGroupMapper, SingleBagGroup> implements SingleBagGroupService {
    @Autowired
    private SingleBagGroupMapper groupMapper;

    @Autowired
    private SingleBagMatchMapper matchMapper;

    @Override
    public PageResp<SingleBagGroup> selectByPage(Page<SingleBagGroup> page, SingleBagListReqVo params) {
        LambdaQueryWrapper<SingleBagGroup> wrapper = new LambdaQueryWrapper<>();
        wrapper.ne(SingleBagGroup::getStatus, -1);

        if (params.getMatchDate() != null) {

            wrapper.eq(SingleBagGroup::getMatchDate, params.getMatchDate());
        }

        if (StringUtils.isNotEmpty(params.getLeagueName())) {
            wrapper.like(SingleBagGroup::getLeagueNames, "%" + params.getLeagueName() + "%");
        }

        wrapper.orderByDesc(SingleBagGroup::getCreateTime).orderByDesc(SingleBagGroup::getStatus);

        Page<SingleBagGroup> pageResult = groupMapper.selectPage(page, wrapper);

        return new PageResp<>(pageResult.getTotal(), pageResult.getRecords());
    }

    @Transactional
    @Override
    public int add(SingleBagAddReqVo request) {
        SingleBagGroup group = BeanUtils.copyProperties(request, SingleBagGroup.class);
        group.setTotal(request.getMatchList().size());

        //定义联赛名称集合
        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            //定义联赛名称集合
            Set<String> leagueNameSet = request.getMatchList().stream().map(SingleBagMatch::getLeagueName).collect(Collectors.toSet());
            group.setLeagueNames(JSON.toJSONString(leagueNameSet));
        }


        groupMapper.insert(group);

        //插入完成之后，开始插入赛事信息
        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            for (SingleBagMatch match : request.getMatchList()) {
                match.setGroupId(group.getId());
            }
            matchMapper.insertBatchSomeColumn(request.getMatchList());
        }

        return 1;
    }

    @Override
    public List<SingleBagMatch> getMatchListByGroup(Integer groupId) {
        LambdaQueryWrapper<SingleBagMatch> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SingleBagMatch::getGroupId, groupId);
        return matchMapper.selectList(wrapper);
    }

    @Transactional
    @Override
    public int update(SingleBagEditReqVo request) {
        SingleBagGroup group = BeanUtils.copyProperties(request, SingleBagGroup.class);
        group.setTotal(request.getMatchList().size());
        //定义联赛名称集合
        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            Set<String> leagueNameSet = request.getMatchList().stream().map(SingleBagMatch::getLeagueName).collect(Collectors.toSet());
            group.setLeagueNames(JSON.toJSONString(leagueNameSet));
        }
        groupMapper.updateById(group);
        //批量修改赛事，如果存在则修改，不存在则插入
        if (!CollectionUtils.isEmpty(request.getMatchList())) {
            for (SingleBagMatch singleBagMatch : request.getMatchList()) {
                if (StringUtils.isEmpty(singleBagMatch.getRecommendContent())) {
                    singleBagMatch.setRecommendContent(null);
                }
            }
        }
        if(!CollectionUtils.isEmpty(request.getMatchList())){
            matchMapper.insertOrUpdateBatch(request.getMatchList());
        }

        return 1;
    }

    @Override
    public List<H5SingleBagListVo> getListH5(Integer days) {
        List<SingleBagGroup> groups = groupMapper.selectByDaysAgo(days);

        //根据分组id查询赛事信息
        if (CollectionUtils.isEmpty(groups)) {
            return Collections.emptyList();
        }
        List<Integer> groupIds = groups.stream().map(SingleBagGroup::getId).collect(Collectors.toList());
        LambdaQueryWrapper<SingleBagMatch> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(SingleBagMatch::getGroupId, groupIds);
        List<SingleBagMatch> matches = matchMapper.selectList(wrapper);

        //将groups分组
        Set<LocalDate> dateSet = groups.stream().map(SingleBagGroup::getMatchDate).collect(Collectors.toSet());

        Map<LocalDate, List<SingleBagGroup>> groupByDateMap = groups.stream().collect(Collectors.groupingBy((SingleBagGroup::getMatchDate)));

        //创建返回数据集合模型
        List<H5SingleBagListVo> resultList = new ArrayList<>(dateSet.size());
        H5SingleBagListVo bagListVo;
        for (LocalDate date : dateSet) {
            bagListVo = new H5SingleBagListVo();
            bagListVo.setMatchDate(date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            //获取当前日期的分组id
            List<SingleBagGroup> groupsList = groupByDateMap.get(date);

            //创建分组数据
            List<H5SingleBagGroupVo> groupVoList = new ArrayList<>(groupsList.size());
            //定义分组
            H5SingleBagGroupVo groupVo;
            int groupCount = groupsList.size();
            for (int i = 0; i < groupsList.size(); i++) {
                SingleBagGroup bagGroup = groupsList.get(i);
                bagListVo.setTotal(bagListVo.getTotal() == null ? bagGroup.getTotal() : bagListVo.getTotal() + bagGroup.getTotal());
                groupVo = new H5SingleBagGroupVo();
                groupVo.setPayCode(bagGroup.getPayCode());
                groupVo.setTitle("第" + (groupCount - i) + "组");
                List<SingleBagMatch> filterList = matches.stream().filter(e -> e.getGroupId().equals(bagGroup.getId())).collect(Collectors.toList());
                groupVo.setList(filterList);
                groupVoList.add(groupVo);
            }

            bagListVo.setGroup(groupVoList);

            resultList.add(bagListVo);
        }
        //倒序
        resultList.sort(Comparator.comparing(H5SingleBagListVo::getMatchDate).reversed());

        return resultList;
    }

}
