package io.renren.modules.kill.service;

import io.renren.common.utils.PageUtils;
import io.renren.modules.kill.entity.KillResultEntity;
import io.renren.modules.kill.entity.KillSeckillEntity;

import java.util.List;
import java.util.Map;

public interface KillActivityService {

    List<KillSeckillEntity> queryPage(Map<String, Object> params);
    List<KillResultEntity> queryResultPage(Map<String, Object> params,String userName);
    void addByIds(Long [] ids,String userName);


}
