package com.ecmp.cms.util;

import com.ecmp.cms.config.Config;
import com.ecmp.cms.model.ColumnClass;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.*;

/**
 * author: yangping
 * date: 2018/8/14
 */
public class JdbcUtil {

    private static Connection connection = null;

    //忽略表中的某些字段
    private static List<String> ignoreColumns = Arrays.asList(
            "id"
            ,"creator_id"
            ,"creator_account"
            ,"creator_name"
            ,"created_date"
            ,"last_editor_id"
            ,"last_editor_account"
            ,"last_editor_name"
            ,"last_edited_date"
    );

    /**
     * 数据库连接
     * @return
     * @throws Exception
     */
    public Connection getConnection() throws Exception {
        if(connection == null){
            Properties props =new Properties();
            props.setProperty("user", Config.USER);
            props.setProperty("password", Config.PASSWORD);
            //设置可以获取remarks信息
            props.setProperty("remarks", "true");
            //设置可以获取tables remarks信息
            props.setProperty("useInformationSchema", "true");
            Class.forName(Config.DRIVER);
            connection =DriverManager.getConnection(Config.URL,props);
        }
        return connection;
    }

    /**
     * 获取表的列信息
     * @return
     * @throws Exception
     */
    public static Map<String, Object> getColumns(String tableName) throws Exception {
        Connection connection = new JdbcUtil().getConnection();
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        String types[]={"TABLE"};
        String tableRemark="";
        //表信息
        ResultSet tables = databaseMetaData.getTables(null,"%",tableName,types);
        while (tables.next()) {
            tableRemark=tables.getString("REMARKS");
            System.out.println("表注释："+tables.getString("REMARKS"));
            System.out.println("表名称："+tables.getString("TABLE_NAME"));
            System.out.println("表类型："+tables.getString("TABLE_TYPE"));
        }
        //表中列的信息
        ResultSet resultSet = databaseMetaData.getColumns(null, "%", tableName, "%");

        List<ColumnClass> columnClassList = new ArrayList<ColumnClass>();
        while (resultSet.next()) {
            String columnName = resultSet.getString("COLUMN_NAME");
            //id字段略过
            if (ignoreColumns.contains(columnName)) continue;
            ColumnClass columnClass = new ColumnClass();
            //获取字段名称
            columnClass.setColumnName(columnName);
            //获取字段类型
            columnClass.setColumnType(resultSet.getString("TYPE_NAME"));
            //字段长度
            columnClass.setColumnLength(resultSet.getInt("COLUMN_SIZE"));
            //是否可以为空
            columnClass.setIsNullable(resultSet.getString("IS_NULLABLE"));
            //转换字段名称，如 sys_name 变成 SysName
            columnClass.setChangeColumnName(CommonUtil.replaceUnderLineAndUpperCase(columnName));
            //字段在数据库的注释
            columnClass.setColumnComment(resultSet.getString("REMARKS"));
            columnClassList.add(columnClass);
        }
        Map<String, Object> dataMap = new HashMap<String, Object>();
        dataMap.put("model_column", columnClassList);
        dataMap.put("tableName", tableName);
        dataMap.put("tableRemark", tableRemark);
        dataMap.put("changeTableName", CommonUtil.replaceUnderLineAndUpperCase(tableName,true));
        return dataMap;
    }

}
