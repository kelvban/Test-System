package io.renren.modules.kill.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.kill.entity.KillResultEntity;


import java.util.List;
import java.util.Map;

/**
 * 秒杀结果表
 *
 *
 */
public interface KillResultService extends IService<KillResultEntity> {

    PageUtils queryPage(Map<String, Object> params,String userName);



    List<KillResultEntity> queryPageByKey(Map<String, Object> params,String userName);


    void finish(String userName,String name);
    /**
     * 删除秒杀结果
     */
    public void deleteBatch(Long[] ids);
}

