<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>编辑客户池</title>
<%@include file="../../script.html"%>
<style type="text/css">
.td1 {
	background-color: #f5f5f5;
	width: 100;
}

table {
	border-collapse: collapse;
	border-color: #f5ffff;
	margin: 30px auto 0;
	background-color: white;
}

body {
	color: black;
	background-color: #f5f5f5;
}

td {
	min-width: 90px
}

tr {
	height: 60px
}
</style>
</head>
<body>
	<div id="div">
		<form id="leadsForm">
			<div id="main" class="easyui-panel">
				<table style="text-align: center">
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1">创建者：</td>
						<td class="td2"><input type="text" name="creatorUserId"
							id="creatorUserId" class="easyui-combobox"
							data-options="required:true" value="${customer.cUser.userName}"></td>
						<td class="td1">客户名：</td>
						<td class="td2"><input type="hidden"
							name="customerId" value="${customer.customerId }"> <input
							type="text" name="name" value="${customer.name }"
							class="easyui-textbox theme-textbox-radius"
							data-options="required:true"></td>
					</tr>
					<tr>
						<td class="td1">客户行业：</td>
						<td class="td2"><input type="text" name="industry"
							value="${customer.industry }"
							class="easyui-textbox theme-textbox-radius"></td>
						<td class="td1">邮编：</td>
					     <td class="td2"> 
						<input type="text" name="zipCode" value="${customer.zipCode }"
							class="easyui-textbox theme-textbox-radius"
							data-options="width:175px">
					
					</tr>
					
				<tr>
				        <td class="td1">创建时间：</td>
						 <td class="td2"> 
						<input name="createTime" id="createTime" class="easyui-datetimebox"
							value="<fmt:formatDate value='${customer.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
							</td>
						
						<td class="td1">更新时间：</td>
						 <td class="td2"> 
						<input name="updateTime" id="updateTime" class="easyui-datetimebox"
							value="<fmt:formatDate value='${customer.updateTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" >
						</td>
					</tr>
					<tr>
						
						 <td class="td1">评分：</td>
					     <td class="td2"> 
						<input type="text" name="rating" value="${customer.rating}"
							class="easyui-textbox theme-textbox-radius">
						</td>
				
					</tr>
	            <tr>
						<td class="td1">联系地址：</td>
						<td  class="td2" colspan="3"><select class="easyui-combobox" name="address">
								<option>北京市</option>
								<option>上海</option>
								<option>湖北</option>
						</select> <select style="width: 120px">
								<option>全部</option>
								<option>武汉</option>
								<option>洛阳</option>
						</select> <select style="width: 120px">
								<option>全部</option>
								<option>武昌区</option>
								<option>洪山区</option>
						</select> <select style="width: 120px">
								<option>街道信息</option>
								<option>八一路</option>
								<option>榕苑路</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a
							class="easyui-linkbutton save"
							data-options="iconCls:'icon-ok',plain:true">保存</a> <a
							class="easyui-linkbutton back-button" href="javascript:void(0);"
							data-options="iconCls:'icon-back',plain:true">返回</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
$(function() {

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
	/* 获取所有联系人信息 */
	$('#name').combobox({
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
	//编辑客户信息
	$(".save").on(
			"click",
			function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				$.post("system/customer/editPool", $("#leadsForm").serialize(),
						function(data) {
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

				$(".back-button").on("click", function() {
					parent.$("#topWindow").window("close");
				})

			});
});
</script>
</html>