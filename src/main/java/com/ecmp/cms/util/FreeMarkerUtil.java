package com.ecmp.cms.util;

import com.ecmp.cms.config.Config;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * author: yangping
 * date: 2018/8/14
 */
public class FreeMarkerUtil {

    private static void generateFileByTemplate(final String templateName, File file, Map<String, Object> dataMap) throws Exception {
        dataMap.put("basePackage", Config.basePackage);
        dataMap.put("author", Config.author);
        dataMap.put("date", Config.date);
        dataMap.put("description", Config.description);

        File dir = new File(file.getParent());
        if(!dir.exists()){
            dir.mkdirs();
        }
        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"), 10240);
        FreeMarkerTemplateUtils.getTemplate(templateName).process(dataMap, out);
    }

    /**
     * 生成model
     * @param dataMap
     * @throws Exception
     */
    public static void generateModelFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/model/" + dataMap.get("changeTableName") + ".java";
        generateFileByTemplate("Model.ftl", new File(path), dataMap);
    }

    /**
     * 生成Dao
     * @throws Exception
     */
    public static void generateDaoFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/dao/" + dataMap.get("changeTableName") + "Dao.java";
        generateFileByTemplate("Dao.ftl", new File(path), dataMap);
    }
    /**
     * 生成ExtDao
     * @throws Exception
     */
    public static void generateExtFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/ext/" + dataMap.get("changeTableName") + "ExtDao.java";
        generateFileByTemplate("Ext.ftl", new File(path), dataMap);
    }

    /**
     * 生成ExtDaoImpl
     * @throws Exception
     */
    public static void generateExtImplFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/extimpl/" + dataMap.get("changeTableName") + "DaoImpl.java";
        generateFileByTemplate("ExtImpl.ftl", new File(path), dataMap);
    }
    /**
     * 生成Service
     * @throws Exception
     */
    public static void generateServiceFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/service/" + dataMap.get("changeTableName") + "Service.java";
        generateFileByTemplate("Service.ftl", new File(path), dataMap);
    }

    /**
     * 生成ServiceImpl
     * @throws Exception
     */
    public static void generateServiceImplFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/impl/" + dataMap.get("changeTableName") + "ServiceImpl.java";
        generateFileByTemplate("ServiceImpl.ftl", new File(path), dataMap);
    }

    /**
     * 生成Controller
     * @throws Exception
     */
    public static void generateControllerFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/controller/" + dataMap.get("changeTableName") + "Controller.java";
        generateFileByTemplate("Controller.ftl", new File(path), dataMap);
    }

    /**
     * 生成queryVo
     * @param dataMap
     * @throws Exception
     */
    public static void generateQueryVoFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/vo/" + dataMap.get("changeTableName") + "QueryVo.java";
        generateFileByTemplate("QueryVo.ftl", new File(path), dataMap);
    }

    /**
     * 生成updateVo
     * @param dataMap
     * @throws Exception
     */
    public static void generateUpdateVoFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/vo/" + dataMap.get("changeTableName") + "Vo.java";
        generateFileByTemplate("UpdateVo.ftl", new File(path), dataMap);
    }






}
