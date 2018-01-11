<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath =request.getContextPath();//获取应用程序的根路径
	//获取应用程序的全路径
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";	
%>
<!DOCTYPE html>
<html>
<head>
<base href=<%=path%>>
<meta name="pragma" content="no-cache">
<meta name="cache-control" content="no-cache">
<meta name="expires" content="0">
<%@include file="../../script.html"%>
<title>Insert title here</title>
<style type="text/css">
.td1 {
	text-align: right;
	height: 35px;
	padding-left: 30px;
}
.td2 {
	text-align:left;
}
</style>
</head>
<body style="max-width: 660px;">
	<div style="width: 100%;" align="center">

		<form id="form">
			<div class="easyui-panel" style="width: 90%; margin-top: 10px;"
				align="center">
			<table style="width: 90%; margin: 10px;" align="center">
				<tr>
					<td class="td1">用户名：</td>
					<td class="td2">
						<input type="hidden" name="userId" value="${user.userId }"> 
						<input type="text" name="userName" value="${user.userName }" 
							class="easyui-textbox" data-options="required:true,validType:'length[3,20]'">
					</td>
				</tr>

				<tr style="display:${empty user ? 'table-row' : 'none'};">
					<td class="td1">密码：</td>
					<td class="td2">
						<input type="password" name="password" value="${user.password }"
							class="easyui-textbox" data-options="required:true,validType:'length[6,20]'">
					</td>
				</tr>

				<tr>
					<td class="td1">联系电话：</td>
					<td class="td2">
						<input type="text" name="phone" value="${user.phone }"
							class="easyui-textbox" data-options="validType:'mobile'">
					</td>
				</tr>
				<tr>
					<td class="td1">电子邮箱：</td>
					<td class="td2">
						<input type="text" name="email" value="${user.email }"
							class="easyui-textbox" data-options="validType:'email'"></td>
				</tr>
				
				<tr>
					<td class="td1">用户状态：</td>
					<td class="td2">
						<select name="status" id="status" style="width:170px" class="easyui-combobox theme-textbox-radius">
							<option value="1" ${user.status==1?"selected":"" }>正常</option>
							<option value="0" ${user.status==0?"selected":"" }>禁用</option>
							<option value="2" ${user.status==2?"selected":"" }>已删除</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td1">描述信息：</td>
					<td class="td2">
						<textarea class="theme-textbox-radius" rows="5"  cols="20" name="note">${user.note}</textarea></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;margin-top: 10px;">
						<a href="javascript:void(0);" id="saveBtn" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a> 
						<a href="javascript:void(0);" id="resetBtn" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>
					</td>
				</tr>
				</table></div>
		</form>

	</div>
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

	
	
		$(function(){
			$("#saveBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				var isValid = $('#form').form('validate');
				if(!isValid){
					return;
				}
				$.post("system/users/updateUser",
						$("#form").serialize(),function(data){
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
			
			$("#resetBtn").on("click",function(event){
				//阻止原有的点击事件行为
				event.preventDefault();
				$("#form").form("clear");
			})
	});
	</script>
</body>
</html>