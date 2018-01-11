<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta content="text/html; charset=UTF-8">
<title>发送短信</title>
<%@include file="../../script.html"%>
<style type="text/css">
p {
	font-size: 13px;
	font-family: "微软雅黑";
	line-height: 17px;
}
</style>
</head>
<body>
	<div style="width: 100%; height:100%">
		<div
			style="width: 18%; height: 80%; float: left; margin: 15px; padding: 10px; border: 1px solid #d1d1d1; background: #f5f5f5">
			<h4 style="margin: 25px">操作提示：</h4>
			<p>
				1.手机号码标准格式为：<font color="red">&emsp;13888888888</font>
			</p>
			<p>2.群组发送短信时，请换行间隔每个客户，如：</p>
			<p style="color: red">13188888888</p>
			<p style="color: red">13288888888</p>
			<p>
				3.如需在短信中加入姓名信息，请在短信内容中以<font color="red">{$name}</font>代替，<font
					color="red">手机格式必须如下：</font>
			</p>
			<p style="color: red">13188888888,张三</p>
			<p style="color: red">13288888888,李四</p>
			<p style="color: red">4.请不要在短信内容中填写特殊字符，包括换行符</p>
			<p>5.短信内容不得多余65个字(其中空格，数字，字母，汉字均为一个字)</p>
			<p>6.同一手机号间隔发送时间不得少于20秒</p>
			<p>7.请仔细阅读页面右方的使用说明，请严格按照系统设定标准格式发送短信</p>
		</div>
		<form method="post" id="form">
		<div style="width: 22%; height: 100%; float: left; margin: 15px;">
			<div
				style="background: #d9edf7; height: 12%; width: 85%; border-radius: 5px; border: 1px solid #d1d1d1; color: #79b4d6">
				<br>
				<p>&emsp;&emsp;在此输入收件人手机号</p>
				<p>&emsp;&emsp;&emsp;注意：多个联系人换行隔开</p>
			</div>
			<div style="height: 88%; border-radius: 5px;">
				<textarea name="telephone" id="telephone" rows="20" cols="25" style="font-size: 18px" required="required">${telephone } </textarea>
			</div>
		</div>
		<div style="width: 22%; height: 80%; float: left; margin: 15px;">
			
			<div
				style="background: #d9edf7; height: 16%; width: 85%; border-radius: 5px; border: 1px solid #d1d1d1; color: #79b4d6">
				<br>
				<p>&emsp;&emsp;在此输入短信内容</p>
				<p>
					&emsp;&emsp;&emsp;注意：<font color="red">请务必阅读左侧提示</font>
				</p>
			</div>
			<div>
				<textarea name="content" id="content" rows="22" cols="37" required="required"
					style="color: #7a868c; font-size: 10px">${contactsName } </textarea>
			</div>
			<p>
				您还可以输入<span class="num" style="color:red;">65</span>个字
			</p>
			<br> <a class="easyui-linkbutton" id="send"
				data-options="iconCls:'icon-redo',plain:true">发送</a>
		</div>
		</form>
		<div
			style="width: 18%; height: 80%; float: left; margin: 15px; padding: 10px; border: 1px solid #d1d1d1; background: #f5f5f5; font-size: 10px">
			<h4 style="margin: 25px">使用说明：</h4>
			<p>(您使用本系统发送短信，就证明您同意并接受以下内容)</p>
			<p>1.不得发送包含以下内容、文字的短信息内容：非法的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的、淫秽的信息；教唆他人构成犯罪行为的信息、危害国家安全的信息；及任何不符合国家法律、国际惯例、地方法律规定的信息。</p>
			<br>
			<p>2.不能违反运营商规定,不得发送竞争产品的广告，不能按手机号形式进行广告、业务上的宣传等，不得发送与本行业无关，和移动运营商限制和禁止发送的消息，特别是广告类信息、群发短信等，对违反此声明产生的一切后果由发送者及其单位承担。</p>
			<br>
			<p>3.最好不要在晚22:00至早7:00时段发送短信，以免引起客户反感。</p>
		</div>
	</div>
	
<script type="text/javascript">

		
$(function(){
	
	//判断短信内容剩余字数
	$("#content").on("keydown", function() {
		var content = $("#content").val().length;
		$(".num").text(65 - content);
	})

	//发送
	$("#send").on("click", function() {
		var isValid = $("#form").form('validate');
		if(!isValid){
			return;
			}
		$.post("system/sale/sendSMS", $("#form").serialize(),function(data){
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