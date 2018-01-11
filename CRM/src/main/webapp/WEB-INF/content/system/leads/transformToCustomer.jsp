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
<meta charset="UTF-8">
<title>线索转换为客户</title>
<%@include file="../../script.html"%>
<style type="text/css">
#div {
	text-align: center;
	width: 720px;
	margin-left: 20px;
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
}

.td2 {
	text-align: left;
}

.td3 {
	text-align: left;
	padding-right: 50px;
}
</style>
</head>
<body>
	<div id="div">
		<form id="form">
			<div id="main" class="easyui-panel" style="padding-left: 10px">
				<table style="text-align: center" align="center">
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1">负责人：</td>
						<td class="td3"><select name="ownerUserId" id="ownerUserId"
							class="easyui-combobox" style="width: 175px" class="combo">
								<c:forEach items="${users}" var="user">
									<c:if test="${user.userId eq leads.ownerUserId }">
										<option value="${user.userId}" selected="selected">${user.userName}</option>
									</c:if>
									<option value="${user.userId}">${user.userName}</option>
								</c:forEach>
						</select></td>
						<td class="td1">客户名称：</td>
						<td class="td2"><input name="name" id="name"
							class="easyui-textbox" data-options="required:true"
							value="${leads.name }" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="td1">信息来源：</td>
						<td class="td3"><input class="easyui-textbox" name="origin"
							id="origin" class="cls" value="${leads.source}"></td>
						<td class="td1">客户所属行业：</td>
						<td class="td2"><input name="industry" id="industry"
							class="easyui-textbox" class="cls"></td>
					</tr>

					<tr>
						<td class="td1">公司性质：</td>
						<td class="td3">
						<input type="radio" name="ownership"
							class="cls" value="合资">合资 
							<input type="radio" name="ownership"
							class="cls" value="国企">国企
							<input type="radio" name="ownership"
							class="cls" value="外企">外企
							 <input type="radio" name="ownership"
							class="cls" value="民营">民营</td>
						<td class="td1" align="right" class="cls">邮编：</td>
						<td class="td2"><input name="zipCode" class="easyui-textbox"
							data-options="validType:'zipCode'" id="zipCode" class="cls"></td>
					</tr>
					<tr>

						<td class="td1">年营业额：</td>
						<td class="td3"><input name="annualRevenue"
							class="easyui-textbox"
							data-options="required:true,validType:'digits'" class="cls"></td>
						<td class="td1">地址：</td>
						<td class="td2"><input type="text" class="easyui-textbox"
							name="address" id="address" value="${leads.address }" class="cls"></td>
					</tr>

					<tr>
						<td class="td1">评分：</td>
						<td class="td3">
						<input type="radio" name="rating" class="cls"
							value="一星">一星 
							<input type="radio" name="rating"
							class="cls" value="二星">二星 
							<input type="radio"
							name="rating" class="cls" value="三星">三星
							<input type="radio"
							name="rating" class="cls" value="四星">四星
							<input type="radio"
							name="rating" class="cls" value="五星">五星
							
							</td>
					</tr>
					<tr>
						<td colspan="4" id="other"><strong>附加信息</strong></td>
					</tr>
					<tr>
						<td class="td1">联系人姓名：</td>
						<td class="td3"><input name="contactsName"
							class="easyui-textbox" data-options="required:true"
							value="${leads.contactsName}" data-options="required:true"></td>
						<td class="td1">尊称：</td>
						<td class="td2"><select name="saltname" id="saltname"
							class="easyui-combobox" style="width: 175px" class="combo">
								<option value="先生" ${leads.saltname=='先生'?"selected":"" }>先生</option>
								<option value="女士" ${leads.saltname=='女士'?"selected":""}>女士</option>
						</select></td>
					</tr>

					<tr>
						<td class="td1">手机：</td>
						<td class="td3"><input name="telephone"
							class="easyui-textbox" value="${leads.mobile}" class="cls"></td>
						<td class="td1">邮箱：</td>
						<td class="td2"><input name="email" value="${leads.email}"
							class="easyui-textbox" class="cls"></td>
					</tr>
					<tr>
						<td class="td1">职位：</td>
						<td class="td3"><input name="post" class="easyui-textbox"
							value="${leads.position }" class="cls"></td>

					</tr>
					<tr>
						<td colspan="4" align="center"><a id="saveBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
							style="margin-right: 20px">保存</a> <a id="resetBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>

<script type="text/javascript">
	//自定义验证
	$
			.extend(
					$.fn.validatebox.defaults.rules,
					{
						mobile : {//手机号
							validator : function(value) {
								return /^1[34578][0-9]{9}$/i
										.test($.trim(value));
							},
							message : '手机号码格式不正确'
						},
						email : {
							validator : function(value) {
								return /^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/i
										.test($.trim(value));
							},
							message : '电子邮箱格式不正确'
						},
						zipCode : {
							validator : function(value) {
								return /^[1-9][0-9]{5}$/i.test($.trim(value));
							},
							message : '邮政编码格式不正确'

						}
					});

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
					$.post("system/leads/transformToCustomer", $("#form")
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
			$(".combo").combobox("setValue", "");
			$(".cls").textbox("setText", "");

		});

	});
</script>
</html>