/**
 * Copyright (c)  测试系统 All rights reserved.
 *
 *
 *
 *
 */

package io.renren.modules.oss.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.oss.entity.SysOssEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 文件上传
 *
 *
 */
@Mapper
public interface SysOssDao extends BaseMapper<SysOssEntity> {
	
}
