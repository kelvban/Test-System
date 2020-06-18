/**
 * Copyright (c)  测试系统 All rights reserved.
 *
 *
 *
 *
 */

package io.renren.common.utils;

import java.util.HashMap;


/**
 * Map工具类
 *
 *
 */
public class MapUtils extends HashMap<String, Object> {

    @Override
    public MapUtils put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
