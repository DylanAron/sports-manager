package com.soccer.framework.config.plus;

import com.baomidou.mybatisplus.core.injector.AbstractMethod;
import com.baomidou.mybatisplus.core.injector.DefaultSqlInjector;
import com.baomidou.mybatisplus.core.metadata.TableInfo;

import java.util.List;

/**
 * @Author dylan
 * @Description: mybatis-plus自定义Injector  实现批量操作
 * @Create: 2023/9/7 16:38
 */
public class SqlInjector extends DefaultSqlInjector {
    @Override
    public List<AbstractMethod> getMethodList(Class<?> mapperClass, TableInfo tableInfo) {
        List<AbstractMethod> methodList = super.getMethodList(mapperClass, tableInfo);
        methodList.add(new InsertBatchMethod(t ->
                  !"update_time".equals(t.getColumn())));
        methodList.add(new UpdateBatchMethod());
        return methodList;
    }
}
