package io.renren.modules.kill.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.common.annotation.SysLog;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.kill.entity.KillResultEntity;
import io.renren.modules.kill.service.KillResultService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.servlet.http.HttpServletRequest;


/**
 * 秒杀结果表
 *

 */
@RestController
@RequestMapping("kill/result")
public class KillResultController {

    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private KillResultService killResultService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("kill:activity:list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest httpServletRequest){

//        Cookie [] cookies=httpServletRequest.getCookies();
//        SysUserEntity sysUserEntity=(SysUserEntity) httpServletRequest.getRemoteUser();
//        SysUserEntity sysUserEntity= JSONObject.parseObject(httpServletRequest.getRemoteUser(),SysUserEntity.class);
        String user=httpServletRequest.getRemoteUser();
        String [] strings=user.split(", password");
        String [] users=strings[0].split("username=");
//        List<KillResultEntity> list= killResultService.queryPageByKey(params,users[1]);
//        return R.ok().put("list",list);
        PageUtils page= killResultService.queryPage(params,users[1]);
        return R.ok().put("page", page);
    }
    /**
     * 结束
     */
    @RequestMapping("/finish")
    @RequiresPermissions("kill:result:finish")
    public R finish(@RequestParam Map<String, Object> params, HttpServletRequest httpServletRequest){
        String user=httpServletRequest.getRemoteUser();
        String [] strings=user.split(", password");
        String [] users=strings[0].split("username=");
        killResultService.finish(users[1],redisUtils.get("seckillName"));
        return R.ok();
    }


    /**
     * 删除
     */
    @SysLog("删除秒杀结果")
    @PostMapping("/delete")
    @RequiresPermissions("kill:result:delete")
    public R delete(@RequestBody Long[] ids){
        killResultService.deleteBatch(ids);

        return R.ok();
    }
}
