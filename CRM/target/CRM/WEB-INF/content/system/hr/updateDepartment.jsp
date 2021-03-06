<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String basepath=request.getContextPath();
   String path=request.getLocalAddr()+"://"+request.getServerName()+":"+request.getServerPort()+basepath+"/";
   %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta charset="UTF-8">
<title>添加部门</title>
<%@ include file="../../script.html" %>

 <style type="text/css">
#div {
	text-align: center;
	width: 600px;
	margin-left:15px;
	margin-right: 30px;
	margin-top:20px;
}

table{
	border: 1px solid #f5f5f5;
	border-collapse: collapse;
	width: 100%;
}

td{
	border: 1px solid #f5f5f5;
	height: 60px;
}
#other {
	text-align: left;
	line-height: 40px;
}

#td1 {
	text-align: right;
	background-color: #f5f5f5;
}

.td2 {
	text-align: left
}
</style>
</head>
<body>
<div id="div">
	<div class="easyui-panel">
        <form id="addForm" >
             <table style=" border:1px solid ; border-collapse: collapse;width: 95%" >
                <tbody>
                   <tr>
	    				<td id="td1">部门名称:</td>
	    				<td class="td2"><input class="easyui-textbox" type="text" name="name" value="${department.name }">
	    					<input type="hidden" name="departmentId" value="${department.departmentId }">
	    				</td>
	    		</tr>
	    		<tr>
	    			<td id="td1">上级部门:</td>
	    			<td colspan="3" class="td2">
	    				<select  name="parentId" class="easyui-combobox" >
	    					<c:forEach items="${depts }" var="dept">
	    						<c:choose>
	    							<c:when test="${dept.departmentId eq department.parentId}">
	    								<option value="${dept.departmentId }" selected="selected">${dept.name}</option>
	    							</c:when>
	    							<c:otherwise>
	    								<option value="${dept.departmentId }">${dept.name}</option>
	    							</c:otherwise>
	    						</c:choose>
	    					</c:forEach>
	    				</select> 				
	    			</td>
	    		</tr>
	    		<tr><td id="td1">描述:</td>
	    		<td  class="td2">
	    			<textarea class="theme-textbox-radius" rows="5" cols="25"
								name=description data-options="validType:'maxLength[150]'" > ${department.description }</textarea></td>
	   			</tr>
	   		 </tbody>	
	    </table>
	</form>
            </div>
            <div class="btn-selection" style="margin-top: 20px">
                <a href="javascript:void(0);" id="saveTask" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
                <a href="javascript:void(0);" id="resetbtn" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>
            </div>
        </div>
  <script type="text/javascript">
//添加任务
	$("#saveTask").on("click",function(){
		var isValid = $('#addForm').form('validate');
		if(!isValid){
			return;
		}	
		$.post("system/hr/doUpdateDepartment",$("#addForm").serialize(),function(data){				
			if(data.success){
 				parent.$.messager.alert({
     				title:"提示",
     				msg:data.message,
 				}) 
 				parent.$("#topWindow").window("close")  
 				    				
			}else{
				$.messager.alert({
         			title:"提示",
         			msg:data.message,
  			})
			}
		},"json")			
	})
		//重置
		$("#reset").on("click",function(){
			$("#addForm").form("reset")
		})
	</script> 
</body>
</html>
	    			