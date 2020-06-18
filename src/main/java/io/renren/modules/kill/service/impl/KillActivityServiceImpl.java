package io.renren.modules.kill.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.kill.dao.KillResultDao;
import io.renren.modules.kill.dao.KillSeckillDao;
import io.renren.modules.kill.entity.KillResultEntity;
import io.renren.modules.kill.entity.KillSeckillEntity;
import io.renren.modules.kill.service.KillActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class KillActivityServiceImpl extends ServiceImpl<KillSeckillDao, KillSeckillEntity> implements KillActivityService {

    @Autowired
    private RedisUtils redisUtils;


    @Override
    public List<KillSeckillEntity> queryPage(Map<String, Object> params) {
//        String name = (String)params.get("name");
//
//        page = this.page(
//                new Query<KillSeckillEntity>().getPage(params),
//                new QueryWrapper<KillSeckillEntity>()
//                        .like(StringUtils.isNotBlank(name),"name", name)
//                        .eq("seckill_status", 1)
//        );
//        List<KillSeckillEntity> killSeckillEntityList=page.getRecords();
//        if(killSeckillEntityList.size()>0){
//            if(redisUtils.get(killSeckillEntityList.get(0).getSeckillId().toString())==null){
//                redisUtils.set(killSeckillEntityList.get(0).getSeckillId().toString(),killSeckillEntityList.get(0));
//            }
//        }
        KillSeckillEntity killSeckillEntity=redisUtils.get("seckill",KillSeckillEntity.class);
        if(killSeckillEntity==null){
            return null;
        }
        List<KillSeckillEntity> list=new ArrayList<>();
        list.add(killSeckillEntity);
        return list;
    }

    @Override
    public void addByIds(Long[] ids,String userName) {
//        for(Long id:ids){
//            KillSeckillEntity killSeckillEntity=redisUtils.get(id.toString(),KillSeckillEntity.class);
//            int num=killSeckillEntity.getNumber();
//            Date date=new Date();
//            if(num<1||killSeckillEntity.getEndTime().before(date)){
//                killSeckillEntity.setSeckillStatus("0");
//                this.updateById(killSeckillEntity);
//                redisUtils.delete(killSeckillEntity.getSeckillId().toString());
//                break;
//            }
//            num--;
//            killSeckillEntity.setNumber(num);
//            redisUtils.set(killSeckillEntity.getSeckillId().toString(),killSeckillEntity);
//        }

        Date date=new Date();
        KillSeckillEntity killSeckillEntity=redisUtils.get("seckill",KillSeckillEntity.class);
        if(killSeckillEntity.getNumber()<1||killSeckillEntity.getEndTime().before(date)){
            redisUtils.delete("seckill");
        }
        int num=killSeckillEntity.getNumber();
        num--;
        killSeckillEntity.setNumber(num);
        redisUtils.set("seckill",killSeckillEntity);
        int value=1;
        if(redisUtils.get(userName)==null){
            redisUtils.set(userName,value);
            return ;
        }else {
            value=Integer.parseInt(redisUtils.get(userName));
            value++;
            redisUtils.set(userName,value);
        }

    }

    @Override
    public List<KillResultEntity> queryResultPage(Map<String, Object> params,String userName) {
        List<KillResultEntity> list=new ArrayList<>();
        if(redisUtils.get(userName)==null){
            return list;
        }
        int number=Integer.parseInt(redisUtils.get(userName));
        KillResultEntity killResultEntity=new KillResultEntity();
        killResultEntity.setName(redisUtils.get("seckillName"));
        killResultEntity.setNumber(Integer.parseInt(redisUtils.get(userName)));
        list.add(killResultEntity);
        return list;
    }


}
