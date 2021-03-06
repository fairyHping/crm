<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path %>">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../script.html"%>
<style type="text/css">
.t1{
	text-align: right;
}
.t1 input{
	text-align: left;
}

</style>
</head>
<body>
	<div align="center" style="width: 90%;margin:0 auto; border: 1px solid gray;">
	<form id="updateForm">
		<table 
			style="margin:0 auto;padding-top:20xp;height: 560px" >
			<tr>
				<th align="left" style="font-size: 20px;" colspan="4">基本信息</th>
				<input name="contractId" type="hidden" value="${ contract.contractId}">
				
			</tr>
			<tr>
				<td class="t1">合同编号:</td>
				<td >${contract.number }<input name="number" type="hidden" value="${ contract.number}"></td>
				<td class="t1">签约时间:</td>
				<td><input name="dueDate" id="dd" type="text" class="easyui-datebox"
					required="required" style="width:200px" value="${contract.dueDate }"></td>
			</tr>
			<tr>
				<td class="t1">负责人:</td>
				<td >
					 <select name="userId" class="easyui-validatebox sj" data-options="required:true" id="selectcustomer" style="width:200px;height: 25px">
						<!-- <option value="-1" selected="selected">请选择负责人</option> -->
						<c:forEach items="${requestScope.users }" var="user">
								<option value="${user.userId }" ${user.userId eq user.userId ? "selected":"" }>${user.userName }</option>
							</c:forEach>
					</select>
				</td>
				<td class="t1">合同金额(元):</td>
				<td><input name="price" class="easyui-textbox textbox-radius" style="width:200px" value="${contract.price }"></td>
			</tr>
			<tr>
				<td class="t1">合同生效时间:</td>
				<td><input id="dd" name="createTime" type="text" class="easyui-datebox"
					required="required" style="width:200px" value="${contract.createTime }"></td>
				<td class="t1">合同到期时间:</td>
				<td><input id="dd" name="updateTime" type="text" class="easyui-datebox"
					required="required" style="width:200px" value="${contract.updateTime }"></td>
			</tr>
			<tr>
				<td class="t1">条件和条款:</td>
				<td colspan="3"	><input name="content" class="easyui-textbox" style="width:700px;height: 100px" multiline="true" > </td>
			</tr>
			<tr>
				<td class="t1">合同描述(不多于150个字):</td>
				<td colspan="3"><input name="description" class="easyui-textbox" style="width:700px;height: 100px" multiline="true" > </textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a id="save" href="javascript:void(0);" class="easyui-linkbutton"
					data-options="iconCls:'icon-ok'">保存</a></td>
				<td colspan="2"><a id="back" href="system/toListContract" class="easyui-linkbutton"
				 data-options="iconCls:'icon-back'">重置</a></td>
			</tr>
		</table>

	</form>
</div>

		<script type="text/javascript">
		$(function(){
			$("#save").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				$.post("system/contract/toUpdateContract",
						$("#updateForm").serialize(),function(data){
	    			if(data.success){
	    				parent.$.messager.show({"title":"提示","msg":data.message,"timeout":6000});
	       				parent.$("#topWindow").window("close")
						
	     			}else{
	    				parent.$.messager.alert({
		           			title:"提示",
		           			msg:data.message
				        })
				     } 			
	    		},"json")
				
			});
			
			$("#back").on("click",function(){
				//阻止原有的点击事件行为
				event.preventDefault();
				$("#updateForm").form("clear");
			})
	});
	</script>
</body>
</html>