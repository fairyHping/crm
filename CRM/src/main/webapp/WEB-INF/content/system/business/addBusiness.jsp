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
<meta charset="UTF-8">
<title>新建商机</title>
<%@include file="../../script.html"%>
<style type="text/css">
#div {
	text-align: center;
	width: 750px;
	margin-left:10px;
	margin-right: 30px;
	margin-top:20px;
}



#other {
	text-align: left;
	line-height: 40px;
}

.td1 {
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
		<form id="addForm">
			<div id="main" class="easyui-panel">
				<table style="text-align: center">
					<tr>
						<td colspan="4">商机信息</td>
					</tr>
					<tr>
						<td class="td1" align="right">客户：</td>
						<td><input type="text" name="customerId"
							id="customerId" class="easyui-combobox" data-options="required:true"></td>
						<td class="td1" align="right">商机来源：</td>
						<td><input type="text" class="easyui-combobox" data-options="required:true" name="origin"></td>
					</tr>
					<tr>
					    <td class="td1" align="right">下次联系时间：</td>
						<td><input type="text" name="nextstepTime" class="easyui-datetimebox"></td>
						<td class="td1" align="right">下次联系内容：</td>
						<td><input type="text" name="nextstep" class="easyui-combobox" data-options="required:true"></td>
					</tr>
					<tr>
						<td class="td1" align="right">负责者：</td>
						<td><input type="text" name="ownerUserId"
							id="ownerUserId" class="easyui-combobox" data-options="required:true"></td>
						<td class="td1" align="right">创建者：</td>
						<td><input type="text" name="creatorUserId"
							id="creatorUserId" class="easyui-combobox" data-options="required:true"></td>
					</tr>
					<tr>
				        <td class="td1">创建时间：</td>
						 <td class="td2"> 
						<input name="createTime" id="createTime" class="easyui-datetimebox " 
							>
							</td>
						
						<td class="td1">更新时间：</td>
						 <td class="td2"> 
						<input name="updateTime" id="updateTime" class="easyui-datetimebox"
							 >
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a
							class="easyui-linkbutton save"
							data-options="iconCls:'icon-ok',plain:true">保存</a> <a
							class="easyui-linkbutton saveAndSet"
							data-options="iconCls:'icon-add',plain:true">保存并新建</a> <a
							class="easyui-linkbutton back-button" href="javascript:void(0);"
							data-options="iconCls:'icon-back',plain:true">返回</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
$(function(){
	
	/* 获取所有角色信息 */
	$('#creatorUserId').combobox({
		"url" : "system/users/listAll",
		"valueField" : 'userId',
		"textField" : 'userName',
		"loadFilter" : function(data) {
			if (data && data.success) {
				return data.result;
			}
			return null;
		}
	});

	
	});

$(function(){
	/* 获取所有角色信息 */
	$('#ownerUserId').combobox({
		"url" : "system/users/listAll",
	     "valueField" : 'userId',
		"textField" : 'userName',
		"loadFilter" : function(data) {
			if (data && data.success) {
				return data.result;
			}
			return null;
		}
	});
	});   
$(function(){
	
	/* 获取所有客户信息 */
	$('#customerId').combobox({
		"url" : "system/customer/listAll",
		"valueField" : 'customerId',
		"textField" : 'name',
		"loadFilter" : function(data) {
			if (data && data.success) {
				return data.result;
			}
			return null;
		}
	});

	
	});

$(function() {
	$(".back-button").on("click", function() {
		parent.$("#topWindow").window("close");
	})

	//添加联系人
	$(".save").on(
			"click",
			function(event) {
				event.preventDefault();
				
				$.post("system/business/add", $("#addForm").serialize(),
					function(data) {
					if (data.success) {
						parent.$.messager.alert({
							title : "提示",
							msg : data.message,
						})
						parent.$("#topWindow").window("close")
					} else {
						$.messager.alert({
							title : "提示",
							msg : data.message
						})
					}
				}, "json")
			})
});
</script>
</html>