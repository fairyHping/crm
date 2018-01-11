<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();//获取应用程序的根路径
	//获取应用程序的全路径
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ basePath + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href=<%=path%>>
<meta charset="UTF-8">
<title></title>
<%@include file="../../script.html"%>
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
		<form id="taskForm">
			<div id="main" class="easyui-panel">
				 <table style=" border:1px solid ; border-collapse: collapse;height: 500px;width: 95%" >
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1">主题：</td>
						<td class="td2">
						<input name="taskId" type="hidden" value="${task.taskId}">
						<input name="subject" class="easyui-textbox" data-options="required:true" value="${task.subject}">
						</td>
						<td class="td1">负责人：</td>
						<td class="td2">
						<select name="ownerUserId" data-options="required:true" class="easyui-combobox" style="width: 170px">
							<c:forEach items="${requestScope.users }" var="user">
								<c:choose>
									<c:when test="${user.userId eq task.ownerUserId}">
										<option value="${user.userId}" selected="selected">${user.userName }</option>
									</c:when>
									<c:otherwise>
										<option value="${user.userId}">${user.userName }</option>
									</c:otherwise>
								</c:choose>						
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="td1">任务相关人：</td>
						<td class="td2"><input name="aboutUsers" class="easyui-textbox" value="${task.aboutUsers }"></td>
						<td class="td1">创建人：</td>
						<td class="td2">
							<select name="creatorUserId" data-options="required:true" class="easyui-combobox" style="width: 170px">
							<c:forEach items="${requestScope.users }" var="user">
								<c:choose>
									<c:when test="${user.userId eq task.creatorUserId}">
										<option value="${user.userId}" selected="selected">${user.userName }</option>
									</c:when>
									<c:otherwise>
										<option value="${user.userId}">${user.userName }</option>
									</c:otherwise>
								</c:choose>						
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
	    			<td class="td1">状态:</td>
	    			<td class="td2">
	    				<select name="status" class="easyui-combobox" style="width: 170px" >
	    					<option value="未启用">未启用</option>
	    					<option value="正常">正常</option>
	    					<option value="禁用">禁用</option>
	    				</select>
	    			<td class="td1">优先级:</td>
	    			<td class="td2">
	    				<select name="priority" class="easyui-combobox" style="width: 170px">
	    					<option value="高">高</option>
	    					<option value="中">中</option>
	    					<option value="底">底</option>
	    				</select>
	    			</td>
	    		</tr>
					<tr>
						<td class="td1">截止日期：</td>
						<td class="td2"><input name="dueDate" class="easyui-datetimebox"></td>
						<td class="td1">更新时间：</td>
						<td class="td2"><fmt:formatDate value="${task.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
					<tr>
						<td colspan="4" id="other"><strong>附加信息</strong></td>
					</tr>
					<tr>
						<td class="td1">描述：</td>
						<td colspan="3" class="td2"><textarea class="theme-textbox-radius"
								rows="5" cols="50" name="description"
								data-options="validType:'maxLength[150]'"></textarea></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a id="updateBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
							style="margin-right: 20px">保存</a> <a id="resetBtn"
							class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	 $(function () {
		var createTime= new Date($('.createTime').text()).toLocaleString();
		$('.createTime').text(createTime);
		var updateTime= new Date($('.updateTime').text()).toLocaleString();
		$('.updateTime').text(updateTime);
		 
	 });
	</script>
	<script type="text/javascript">
	$(function(){
		/* 获取到下拉列表中的数据 */
	
		$("#updateBtn").on("click",function(event){
		//阻止原有的点击事件行为
			event.preventDefault();
			
		$.post("system/task/doUpdateTask",$("#taskForm").serialize(),function(data){				
				if(data.success){
	 				parent.$.messager.alert({
	     				title:"提示",
	     				msg:data.message,
	 				}) 
	 				parent.$("#topWindow").window("close")      				
				}else{
					$.messager.alert({
	         			title:"提示",
	         			msg:data.message
	  			})
				}
			},"json")			
		
	});
	
		$("#resetbtn").on("click",function(event){
		//阻止原有的点击事件行为
			event.preventDefault();
			$("#taskForm").form("clear");
		});	
	});
</script>
</body>
</html>