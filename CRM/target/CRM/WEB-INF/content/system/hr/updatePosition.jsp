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
<title>修改岗位</title>
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
	    				<td id="td1">岗位名称:</td>
	    				<td class="td2"><input class="easyui-textbox" type="text" name="name" value="${pos.name }"/>
	    							<input type="hidden" name="positionId" value="${pos.positionId }"/>
	    				</td>
	    		</tr>
	    		<tr>
	    			<td id="td1">上级岗位:</td>
	    			<td  class="td2">
	    				<select  name="parentId" class="easyui-combobox" >
	    					<c:forEach items="${requestScope.positions }" var="posit">
	    						<c:choose>
	    							<c:when test="${posit.positionId eq pos.parentId }">
	    								<option value="${posit.positionId }" selected="selected">${posit.name}</option>
	    							</c:when>
	    							<c:otherwise>
	    									<option value="${posit.positionId }">${posit.name}</option>
	    							</c:otherwise>
	    						</c:choose>
	    					</c:forEach>
	    				</select> 				
	    			</td>
	    		</tr>
	    		<tr>
	    			<td id="td1">所属部门:</td>
	    			<td  class="td2">
	    				<select  name="departmentId" class="easyui-combobox" >
	    					<c:forEach items="${requestScope.depts }" var="dept">
	    					<c:if test="${dept.departmentId eq pos.departmentId }">
	    							<option value="${dept.departmentId }" selected="selected">${dept.name}</option>
	    						</c:if>
	    						<option value="${dept.departmentId }">${dept.name}</option>
	    					</c:forEach>
	    				</select> 				
	    			</td>
	    		</tr>
	    		<tr><td id="td1">描述:</td>
	    		<td  class="td2">
	    			<textarea class="theme-textbox-radius" rows="5" cols="25"
								name=description data-options="validType:'maxLength[150]'"></textarea></td>
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
		$.post("system/hr/doUpdatePosition",$("#addForm").serialize(),function(data){				
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