package ${basePackage}.entity;
import com.ecmp.core.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;
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
 * 描述：${tableRemark} entity
 * @author ${author}
 * @date ${date}
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name="${tableName}")
public class ${changeTableName} extends BaseEntity{

<#if model_column?exists>
<#list model_column as model>
    /**
     * ${model.columnComment!}
     */
    @Column(name = "${model.columnName}")
    <#if (model.columnType = 'VARCHAR' || model.columnType = 'CHAR' || model.columnType = 'TEXT'|| model.columnType = 'LONGTEXT')>
    private String ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType = 'INT' || model.columnType = 'int')>
    private Integer ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType = 'TINYINT' || model.columnType = 'tinyint')>
        private Boolean ${model.humpName?uncap_first};
    </#if>
    <#if (model.columnType = 'DATETIME' || model.columnType = 'DATE') >
    private Date ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType = 'DECIMAL' || model.columnType = 'decimal') >
    private BigDecimal ${model.changeColumnName?uncap_first};
    </#if>

</#list>
</#if>

}