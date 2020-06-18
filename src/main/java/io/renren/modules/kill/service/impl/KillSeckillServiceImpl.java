package io.renren.modules.kill.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.kill.dao.KillSeckillDao;
import io.renren.modules.kill.entity.KillSeckillEntity;
import io.renren.modules.kill.service.KillSeckillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;




@Service("killSeckillService")
public class KillSeckillServiceImpl extends ServiceImpl<KillSeckillDao, KillSeckillEntity> implements KillSeckillService {

    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private KillSeckillDao killSeckillDao;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String name = (String)params.get("name");

        IPage<KillSeckillEntity> page = this.page(
                new Query<KillSeckillEntity>().getPage(params),
                null
        );

        return new PageUtils(page);
    }

    @Override
    public int runByIds(Long[] ids) {
        KillSeckillEntity killSeckillEntity1=killSeckillDao.queryALLRunning();
        if(killSeckillEntity1!=null){
            return 1;
        }
        for(Long id:ids){
            KillSeckillEntity killSeckillEntity=this.getById(id);
            Date nowDate=new Date();
            if(killSeckillEntity.getEndTime().before(nowDate)){
                return 2;
            }
            killSeckillEntity.setSeckillStatus("1");
            killSeckillEntity.setStatus(1);
            this.updateById(killSeckillEntity);
            redisUtils.set("seckill",killSeckillEntity); //秒杀项对象
            redisUtils.set("seckillName",killSeckillEntity.getName());//秒杀项对象名称
        }
        return 0;
    }
}