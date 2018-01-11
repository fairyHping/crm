<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   String basepath=request.getContextPath();
   String path=request.getLocalAddr()+"://"+request.getServerName()+":"+request.getServerPort()+basepath+"/";
   %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta charset="UTF-8">
<title>添加产品</title> 
 <%@ include file="../../script.html" %>

 <style type="text/css">
#div {
	text-align: center;
	width: 750px;
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
	height: 30px;
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
        <form id="addForm" enctype="multipart/form-data">
             <table style=" border:1px solid ; border-collapse: collapse;height: 500px;width: 95%" >
                <tbody>
                   <tr>
	    				<td id="td1">主题:</td>
	    				<td class="td2"><input class="easyui-textbox" type="text" name="subject" id="subject"/></td>
	    				<td id="td1">发送通知:</td>
	    				<td class="td2">
	    					<input type="checkbox" name="sendEmail" id="sendEmail"/>站内信 &nbsp;
	    					<input type="checkbox" name="sendEmail" id="sendEmail" />邮件
	    				</td>
	    		</tr>
	    		<tr>
	    			<td id="td1">负责人:</td>
	    			<td colspan="3" class="td2">
	    				<select  name="ownerUserId"  id="ownerUserId" style="width: 400px;height: 30px" class="easyui-combobox" >
	    					<c:forEach items="${requestScope.Users }" var="user">
	    						<option value="${user.userId }">${user.userName}</option>
	    					</c:forEach>
	    				</select>	（点击选择）    				
	    			</td>
	    		</tr>
	    		<tr>
	    			<td id="td1">任务相关人:</td>
	    			<td colspan="3" class="td2">
	    				<select  name="aboutUsers"  id="aboutUsers" style="width: 400px;height :30px;" class="easyui-combobox"  >
	    					<c:forEach items="${requestScope.Users }" var="user">
	    						<option value="${user.userId }">${user.userName}</option>
	    					</c:forEach>
	    				</select>	（点击选择）
	    			</td>
	    		<tr>
	    			<td id="td1">选择相关:</td>
	    			<td class="td2">
	    				<select style="width: 70px" class="easyui-combobox">
	    					<option></option>
	    				</select>
	    				<input class="easyui-textbox" type="text" name="" id="" />
	    			</td>
	    			<td id="td1">截止日期:</td>
	    			<td class="td2"><input  class="easyui-datetimebox"  type="text" name="dueDate" data-options="validType:'date'"></input></td>
	    		</tr>
	    		<tr>
	    			<td id="td1">状态:</td>
	    			<td class="td2">
	    				<select name="status" class="easyui-combobox" style="width: 170px">
	    					<option value="未启用">未启用</option>
	    					<option value="正常">正常</option>
	    					<option value="禁用">禁用</option>
	    				</select>
	    			<td id="td1">优先级:</td>
	    			<td class="td2"> 
	    				<select name="priority" class="easyui-combobox" style="width: 170px">
	    					<option value="高">高</option>
	    					<option value="中">中</option>
	    					<option value="底">底</option>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr><td id="td1">描述:</td>
	    		<td colspan="3" class="td2">
	    			<input class="easyui-textbox" data-options="multiline:true"  type="text" name="description" style="height:100px;width: 400px;"></input></td>
	   			</tr>
	   		 </tbody>	
	    </table>
	</form>
            </div>
            <div class="btn-selection">
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
		$.post("system/task/doAddTask",$("#addForm").serialize(),function(data){				
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