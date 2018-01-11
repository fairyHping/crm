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
<title>修改线索</title>
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
	padding-right: 30px;
}
</style>
</head>
<body>
	<div id="div">
		<form id="leadsForm">
			<div id="main" class="easyui-panel" style="padding-left:10px">
				<table style="text-align: center" align="center">
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1">负责人：</td>
						<td class="td2"><input name="leadsId" type="hidden"
							value="${leads.leadsId}"> <select name="ownerUserId"
							id="ownerUserId" class="easyui-combobox" style="width: 175px">
								<c:forEach items="${users}" var="user">
										<c:if test="${user.userId eq leads.ownerUserId }">
											<option value="${user.userId}" selected="selected">${user.userName}</option>
										</c:if>
									
									<option value="${user.userId}" >${user.userName}</option>
								</c:forEach>
						</select> </td>
						<td class="td1">公司名：</td>
						<td class="td2"><input name="name" class="easyui-textbox"
							data-options="required:true" value="${leads.name}"></td>
					</tr>
					<tr>
						<td class="td1">来源：</td>
						<td class="td2"><select name="source" class="easyui-combobox"
							style="width: 175px">
								<c:forEach items="${sources}" var="s">
									<c:if test="${leads.source eq s }">
										<option value="${leads.source}" selected="selected">${leads.source}</option>
									</c:if>
									<option value="${s }">${s }</option>
								</c:forEach>
						</select></td>
						<td class="td1">联系人姓名：</td>
						<td class="td2"><input name="contactsName"
							class="easyui-textbox" data-options="required:true"
							value="${leads.contactsName }"></td>
					</tr>
					<tr>
						<td class="td1">职位：</td>
						<td class="td2"><input name="position" class="easyui-textbox"
							value="${leads.position }"></td>
						<td class="td1">尊称：</td>
						<td class="td2"><select name="saltname" id="saltname"
							class="easyui-combobox" style="width: 175px">
								<option value="先生" ${leads.saltname=='先生'?"selected":"" }>先生</option>
								<option value="女士" ${leads.saltname=='女士'?"selected":""}>女士</option>
						</select></td>
					</tr>
					<tr>
						<td class="td1">手机：</td>
						<td class="td2"><input name="mobile" class="easyui-textbox"
							data-options="required:true,validType:'mobile'"
							value="${leads.mobile }"></td>
						<td class="td1">邮箱：</td>
						<td class="td2"><input name="email" class="easyui-textbox"
							data-options="validType:'email'" value="${leads.email }"></td>
					</tr>
					<tr>
						<td class="td1">地址：</td>
						<td class="td2"><input type="text" class="easyui-textbox"
							name="address" id="address" value="${leads.address }"> <td class="td1">最后一次领取线索时间：</td>
						<td class="td2"><input name="haveTime"
							class="easyui-datetimebox" data-options="required:true"
							value='<fmt:formatDate value="${leads.haveTime }" pattern="yyyy-MM-dd HH:mm:ss"/>'></td>	
					</tr>
					<tr>
						<td class="td1">下次联系时间：</td>
						<td class="td2"><input name="nextstepTime"
							class="easyui-datetimebox"
							value='<fmt:formatDate value="${leads.nextstepTime }" pattern="yyyy-MM-dd HH:mm:ss"/>'></td>
						<td class="td1">下次联系内容：</td>
						<td class="td2"><input name="nextstep" class="easyui-textbox"
							value="${leads.nextstep }"></td>
					</tr>
					<tr>
						<td colspan="4" id="other"><strong>附加信息</strong></td>
					</tr>
					<tr>
						<td class="td1">备注：</td>
						<td class="td2" colspan="3"><textarea
								class="theme-textbox-radius" rows="5" cols="50" name="leadnote"
								data-options="validType:'maxLength[150]'">${leads.leadnote }</textarea></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a id="saveBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
							style="margin-right: 20px">保存</a> 
							<a id="leadsPool" class="easyui-linkbutton" style="margin-right: 20px">放入线索池</a>
							<a id="resetBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	//自定义验证
	$.extend(
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
						}
					});

	$(function() {
		$("#saveBtn").on(
				"click",
				function(event) {
					//阻止原有的点击事件行为
					event.preventDefault();
					var isValid = $('#leadsForm').form('validate');
					if (!isValid) {
						return;
					}
					var saltname = $("#saltname");
					saltname = $("#saltname") == '--请选择--' ? null : saltname;
					var source = $("#source");
					source = $("#source") == '--请选择--' ? null : source;
					/* var address=$("#address");
					var province=$("#s_province").val();
					var city=$("#s_city").val();
					var county=$("#s_county").val();
					address=province+city+county; */
					$.post("system/leads/updateLeads", $("#leadsForm")
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
			$("#leadsForm").form("clear");
		});
		$("#leadsPool").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			$("#ownerUserId").combobox("setValue","");
		});
	});
</script>
</html>