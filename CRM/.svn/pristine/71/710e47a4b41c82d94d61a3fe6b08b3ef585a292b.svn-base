<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%@include file="../../script.html"%>
<title>字典信息</title>
<style type="text/css">
.t1 {
	text-align: right;
	width: 100px;
	line-height: 30px;
	padding-left: 20px;
	padding-right: 20px;
	background-color: #f5f5f5;
}

.t2 {
	text-align: left;
	line-height: 30px;
	padding-left: 60px;
}

td {
	border: 1px #b0b8b8 solid;
	text-align: center;
	line-height: 30px;
}

table {
	width: 90%;
	margin: 10px;
	border: none;
	border-collapse: collapse;
	text-align: center;
}
</style>
</head>
<body style="max-width: 660px;">
	<div style="width: 100%; margin: 8px" align="center">

		<form id="saveForm">
			<div title="字典详细信息" class="easyui-panel"
				style="width: 90%; padding: 20px" align="center">
				<table>
					<tr>
						<td class="t1" class="text-title">字典类型:</td>
						<td class="t2">${dic.type}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">字典名称:</td>
						<td class="t2">${dic.valueName}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">字典值:</td>
						<td class="t2" class="text-content">${dic.value}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">字典状态:</td>
						<td class="t2">${dic.state==1? '正常':dic.state==0?'已禁用':'已删除'}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">创建时间:</td>
						<td class="t2"><fmt:formatDate value="${dic.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					<tr>
						<td class="t1" class="text-title">修改时间:</td>
						<td class="t2"><fmt:formatDate value="${dic.updateTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>

				</table>
			</div>
		</form>
	</div>
</body>
</html>