<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String basePath = request.getContextPath();
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ basePath + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加客户</title>
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
	min-width: 70px
}

tr {
	height: 50px
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
		<form id="addForm">
			<div id="main" class="easyui-panel">
				<table style="text-align: center">
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1" align="right">创建者：</td>
						<td><input type="text" name="creatorUserId"
							id="creatorUserId" class="easyui-combobox" data-options="required:true"></td>
						<td class="td1" align="right">客户名称：</td>
						<td><input type="text" name="name" class="easyui-combobox" data-options="required:true" ></td>
					</tr>
					<tr>
						<td class="td1" align="right">客户行业：</td>
						<td><select class="easyui-combobox" data-options="required:true" style="width:165px"  name="industry">
								<option>--请选择--</option>
								<option>IT</option>
								<option>卖肉</option>
						</select></td>
						<td class="td1" align="right">客户信息来源：</td>
						<td><select class="easyui-combobox"  data-options="required:true" style="width:165px"  name=origin>
								<option>百度</option>
								<option>新闻</option>
								<option>市场</option>
						</select></td>
					</tr>
					<tr>
						<td class="td1" align="right">公司性质：</td>
						<td><input type="radio" name="ownership">合资 <input
							type="radio" name="ownership">国企 <input type="radio"
							name="ownership">民营</td>
						<td class="td1" align="right">邮编：</td>
						<td><input type="text" name="zipCode" class="easyui-combobox" ></td>
					</tr>
					
				<tr>
				        <td class="td1">创建时间：</td>
						 <td class="td2"> 
						<input name="createTime" id="createTime" type="text"
						class="easyui-datebox" required="required" style="width: 200px" >
						</td>
						
						<td class="td1">更新时间：</td>
						 <td class="td2"> 
						<input name="updateTime" id="updateTime" 
							class="easyui-datebox" required="required" style="width: 200px"  >
						</td>
					</tr>
					<tr>
						
						<td class="td1" align="right">评分：</td>
						<td><input type="radio" name="rating">一星 <input
							type="radio" name="rating">二星 <input type="radio"
							name="rating">三星</td>
				</tr>
	            <tr>
						<td class="td1" align="right">联系地址：</td>
						<td colspan="3"><select  name="address">
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
							class="easyui-linkbutton saveAndSet"
							data-options="iconCls:'icon-add',plain:true">保存并新建</a> <a
							class="easyui-linkbutton back-button" href="javascript:void(0);"
							data-options="iconCls:'icon-back',plain:true">返回</a></td>
					</tr>
					
			</table>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		

        
			
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

         $(function(){
 			
 			/* 获取所有客户信息 */
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
			$(".back-button").on("click", function() {
				parent.$("#topWindow").window("close");
			})

			//添加客户
			$(".save").on(
					"click",
					function(event) {
						event.preventDefault();
						
						$.post("system/customer/addCare", $("#addForm").serialize(),
							function(data) {
							if (data.success) {
								parent.$.messager.alert({
									title : "提示",
									msg : data.message,
								})
								parent.$("#topWindow").window("close")
							} else {
								$.messager.alert({
									title : "提示",
									msg : data.message,
								})
							}
						}, "json")
					})
		});
	</script>
    </body>		
</html>	