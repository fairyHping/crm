<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>修改权限信息</title>
<style type="text/css">
.t1 {
	text-align: right;
	padding-left: 30px;
	line-height: 35px;
}
</style>
</head>
<body style="max-width: 660px;">
	<div style="width: 100%;" align="center">

		<form id="saveForm">
			<div class="easyui-panel" style="width: 90%; margin-top: 10px;"
				align="center">
				<table style="width: 90%; margin: 10px;" align="center">
					<tr>
						<td class="t1">权限名称:</td>
						<td><input name="funcId" type="hidden"
							value="${func.funcId }"> <input name="funcName"
							class="easyui-textbox" data-options="required:true"
							value="${func.funcName }"></td>
					<tr>
					<tr>
						<td class="t1">权限URL:</td>
						<td><input name="funcUrl" id="funcUrl" class="easyui-textbox"
							value="${func.funcUrl }"></td>
					<tr>
					<tr>
						<td class="t1">权限编码:</td>
						<td><input name="funcCode" class="easyui-textbox"
							value="${func.funcCode }"></td>
					<tr>
						<td class="t1">父权限:</td>
						<td><select name="parentId" id="parentId"
							class="easyui-combobox theme-textbox-radius" style="width: 170px" >
								<c:forEach items="${parentFunctions}" var="pf">
									<c:if test="${func.parentId eq pf.funcId}">
										<option value="${func.parentId}" selected="selected">${pf.funcName}</option>
									</c:if>
									<option value="${pf.funcId }">${pf.funcName }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="t1">权限类型:</td>
						<td><select name="funcType" id="funcType"
							style="width: 170px" class="easyui-combobox theme-textbox-radius">
								<option value="1" ${func.funcType==1?"selected":"" }>菜单权限</option>
								<option value="0" ${func.funcType==0?"selected":"" }>按钮权限</option>
						</select>
					</tr>
					<tr>
						<td class="t1">权限状态:</td>
						<td><select name="status" id="status" style="width: 170px"
							class="easyui-combobox theme-textbox-radius">
								<option value="0" ${func.status==0?"selected":"" }>已被禁用</option>
								<option value="1" ${func.status==1?"selected":"" }>正常</option>
								<option value="2" ${func.status==2?"selected":"" }>已被删除</option>
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
	$(function() {

		$("#savebtn").on(
				"click",
				function() {
					var isValid = $('#saveForm').form('validate');
					if (!isValid) {
						return;
					}

					var funcUrl = $("#funcUrl").textbox("getText");
					if (funcUrl == null) {
						$("#parentId").combobox("setValue", null);
					}

					$.post("system/functions/updateFunction", $("#saveForm")
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
					}, "json")
				})

		$("#resetbtn").on("click", function() {
			//阻止原有的点击事件行为
			event.preventDefault();
			$("#saveForm").form("clear");
		});
	});
</script>
</html>