package io.renren.modules.kill.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.kill.entity.KillSeckillEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 秒杀测试项表
 *
 *
 */
@Repository
@Mapper
public interface KillSeckillDao extends BaseMapper<KillSeckillEntity> {
    /**
     * 根据key，查询value
     */
    KillSeckillEntity queryByKey(String name);

    /**
     * 查询所有正处于秒杀状态的数据
     */
    KillSeckillEntity queryALLRunning();

}
