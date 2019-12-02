package ${basePackage}.service;

import ${basePackage}.entity.${changeTableName};
import ${basePackage}.controller.vo.${changeTableName}QueryVo;
import ${basePackage}.service.common.IContractBaseService;
import org.springframework.data.domain.Page;
import com.ecmp.vo.OperateResult;

/**
* 描述：${tableRemark} service
* @author ${author}
* @date ${date}
*/
public interface ${changeTableName}Service extends IContractBaseService<${changeTableName}>{

    /**
     * 多条件分页查询
     * @param ${changeTableName?uncap_first}QueryVo
     * @return
     */
    Page<${changeTableName}> findByPage(${changeTableName}QueryVo ${changeTableName?uncap_first}QueryVo);

    /**
     * 编辑对象
     * @param ${changeTableName?uncap_first}
     * @return
     */
    ${changeTableName} update(${changeTableName} ${changeTableName?uncap_first});

    /**
     * 删除对象
     * @param id
     */
    OperateResult delete(String id);

}