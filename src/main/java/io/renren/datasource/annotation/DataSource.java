/**
 * Copyright (c) 2018 测试系统 All rights reserved.
 *
 *
 *
 *
 */

package io.renren.datasource.annotation;

import java.lang.annotation.*;

/**
 * 多数据源注解
 *
 *
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface DataSource {
    String value() default "";
}
