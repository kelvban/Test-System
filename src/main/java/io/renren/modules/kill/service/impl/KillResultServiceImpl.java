package io.renren.modules.kill.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.Query;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.kill.dao.KillResultDao;
import io.renren.modules.kill.entity.KillResultEntity;
import io.renren.modules.kill.service.KillResultService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import io.renren.common.utils.PageUtils;







@Service("killResultService")
public class KillResultServiceImpl extends ServiceImpl<KillResultDao, KillResultEntity> implements KillResultService {


    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private KillResultDao killResultDao;
    @Override
    public PageUtils queryPage(Map<String, Object> params,String userName) {
        IPage<KillResultEntity> page = this.page(
                new Query<KillResultEntity>().getPage(params),
                new QueryWrapper<KillResultEntity>()
                        .like(StringUtils.isNotBlank(userName),"user_name", userName)
                        .eq("user_name", userName)
        );

        return new PageUtils(page);
    }

    @Override
    public List<KillResultEntity> queryPageByKey(Map<String, Object> params, String userName) {
        KillResultEntity killResultEntity=killResultDao.queryByKey(userName);
        List<KillResultEntity> list=new ArrayList<>();
        list.add(killResultEntity);
        return list;
    }

    @Override
    public void finish(String userName,String name) {

        KillResultEntity killResultEntity=new KillResultEntity();
        killResultEntity.setName(name);
        killResultEntity.setNumber(Integer.parseInt(redisUtils.get(userName)));
        killResultEntity.setCreateTime(new Date());
        killResultEntity.setUserName(userName);
        this.saveOrUpdate(killResultEntity);
        redisUtils.delete(userName);

    }

    @Override
    public void deleteBatch(Long[] ids) {
        for(Long id : ids){
            this.removeById(id);
        }

    }
}