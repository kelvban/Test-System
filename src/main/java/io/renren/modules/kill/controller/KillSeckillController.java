package io.renren.modules.kill.controller;


import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.common.utils.RedisUtils;
import io.renren.modules.kill.entity.KillSeckillEntity;
import io.renren.modules.kill.service.KillSeckillService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 秒杀测试项表
 *
 *
 */
@RestController
@RequestMapping("kill/seckill")
public class KillSeckillController {
    @Autowired
    private KillSeckillService killSeckillService;

    @Autowired
    private RedisUtils redisUtils;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("kill:seckill:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = killSeckillService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{seckillId}")
    @RequiresPermissions("kill:seckill:info")
    public R info(@PathVariable("seckillId") Long seckillId){
		KillSeckillEntity killSeckill = killSeckillService.getById(seckillId);

        return R.ok().put("killSeckill", killSeckill);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("kill:seckill:save")
    public R save(@RequestBody KillSeckillEntity killSeckill){
        killSeckill.setCreateTime(new Date());
		killSeckillService.save(killSeckill);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("kill:seckill:update")
    public R update(@RequestBody KillSeckillEntity killSeckill){
		killSeckillService.updateById(killSeckill);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("kill:seckill:delete")
    public R delete(@RequestBody Long[] seckillIds){
		killSeckillService.removeByIds(Arrays.asList(seckillIds));
		for(Long id:seckillIds){
		    redisUtils.delete("seckill");
		    redisUtils.delete("seckillname");
        }
        return R.ok();
    }
    /**
     * 开启秒杀
     */
    @RequestMapping("/run")
    @RequiresPermissions("kill:seckill:run")
    public R run(@RequestBody Long[] seckillIds){
        int result=killSeckillService.runByIds(seckillIds);
        if(result==1){
            return R.error(1,"有任务正在进行，请稍后！");
        }
        if(result==2){
            return R.error(2,"有误！请修改截止日期！");
        }
        return R.ok();
    }

}
