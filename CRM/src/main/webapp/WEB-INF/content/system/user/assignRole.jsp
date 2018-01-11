<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";
%>
<!DOCTYPE html>
<html>
  <head>
        <base href="<%=path%>">
        <meta charset="UTF-8">
        <title>分配角色</title>
        <%@include file="../../script.html" %>
    </head>
    <body>
      <input name="userIds" value="${userIds}" type="hidden">
      <table id="roleList"></table>
      <div style="text-align: center;margin-top:10px;">
      	<a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-man'">分配角色</a>
      </div>
      <script type="text/javascript">
		$(function(){
			//为分配按钮添加事件
			$(".assign-button").on("click",function(event){
				event.preventDefault();
				//获取用户id
				var userIds = $("input[name=userIds]").val();
				
				//获取选择roleId
				var rows = $("#roleList").datagrid("getChecked");
				var roleIds = new Array();
				if(rows && rows.length>0){
					$.each(rows,function(index,obj){
						if(obj){
							roleIds.push(obj.roleId);
						}
					});
				}
				
				//发送ajax请求
				$.post("system/users/assign",
						{"userIds":userIds,"roleIds":roleIds.join(",")},
						function(data){
							if(data && data.success){
								//提示用户
								parent.$.messager.show({"title":"提示","msg":data.message,"timeout":6000});
								//关闭当前窗口
								parent.closeTopWindow();
							}else{
								parent.$.messager.alert("警告",data.message);
							}
						},"json");
				
			});
		});
		$(function(){
			$("#roleList").datagrid({
				url : "system/roles/listAll",
				fitColumns : true,
				rownumbers : true,
				idField : "roleId",
				columns : [[
					{field:'roleId',width:80,align:'right',checkbox:true},
					{field:'roleName',title:'角色名',width:80},
					{field:'system',title:'是否系统角色',width:80,formatter:function(value){
						if(value){
							return "是";
						}
						return "否"
					}},
					{field:'note',title:'备注',width:80},
					{field:'status',title:'角色状态',width:80,formatter:function(value){
						if(value == 1){
							return "正常";
						}else if(value == 0){
							return "已禁用";
						}else if(value == 2){
							return "已删除";
						}else{
							return "";
						}
					}}
				 	
				]],
				loadFilter: function(data){
					if(data && data.result){
						return data.result;
					}
					return null;
				},
				onLoadSuccess : function(data){
					//从隐藏获取中获取到用户id
					var userIds = $("input[name=userIds]").val();

					//判断用户的id是否为多个id，如果是唯一的id，发送一个ajax，获取该已经有的角色，设置选中
					if(userIds.indexOf(",") != -1){
						return;
					}
					$.post("system/roles/findByUserId",
							{"userIds":userIds},
							function(data){
								if(data && data.result){
									$.each(data.result,function(index,obj){
										$("#roleList").datagrid("selectRecord",obj.roleId);
									});
								}
							},"json");
					
				}
			});
		});
      </script>
    </body>
</html>