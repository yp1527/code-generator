package ${basePackage}.dao.impl;

import com.ecmp.core.dao.impl.BaseEntityDaoImpl;
import ${basePackage}.dao.ext.${changeTableName}ExtDao;
import ${basePackage}.entity.${changeTableName};
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

/**
* 描述：${tableRemark} ExtDao
* @author ${author}
* @date ${date}
*/
@Component
public class ${changeTableName}DaoImpl extends BaseEntityDaoImpl<${changeTableName}> implements ${changeTableName}ExtDao {

    public ${changeTableName}DaoImpl(EntityManager entityManager) {
        super(${changeTableName}.class, entityManager);
    }
}