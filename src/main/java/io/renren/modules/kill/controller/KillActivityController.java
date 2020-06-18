package io.renren.modules.kill.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.kill.entity.KillResultEntity;
import io.renren.modules.kill.entity.KillSeckillEntity;
import io.renren.modules.kill.service.KillActivityService;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 秒杀测试项表
 *
 *
 */
@RestController
@RequestMapping("kill/activity")
public class KillActivityController {

    @Autowired
    private KillActivityService killActivityService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("kill:activity:list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest httpServletRequest){

//        Cookie [] cookies=httpServletRequest.getCookies();
//        SysUserEntity sysUserEntity=(SysUserEntity) httpServletRequest.getRemoteUser();
//        SysUserEntity sysUserEntity= JSONObject.parseObject(httpServletRequest.getRemoteUser(),SysUserEntity.class);

        List<KillSeckillEntity> list = killActivityService.queryPage(params);

        return R.ok().put("list", list);
    }

    /**
     * 添加
     */
    @RequestMapping("/add")
    @RequiresPermissions("kill:activity:add")
    public R delete(@RequestBody Long[] seckillIds,HttpServletRequest httpServletRequest){
        String user=httpServletRequest.getRemoteUser();
        String [] strings=user.split(", password");
        String [] users=strings[0].split("username=");
        killActivityService.addByIds(seckillIds,users[1]);

        return R.ok();
    }
    /**
     * 列表
     */
    @RequestMapping("/resultList")
    @RequiresPermissions("kill:activity:resultList")
    public R resultList(@RequestParam Map<String, Object> params, HttpServletRequest httpServletRequest){
        String user=httpServletRequest.getRemoteUser();
        String [] strings=user.split(", password");
        String [] users=strings[0].split("username=");
        List<KillResultEntity> list = killActivityService.queryResultPage(params,users[1]);

        return R.ok().put("list", list);
    }



}
