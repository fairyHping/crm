<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>修改字典</title>
<%@include file="../../script.html"%>
<style type="text/css">
#div {
	text-align: center;
	width: 500px;
	margin-left: 40px;
	margin-right: 30px;
	margin-top: 20px;
}

#other {
	text-align: left;
	line-height: 40px;
}

.td1 {
	text-align: right;
	background-color: #f5f5f5;
	line-height: 35px;
	margin-left: 20px;
	padding-left: 30px;
}

.td2 {
	text-align: left;
	padding-left: 20px;
}
</style>
</head>
<body>
	<div id="div">
		<form id="form">
			<div id="main" class="easyui-panel">
				<table style="text-align: center" align="center">
					<tr>
						<td colspan="2" id="other"><strong>字典信息</strong></td>
					</tr>
					<tr>
						<td class="td1">字典类型：</td>
						<td class="td2"><input name="dicId" type="hidden"
							value="${dictionary.dicId}">
						<input name="type" value="${dictionary.type}" class="easyui-textbox" data-options="required:true">
						</td>
					</tr>
					<tr>
						<td class="td1">字典名称：</td>
						<td class="td2"><input name="valueName"
							class="easyui-textbox" data-options="required:true"
							value="${dictionary.valueName}"></td>
					</tr>
					<tr>
						<td class="td1">字典值：</td>
						<td class="td2"><input name="value" class="easyui-textbox" data-options="required:true"
							value="${dictionary.value}"></td>
					</tr>
					<tr>
						<td class="td1">字典状态：</td>
						<td class="td2">
						<select name="state" id="state" class="easyui-combobox theme-textbox-radius" style="width:175px">
							<option value="1" ${dictionary.state==1?"selected":"" }>正常</option>
							<option value="0" ${dictionary.state==0?"selected":"" }>禁用</option>
							<option value="2" ${dictionary.state==2?"selected":"" }>已删除</option>
						</select>
					</td>
					</tr>
					<tr>
						<td class="td1">创建时间：</td>
						<td class="td2"><input name="createTime"
							class="easyui-datetimebox"
							value='<fmt:formatDate value="${dictionary.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>'></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><a id="saveBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
							style="margin-right: 20px">保存</a> 
							<a id="resetBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">

	$(function() {
		$("#saveBtn").on(
				"click",
				function(event) {
					//阻止原有的点击事件行为
					event.preventDefault();
					var isValid = $('#form').form('validate');
					if (!isValid) {
						return;
					}
					$.post("system/dictionary/updateDictionary", $("#form")
							.serialize(), function(data) {
						if (data.success) {
							parent.$.messager.show({
								"title" : "提示",
								"msg" : data.message,
								"timeout" : 6000
							});
							parent.$("#topWindow").window("close")
						} else {
							parent.$.messager.alert({
								title : "提示",
								msg : data.message
							})
						}
					}, "json");

				});

		$("#resetbtn").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			$("#form").form("clear");
		});
	});
</script>
</html>