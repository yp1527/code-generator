package com.ecmp.cms.config;

/**
 * author: yangping
 * date: 2018/8/14
 */
public class Config {
    /**
     * 模板导出路径
     */
    public final static String diskPath = "D://code";

    /**
     * 数据库连接信息
     */
    public final static String URL = "jdbc:mysql://10.4.208.123:3306/ecmp_contract?characterEncoding=utf8";
    public final static String USER = "contract_siud";
    public final static String PASSWORD = "H9ItGDhvwPVP3C9G5wHs";
    public final static String DRIVER = "com.mysql.jdbc.Driver";

    /**
     * 模板对应的表
     */
    public final static String[] tables = {
            "con_address"
    };
    /**
     * 生成实体时是否去掉前缀，默认第一个下划线前面的字符为前缀
     */
    public static boolean isDelPrefix = true;
    /**
     * 基础包路径，不同模板会自动在此基础上追加包名
     */
    public final static String basePackage = "com.ecmp.springboot.contract";

    /**
     * 模板的公共注释信息
     */
    public final static String description = " ";
    public final static String author = "yangping";
    public final static String date = "2019/11/18";



}
