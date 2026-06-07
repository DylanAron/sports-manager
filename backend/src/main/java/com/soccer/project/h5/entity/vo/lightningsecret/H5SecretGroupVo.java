package com.soccer.project.h5.entity.vo.lightningsecret;

import com.soccer.project.business.entity.po.LightningSecretMatch;
import com.soccer.project.business.entity.po.SingleBagMatch;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author dylan
 * @Description: 分组数据 第机组
 * @Create: 2025/4/16 14:08
 */
@Data
public class H5SecretGroupVo implements Serializable {

    private String title;

    private String payCode;
    /**
     * 是否全部完场
     */
    private Integer finished;

    private List<LightningSecretMatch> list;
}
