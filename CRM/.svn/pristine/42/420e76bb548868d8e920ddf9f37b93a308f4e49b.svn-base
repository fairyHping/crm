<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path %>">
<meta charset="UTF-8">
<title>发送邮件</title>
<%@include file="../../script.html" %>
</head>
<body>
<div style="width: 100%; height:100%">
	<div
			style="width: 18%; height: 80%; float: left; margin: 15px; padding: 10px; border: 1px solid #d1d1d1; background: #f5f5f5">
			<h4 style="margin: 25px">操作提示：</h4>
			<p>
				1.群发邮件时，以换行间隔每个客户，如：<font color="red">&emsp;123@5kcrm.com<br>321@5kcrm.com</font>
			</p>
			<p>
				2.如需在内容中加入姓名信息，请邮箱内容中以<font color="red">{$name}</font>代替，<font
					color="red">收件人地址姓名请跟在邮箱后面，如下所示：</font>
			</p>
			<p style="color: red">123@5kcrm.com,张三</p>
			<p style="color: red">321@5kcrm.com,李四</p>
			<p>发件内容中的{name}会自动替换为邮箱之后的姓名</p>
			<p style="color: red">3.请不要在邮件内容中填写特殊字符，包括换行符</p>
			
		</div>
		<form id="form" method="post">
		<div style="width: 22%; height: 100%; float: left; margin: 15px;">
			<div
				style="background: #d9edf7; height: 12%; width: 85%; border-radius: 5px; border: 1px solid #d1d1d1; color: #79b4d6">
				<br>
				<p>&emsp;&emsp;收件人邮箱</p>
				<p>&emsp;&emsp;&emsp;注意：多个收件人换行隔开</p>
			</div>
			<div style="height: 88%; border-radius: 5px;">
				<textarea name="to" id="to" rows="20" cols="25" style="font-size: 18px" required="required"></textarea>
			</div>
		</div>
		<div style="width: 50%; height: 80%; float: left;">
			
			<div>
				<br>
				<p>邮件主题：</p>
				<p>
					<input type="text" style="width: 70%; " name="subject" id="subject">
				</p>
			</div>
			<div>
				<p>邮件内容：</p>
				<textarea name="content" id="content" rows="22" cols="80" required="required"
					style="color: #7a868c; font-size: 10px"></textarea>
			</div>
			<br> <a class="easyui-linkbutton" id="send"
				data-options="iconCls:'icon-redo',plain:true">发送</a>
		</div>
		</form>
		</div>
		<script type="text/javascript">

		
$(function(){

	//发送
	$("#send").on("click", function() {
		var isValid = $("#form").form('validate');
		if(!isValid){
			return;
			}
		$.post("system/sale/sendEmail", $("#form").serialize(),function(data){
			if (data.success) {
				parent.$.messager.alert({
   					title:"提示",
   					"msg":data.message,
   				})
   				parent.$("#topWindow").window("close")
			} else {
				$.messager.alert({
   					"title":"提示",
   					"msg":data.message
   				})
			}
		}, "json")
	})
});

	
	
</script>
</body>
</html>