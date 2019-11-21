package ${basePackage}.service.impl;
import com.ecmp.core.search.Search;
import ${basePackage}.controller.vo.${changeTableName}QueryVo;
import ${basePackage}.entity.${changeTableName};
import ${basePackage}.dao.${changeTableName}Dao;
import ${basePackage}.service.${changeTableName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import com.ecmp.vo.OperateResult;
import org.springframework.util.StringUtils;
import ${basePackage}.exception.BusinessException;
import com.ecmp.core.dao.BaseEntityDao;
import ${basePackage}.service.ContractBaseService;
import ${basePackage}.util.ObjectUpdateTool;
import ${basePackage}.util.PageQueryUtil;
import ${basePackage}.util.SearchUtil;

/**
* 描述：${tableRemark} serviceImpl
* @author ${author}
* @date ${date}
*/
@Service
public class ${changeTableName}ServiceImpl extends ContractBaseService<${changeTableName}> implements ${changeTableName}Service {

    @Autowired
    private ${changeTableName}Dao ${changeTableName?uncap_first}Dao;

    @Override
    protected BaseEntityDao<${changeTableName}> getDao() {
        return ${changeTableName?uncap_first}Dao;
    }

    @Override
    public Page<${changeTableName}> findByPage(${changeTableName}QueryVo ${changeTableName?uncap_first}QueryVo) {
        Search search = SearchUtil.createSearch(${changeTableName?uncap_first}QueryVo);
        return PageQueryUtil.getPageForSearch(findByPage(search),${changeTableName?uncap_first}QueryVo.getPageNum(),${changeTableName?uncap_first}QueryVo.getPageSize());
    }

    @Override
    public ${changeTableName} update(${changeTableName} ${changeTableName?uncap_first}) {
        if (StringUtils.isEmpty(${changeTableName?uncap_first}.getId())) {
            throw new BusinessException("更新对象时,缺少主键id");
        }
        ${changeTableName} resource = findOne(${changeTableName?uncap_first}.getId());
        ObjectUpdateTool.copyNullProperties(resource, ${changeTableName?uncap_first});
        return ${changeTableName?uncap_first}Dao.save(${changeTableName?uncap_first});
    }

    @Override
    public OperateResult delete(String id) {
        return super.delete(id);
    }

}