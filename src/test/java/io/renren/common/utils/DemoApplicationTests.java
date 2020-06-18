package io.renren.common.utils;

import io.renren.modules.sys.entity.SysConfigEntity;
import io.renren.modules.sys.service.SysConfigService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    SysConfigService sysConfigService;

    @Test
    public void contextLoads() {
//        SysConfigEntity sysConfigEntity=new SysConfigEntity();
//        sysConfigEntity.setParamKey("test");
//        sysConfigEntity.setParamValue("test");
//        sysConfigEntity.setRemark("test");
//        sysConfigEntity.setJobStatus(1);
////        sysConfigService.saveConfig(sysConfigEntity);
//        redisUtils.set("test",sysConfigEntity);
//        System.out.println(redisUtils.get("test"));
//
//        System.out.println(redisUtils.get("name"));
        String test="SysUserEntity(userId=1, username=adminadminadmin, password=5bae455e9b8e7e85f1d9b360f1782506fe0093c15f72a91e7ca7a72e02512bea, salt=YzcmCZNvbXocrsz9dm8e, email=root@admin.com, mobile=12345678901, status=1, roleIdList=null, createUserId=1, createTime=Thu Apr 09 21:44:32 CST 2020)";
        String [] strings=test.split(", password");
        for(String s:strings){
            System.out.println(s);
        }
        String [] user=strings[0].split("username=");
        System.out.println(user[1]);
    }

}
