package io.renren.modules.kill.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.kill.entity.KillResultEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 秒杀结果表
 * 
 *
 */
@Repository
@Mapper
public interface KillResultDao extends BaseMapper<KillResultEntity> {

    KillResultEntity queryByKey(String userName);
	
}
