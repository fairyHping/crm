<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<title>新建线索</title>
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
		<form id="leadsForm">
			<div id="main" class="easyui-panel" style="padding-left:10px">
				<table style="text-align: center" align="center">
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1">负责人：</td>
						<td class="td3"><input name="ownerUserId" id="ownerUserId"
							class="easyui-combobox"> </td>
						<td class="td1">公司名：</td>
						<td class="td2"><input name="name" class="easyui-textbox"
							data-options="required:true"></td>
					</tr>
					<tr>
						<td class="td1">来源：</td>
						<td class="td3">
						<select name="source" class="easyui-combobox" style="width:175px">
							<option value="-1">--请选择--</option>
							<c:forEach items="${sources }" var="s">
							<option value="${s }">${s }</option>
							</c:forEach>
							</select></td>
						<td class="td1">联系人姓名：</td>
						<td class="td2"><input name="contactsName"
							class="easyui-textbox" data-options="required:true"></td>
					</tr>
					<tr>
						<td class="td1">职位：</td>
						<td class="td3"><input name="position" class="easyui-textbox"></td>
						<td class="td1">尊称：</td>
						<td class="td2">
						<select name="saltname" id="saltname" class="easyui-combobox" style="width:175px">
							<option value="-1">--请选择--</option>
							<option value="先生">先生</option>
							<option value="女士">女士</option>
						</select></td>
					</tr>
					<tr>
						<td class="td1">手机：</td>
						<td class="td3"><input name="mobile" class="easyui-textbox"
							data-options="required:true,validType:'mobile'"></td>
						<td class="td1">邮箱：</td>
						<td class="td2"><input name="email" class="easyui-textbox" data-options="validType:'email'"></td>
					</tr>
					<tr>
						<td class="td1">地址：</td>
						<td class="td2">
							<input type="text" class="easyui-textbox" name="address" id="address">
						</td>
						<td class="td1">最后领取线索时间：
						</td>
						<td class="td2">
							<input type="text" class="easyui-datetimebox" data-options="required:true" name="haveTime" id="haveTime">
						</td>

					</tr>
					<tr>
						<td class="td1">下次联系时间：</td>
						<td class="td3"><input name="nextstepTime"
							class="easyui-datetimebox"></td>
						<td class="td1">下次联系内容：</td>
						<td class="td2"><input name="nextstep" class="easyui-textbox"></td>
					</tr>
					<tr>
						<td colspan="4" id="other"><strong>附加信息</strong></td>
					</tr>
					<tr>
						<td class="td1">备注：</td>
						<td class="td2" colspan="3"><textarea class="theme-textbox-radius"
								rows="5" cols="50" name="leadnote"
								data-options="validType:'maxLength[150]'"></textarea></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a id="saveBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
							style="margin-right: 20px">保存</a> 
							<a id="leadsPool"
							class="easyui-linkbutton" style="margin-right: 20px">放入线索池</a>
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
		$.fn.validatebox.defaults.rules,{
				mobile : {//手机号
					validator : function(value) {
					return /^1[34578][0-9]{9}$/i.test($.trim(value));
					},
					message : '手机号码格式不正确'
				},
				email : {     
			           validator: function(value){     
			               return /^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/i.test($.trim(value));     
			           },     
			           message: '电子邮箱格式不正确'    
			    }
	});

	$(function() {
		/* 获取到下拉列表中的数据 */
		$("#ownerUserId").combobox({
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
		
		$("#saveBtn").on(
				"click",
				function(event) {
					//阻止原有的点击事件行为
					event.preventDefault();
					var isValid = $('#leadsForm').form('validate');
					if(!isValid){
						return;
					}
					$.post("system/leads/addLeads", $("#leadsForm").serialize(),
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