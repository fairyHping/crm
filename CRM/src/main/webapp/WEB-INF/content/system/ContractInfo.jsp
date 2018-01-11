<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path %>">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../script.html"%>
<style type="text/css">
#div {
	text-align: center;
	width: 750px;
	margin-left:15px;
	margin-right: 30px;
	margin-top:20px;
}

table{
	border: 1px solid #f5f5f5;
	border-collapse: collapse;
	width: 100%;
}

td{
	border: 1px solid #f5f5f5;
	height: 40px;
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
		<form id="contractForm">
			<div id="main" class="easyui-panel">
				<table style=" border:1px solid ; border-collapse: collapse;height: 500px;width: 95%" >
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1">合同编号：</td>
						<td class="td2">${contract.contractId}</td>
						<td class="td1">签约日期：</td>
						<td class="dueDate"><fmt:formatDate value="${contract.dueDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
					<tr>
						<td class="td1">负责人:</td>
	    				<td class="td2">
	    					<c:forEach items="${requestScope.users }" var="user">
									<c:if test="${user.userId eq contract.ownerUserId}">
										${user.userName }
									</c:if>												
							</c:forEach>
	    				</td>
	    				<td class="td1">合约金额:</td>
	    				<td class="td2">${contract.price }</td>
					</tr>
					<tr>
						<td class="td1">合同生效时间：</td>
						<td class="createTime"><fmt:formatDate value="${contract.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td class="td1">合同到期时间：</td>
						<td class="updateTime"><fmt:formatDate value="${contract.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a id="back" href="system/toListContract" class="easyui-linkbutton" data-options="iconCls:'icon-back'">确定</a></td>
					</tr>
				</table>
			</div>

		</form>
	</div>

		<script type="text/javascript">
		$(function(){
			$("#back").on("click",function(){
				parent.$("#topWindow").window("close");
				})
		 })
	</script>
</body>
</html>