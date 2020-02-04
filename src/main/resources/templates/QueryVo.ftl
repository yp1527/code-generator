package ${basePackage}.controller.vo;
import ${basePackage}.entity.${changeTableName};
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.BeanUtils;
import lombok.Data;
import ${basePackage}.annotation.SearchAnnotation;
<#if model_column?exists>
    <#list model_column as model>
        <#if (model.columnType = 'DECIMAL')>
import java.math.BigDecimal;
            <#break>
        </#if>
    </#list>
</#if>
<#if model_column?exists>
    <#list model_column as model>
        <#if (model.columnType = 'DATETIME' || model.columnType = 'DATE')>
import java.util.Date;
            <#break>
        </#if>
    </#list>
</#if>

/**
 * 描述：${tableRemark} QueryVo
 * @author ${author}
 * @date ${date}
 */
@Data
public class ${changeTableName}QueryVo extends SearchBaseVo{

<#if model_column?exists>

    /**
     * 快速查询
     */
    @ApiModelProperty(value = "快速查询")
    @SearchAnnotation(properties = {})
    private String quickSearchValue;

    /**
     * 主键
     */
    @ApiModelProperty(value = "id",notes = "主键")
    private String id;

<#list model_column as model>
    /**
     * ${model.columnComment!}
     */
    @SearchAnnotation
    @ApiModelProperty(value = "${model.columnComment!}")
    <#if (model.columnType = 'VARCHAR' || model.columnType = 'CHAR' || model.columnType = 'TEXT'|| model.columnType = 'LONGTEXT')>
    private String ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType = 'INT' || model.columnType = 'int')>
    private Integer ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType = 'TINYINT' || model.columnType = 'tinyint')>
    private Boolean ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType = 'DATETIME' || model.columnType = 'DATE') >
    private Date ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType = 'DECIMAL' || model.columnType = 'decimal') >
    private BigDecimal ${model.changeColumnName?uncap_first};
    </#if>
</#list>
</#if>

    public ${changeTableName} buildEntity() {
        ${changeTableName} ${changeTableName?uncap_first} = new ${changeTableName}();
        BeanUtils.copyProperties(this, ${changeTableName?uncap_first});
        return ${changeTableName?uncap_first};
    }

}