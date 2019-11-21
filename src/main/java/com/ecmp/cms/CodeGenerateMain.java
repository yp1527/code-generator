package com.ecmp.cms;

import com.ecmp.cms.config.Config;
import com.ecmp.cms.util.FreeMarkerUtil;
import com.ecmp.cms.util.JdbcUtil;

import java.util.Map;

/**
 * author: yangping
 * date: 2018/8/14
 */
public class CodeGenerateMain {

    public static void main(String[] args) throws Exception {
        CodeGenerateMain codeGenerateUtils = new CodeGenerateMain();
        codeGenerateUtils.generate();
    }

    public void generate() throws Exception {
        try {
            for (int i=0;i< Config.tables.length;i++){
                Map<String, Object> dataMap = JdbcUtil.getColumns(Config.tables[i]);
                //生成Model文件
                FreeMarkerUtil.generateModelFile(dataMap);
                //生成Dao文件
                FreeMarkerUtil.generateDaoFile(dataMap);
                //生成ext文件
                FreeMarkerUtil.generateExtFile(dataMap);
                //生成extImpl文件
                FreeMarkerUtil.generateExtImplFile(dataMap);
                //生成Service文件
                FreeMarkerUtil.generateServiceFile(dataMap);
                //生成impl文件
                FreeMarkerUtil.generateServiceImplFile(dataMap);
                //生成controller文件
                FreeMarkerUtil.generateControllerFile(dataMap);
                //生成vo文件
                FreeMarkerUtil.generateQueryVoFile(dataMap);
                FreeMarkerUtil.generateUpdateVoFile(dataMap);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }




}
