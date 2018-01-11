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
        <title>分配权限</title>
        <%@include file="../../script.html" %>
    </head>
    <body>
      <input name="roleIds" value="${roleIds}" type="hidden">
     
      <div style="text-align: center;margin-top:10px;margin-bottom:10px;">
      	<a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-man'">分配权限</a>
      </div>
      <div style="height: 480px;overflow: auto;margin-bottom: 20px">
       <table id="functionList"  style='width: 100%'></table>
       </div>
      <script type="text/javascript">
		$(function(){
			//为分配按钮添加事件
			$(".assign-button").on("click",function(event){
				event.preventDefault();
				//获取用户id
				var roleIds = $("input[name=roleIds]").val();
				
				//获取选择roleId
				var rows = $("#functionList").datagrid("getChecked");
				var funcIds = new Array();
				if(rows && rows.length>0){
					$.each(rows,function(index,obj){
						if(obj){
							funcIds.push(obj.funcId);
						}
					});
				}
				
				//发送ajax请求
				$.post("system/roles/assign",
						{"roleIds":roleIds,"funcIds":funcIds.join(",")},
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
			$("#functionList").datagrid({
				url : "system/functions/listAll",
				fitColumns : true,
				rownumbers : true,
				idField : "funcId",
				columns : [[
					{field:'funcId',width:80,align : 'center',checkbox:true},
					{field:'funcName',title:'权限名称',width:80},
					{field:'parentFunction',title:'父权限',width:80,align : 'center',formatter:function(value){
						if(value){
							return value.funcName;
						}else{
							return "";
						}
						
					}},
					{field:'funcType',title:'权限类型',width:80,align : 'center',formatter:function(value){
						if(value==1){
							return "菜单权限";	
						}else if(value==0){
							return "按钮权限";	
						}else{
							return "";
						}
						
					}},
					{field:'status',title:'权限状态',width:80,align : 'center',formatter:function(value){
						if(value == 1){
							return "正常";
						}else if(value == 0){
							return "已禁用";
						}else if(value == 2){
							return "已删除";
						}else{
							return "";
						}
					}},
					{field : 'createTime',title : '创建时间',align : 'center',width : 80}, 
					{field : 'updateTime',title : '更新时间',align : 'center',width : 80}
				 	
				]],
				loadFilter: function(data){
					if(data && data.result){
						return data.result;
					}
					return null;
				},
				onLoadSuccess : function(data){
					//从隐藏获取中获取到角色id
					var roleIds = $("input[name=roleIds]").val();

					//判断角色的id是否为多个id，如果是唯一的id，发送一个post，获取该已经有的权限，设置选中
					if(roleIds.indexOf(",") != -1){
						return;
					}
					$.post("system/functions/findByRoleId",
							{"roleIds":roleIds},
							function(data){
								if(data && data.result){
									$.each(data.result,function(index,obj){
										$("#functionList").datagrid("selectRecord",obj.funcId);
									});
								}
							},"json");
					
				}
			});
			
			
	
		});
      </script>
    </body>
</html>