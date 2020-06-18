package io.renren.modules.kill.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.kill.entity.KillSeckillEntity;


import java.util.Map;

/**
 * 秒杀测试项表
 *
 */
public interface KillSeckillService extends IService<KillSeckillEntity> {

    PageUtils queryPage(Map<String, Object> params);

    int runByIds(Long [] ids);
}

