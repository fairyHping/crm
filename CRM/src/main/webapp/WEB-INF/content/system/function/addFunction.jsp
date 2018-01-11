<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();//获取应用程序的根路径
	//获取应用程序的全路径
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ basePath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href=<%=path%>>
<meta name="pragma" content="no-cache">
<meta name="cache-control" content="no-cache">
<meta name="expires" content="0">
<%@include file="../../script.html"%>
<title>添加用户信息</title>
<style type="text/css">
.t1{
	text-align: right;
	padding-left:20px;
	line-height: 35px;
}
</style>
</head>
<body style="max-width: 660px;">
	<div style="width:100%;"
		align="center">

		<form id="saveForm">
			<div class="easyui-panel" style="width:90%;margin-top: 10px;" align="center">
				<table style="width:90%;margin: 10px;" align="center">
					<tr>
						<td class="t1">权限名称:</td>
						<td><input name="funcName" class="easyui-textbox"
							data-options="required:true"
							placeholder="请输入权限名称"></td>
					
					<tr>
					<tr>
						<td class="t1">权限URL:</td>
						<td><input name="funcUrl" id="funcUrl" class="easyui-textbox"
							placeholder="请输入权限url"></td>
					
					<tr>
					<tr>
						<td class="t1">权限编码:</td>
						<td><input name="funcCode" class="easyui-textbox"
							placeholder="请输入权限编码"></td>
					
					<tr>
						<td class="t1">父权限:</td>
						<td><input name="parentId" id="parentId" class="easyui-combobox"></td>
					</tr>
					<tr>
						<td class="t1">权限类型:</td>
						<td>
						<select name="funcType" id="funcType" style="width:145px" class="easyui-combobox theme-textbox-radius">
							<option value="1">菜单权限</option>
							<option value="0" selected>按钮权限</option>
						</select>
					</tr>
					<tr>
						<td colspan="2" align="center"><a id="savebtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
							style="margin-right: 20px">保存</a> <a id="resetbtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a></td>
					</tr>
				</table>
				
			</div>
		</form>

	</div>
</body>
<script type="text/javascript">
	$(function(){
		
		$("#parentId").combobox({
			"url" : "system/functions/listAll",
			"valueField" : 'funcId',
			"textField" : 'funcName',
			"loadFilter" : function(data) {
				if (data && data.success) {
					return data.result;
				}
				return null;
			}
		});		
		
    	$("#savebtn").on("click",function(){
    		var isValid = $('#saveForm').form('validate');
			if(!isValid){
				return;
			}
	        
			var funcUrl=$("#funcUrl").textbox("getText");
			if(funcUrl==null){
				$("#parentId").combobox("setValue",null);
			}
			
    		$.post("system/functions/addFunction",$("#saveForm").serialize(),function(data){
    			if(data.success){
    				parent.$.messager.show({"title":"提示","msg":data.message,"timeout":6000});
       				parent.$("#topWindow").window("close")
     			}else{
    				parent.$.messager.alert({
	           			title:"提示",
	           			msg:data.message
			        })
			     } 			
    		},"json")    	    	
    	})


	$("#resetbtn").on("click",function(){
		//阻止原有的点击事件行为
		event.preventDefault();
		$("#saveForm").form("clear");
	});
 });

</script>
</html>