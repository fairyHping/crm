<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>修改密码</title>
<%@include file="../../script.html"%>
<style type="text/css">
#div1 {
	margin: 20px;
}

td {
	height:30px;
	vertical-align: middle;
}

.td1 {
	text-align: right;
	width: 60px;
	padding-right: 5px;
}

input {
	vertical-align: middle;
}
</style>
</head>
<body>
	<div id="div1">
		<div class="content">
			<div title="修改密码" class="easyui-panel">
				<form id="form">
					<table align="center">
						<tr>
							<td class="td1">原始密码：</td>
							<td class="td2"><input type="password" id="oldPassword"
								class="easyui-textbox" name="oldPassword"></td>
						</tr>
						<tr>
							<td class="td1">新密码：</td>
							<td class="td2"><input type="password" id="newPassword"
								class="easyui-textbox"
								data-options="required:true,validType:'length[6,20]'"
								name="newPassword"></td>
						</tr>
						<tr>
							<td class="td1">确认密码：</td>
							<td class="td2"><input type="password" id="validatePassword"
								class="easyui-textbox"
								data-options="required:true,validType:'length[6,20]'"
								name="validatePassword"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center; margin-top: 20px;margin-bottom: 20px">
								<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" id="modify_pwd">保存</a> <a
								class="easyui-linkbutton" data-options="iconCls:'icon-undo'" id="resetBtn">重置</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
    $(function(){
    	$("#modify_pwd").on("click",function(){
    		var isValid = $('#form').form('validate');
			if(!isValid){
				return;
			}
        	var oldPassword=$("#oldPassword").val();
        	var newPassword=$("#newPassword").val();
        	var validatePassword=$("#validatePassword").val();
        	if(!oldPassword){
        		parent.$.messager.alert({
        			title : "提示",
        			msg : "请输入初始密码",
        		})
        		return
        	}
        	if(!newPassword){
        		parent.$.messager.alert({
        			title : "提示",
        			msg : "请输入修改后的密码",
        		})
        		return
        	}
        	if(!validatePassword){
        		parent.$.messager.alert({
        			title : "提示",
        			msg : "请输入确认密码",
        		})
        		return
        	}
        	if(newPassword!=validatePassword){
        		parent.$.messager.alert({
        			title : "提示",
        			msg : "密码输入不一致",
        		})
        		return
        	}
        	$.post("system/users/modify",{"oldPassword":oldPassword,"newPassword":newPassword},function(data){
        		if(data.success){
        			parent.$.messager.show({"title":"提示","msg":data.message,"timeout":6000});
       				parent.$("#topWindow").window("close")
        		}else{
        			parent.$.messager.alert({
       					title:"提示",
       					msg:data.msg
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

</html>