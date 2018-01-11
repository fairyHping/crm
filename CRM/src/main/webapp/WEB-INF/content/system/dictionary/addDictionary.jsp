<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath =request.getContextPath();//获取应用程序的根路径
	//获取应用程序的全路径
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";	
%>
<!DOCTYPE html>
<html>
<head>
<base href=<%=path%>>
<meta name="pragma" content="no-cache">
<meta name="cache-control" content="no-cache">
<meta name="expires" content="0">
<%@include file="../../script.html"%>
<title>添加字典信息</title>
<style type="text/css">
.t1{
	text-align: right;
	padding-left:20px;
	line-height: 35px;
	background-color: #f5f5f5;
}
</style>
</head>
<body style="max-width: 660px;">
	<div style="width:100%;"
		align="center">

		<form id="form">
			<div class="easyui-panel" style="width:90%;margin-top: 10px;" align="center">
				<table style="width:90%;margin: 10px;" align="center">
				<tr>
					<td class="t1">字典类型：</td>
					<td>
						<input type="text" name="type"
							class="easyui-textbox theme-textbox-radius" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td class="t1">字典名称：</td>
					<td>
						<input name="valueName" id="valueName" class="easyui-textbox theme-textbox-radius" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td class="t1">字典值：</td>
					<td>
						<input name="value" id="value" class="easyui-textbox theme-textbox-radius" data-options="required:true"></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;margin-top: 10px;">
						<a href="javascript:void(0);" id="saveBtn" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a> 
						<a href="javascript:void(0);" id="resetBtn" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>
					</td>
				</tr>
				</table>
				</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#saveBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				var isValid = $('#form').form('validate');
				if(!isValid){
					return;
				}
				$.post("system/dictionary/addDictionary",
						$("#form").serialize(),function(data){
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
				
			});
			
			$("#resetBtn").on("click",function(event){
				//阻止原有的点击事件行为
				event.preventDefault();
				$("#form").form("clear");
			})
	});
	</script>
</body>
</html>