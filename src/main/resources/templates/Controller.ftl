package ${basePackage}.controller;
import ${basePackage}.controller.vo.${changeTableName}QueryVo;
import ${basePackage}.entity.${changeTableName};
import ${basePackage}.service.${changeTableName}Service;
import com.ecmp.vo.ResponseData;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import ${basePackage}.controller.vo.${changeTableName}Vo;
/**
* 描述：${tableRemark}控制器
* @author ${author}
* @date ${date}
*/
@Api(value = "${changeTableName}Controller",description = "${tableRemark}控制器")
@RequestMapping("/${changeTableName?uncap_first}")
@RestController
public class ${changeTableName}Controller{

    @Autowired
    private ${changeTableName}Service ${changeTableName?uncap_first}Service;

    @ApiOperation(value = "新增对象",notes = "新增对象")
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public ResponseData insert(@RequestBody @Valid ${changeTableName}Vo ${changeTableName?uncap_first}Vo){
        ResponseData responseData = new ResponseData();
        ${changeTableName} ${changeTableName?uncap_first} = ${changeTableName?uncap_first}Vo.buildEntity();
        ${changeTableName?uncap_first}Service.save(${changeTableName?uncap_first});
        return responseData;
    }

    @ApiOperation(value = "分页查询",notes = "分页查询")
    @RequestMapping(value = "/findByPage",method = RequestMethod.POST)
    public ResponseData findByPage(@RequestBody @Valid ${changeTableName}QueryVo ${changeTableName?uncap_first}QueryVo){
        ResponseData responseData = new ResponseData();
        Page<${changeTableName}> page = ${changeTableName?uncap_first}Service.findByPage(${changeTableName?uncap_first}QueryVo);
        return responseData.setData(page);
    }

    @ApiOperation(value = "主键查询",notes = "主键查询")
    @RequestMapping(value = "/findById",method = RequestMethod.GET,params = {"id"})
    public ResponseData findById(@RequestParam String id){
        ResponseData responseData = new ResponseData();
        ${changeTableName} ${changeTableName?uncap_first} = ${changeTableName?uncap_first}Service.findOne(id);
        return responseData.setData(${changeTableName?uncap_first});
    }

    @ApiOperation(value = "编辑对象",notes = "编辑对象")
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public ResponseData update(@RequestBody @Valid ${changeTableName}Vo ${changeTableName?uncap_first}Vo){
        ResponseData responseData = new ResponseData();
        ${changeTableName} ${changeTableName?uncap_first} = ${changeTableName?uncap_first}Vo.buildEntity();
        ${changeTableName?uncap_first}Service.update(${changeTableName?uncap_first});
        return responseData;
    }

    @ApiOperation(value = "删除对象",notes = "删除对象")
    @RequestMapping(value = "/delete",method = RequestMethod.GET,params = {"id"})
    public ResponseData delete(@RequestParam String id){
        ResponseData responseData = new ResponseData();
        ${changeTableName?uncap_first}Service.delete(id);
        return responseData;
    }

}