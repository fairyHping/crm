<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String basepath=request.getContextPath();
   String path=request.getLocalAddr()+"://"+request.getServerName()+":"+request.getServerPort()+basepath+"/";
   %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="../../script.html" %>
</head>
<body>
<div style="padding: 10px;background-color: #ECECFF" >
	    		<label>视图：</label>
		    		 <a class="easyui-linkbutton" data-options="iconCls:'icon-more',plain:true">全部</a>
		    		 <a class="easyui-linkbutton add-button" data-options="iconCls:'icon-man',plain:true">我负责的</a>
			    	 <a class="easyui-linkbutton remove-button" data-options="iconCls:'icon-man',plain:true">下属负责的</a>
	    		<span style="|">
	                 <a class="easyui-linkbutton" data-options="iconCls:'icon-man',plain:true">我创建的</a>
	    			 <a class="easyui-linkbutton add-button" data-options="iconCls:'icon-man',plain:true">下属创建的</a>
		    		 <a class="easyui-linkbutton remove-button" data-options="iconCls:'icon-man',plain:true">今日签约</a>
		    		 <a class="easyui-linkbutton edit-bmutton" data-options="iconCls:'icon-man',plain:true">本周签约</a>
		    		 <a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-man',plain:true">本月签约</a>
		    		 <a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-man',plain:true">最近创建</a>
		    		 <a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-cart',plain:true">最近跟新</a>
		    		 <a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-cancel',plain:true">回收站</a>
	    		</span>
	    	</div>
<!-- 工具条  用于查询 增删改查 -->
<div id="toolbar" >
<label style="margin-left:20px;"></label>
	<select id="source" class="easyui-combobox" >
		<option value="-1">任意字段</option>
		<option value="subject">任务主题</option>
		<option value="ownerUserId">负责人</option>
		<option value="creatorUserId">创建人</option>
		<option value="status">任务状态</option>
		<option value="priority">优先级</option>
	</select>
	<select id="contains">
		<option value="1">包含</option>
	</select>
	<input type="text" name="content" id="content" class="easyui-textbox">
    <a id="searchButton" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
    	<span style="margin-left:100px;">
    		<a id="removebutton" class="easyui-linkbutton " data-options="iconCls:'icon-remove',plain:true" style="float: right;margin-right: 20px">删除</a>
    		<a class="easyui-linkbutton " id="add-button" data-options="iconCls:'icon-add',plain:true" style="float: right;margin-right: 20px">添加任务</a>
    		<a class="easyui-linkbutton " data-options="iconCls:'icon-add',plain:true" style="float: right;margin-right: 30px">任务工具</a>
    	</span>
</div>
<table id="TaskList" style="width:100%"></table>
<script type="text/javascript" >
//为分配添加、修改、删除、添加角色按钮绑定事件

			$(function(){
				//搜索
				$("#searchButton").on("click",function(event){
					//阻止默认的连接的跳转行为
					event.preventDefault();
					
					var source=$("#source").val();
					var content=$("#content").textbox("getText");
					var contains=$("#contains").val();
					$("#TaskList").datagrid("load",
							{"condition":{
								"source":source,
								"content":content,
								"contains":contains
								}}
							);			
				});
				//添加
				$("#add-button").on("click",function(event){
					//阻止默认的连接的跳转行为
					event.preventDefault();
					
					//打开新窗口，新窗口中展示角色列表页面
					parent.openTopWindow({width:800,
							height:600,
							title:"添加任务",
							url:"system/task/addTask",
							onClose : function(){
								$("#listTask").datagrid("reload");
							}
						});
				});	

				//删除的方法
				function removeTask(url, taskIds) {
					parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
						if (r) {
							$.post(url, {
								"taskIds" : taskIds
							}, function(data) {
								if (data.success) {
									parent.$.messager.show({
										"title" : "提示",
										"msg" : data.message,
										"timeout" : 6000
									})
									$("#TaskList").datagrid("reload");
								} else {
									parent.$.messager.alert({
										title : "提示",
										msg : data.message
									})
								}
							}, "json")
						}
					});

				}

				/* 删除某一行或多行数据 */
				$("#removebutton").on("click", function(event) {
					//阻止原有的点击事件行为
					event.preventDefault();
					//获取选中的用户，选中的是一整行数据
					var rows = $("#TaskList").datagrid("getChecked");
					//没有选中某一个用户时进行提示
					if (!rows || rows.length < 1) {
						parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
						return;
					}
					var taskIds = new Array();
					$.each(rows, function(index, obj) {
						if (obj) {
							taskIds.push(obj.taskId);
						}
					});

					removeTask("system/task/deleteTask", taskIds.join(","))
				});
			});	
 			
</script>
<script type="text/javascript">
$(function(){
	$("#TaskList").datagrid({
		url : "system/task/listTask",
		toolbar : "#toolbar",
		pagination : true,
		fitColumns : true,
		rownumbers : true,
		idField : "taskId",
		columns : [[
			{field:'taskId', title:'全选',width:80,align:'center',checkbox:true},
			{field:'subject',title:'主题',align:'center',width:80,},
			{field:'aboutUsers',title:'关联信息',align:'center',width:80},
			{field:'user',title:'负责人',align:'center',width:80,formatter:function(value){
				if(value ){
					
					return value.userName;
				}
				return "";
			}},
			{field:'status',title:'状态',align:'center',width:80,},
			{field:'priority',title:'优先级',align:'center',width:80},
			{field:'user1',title:'创建人 ',align:'center',width:80,formatter:function(value){
				if(value ){
					
					return value.userName;
				}
				return "";
			}},
			{field:'dueDate',title:'截止时间',align:'center',width:80,formatter:function(value){
				if(value ){
					var date=new Date();
					return value-date;
				}
				return "";
			}},
			{field:'opreation',title:'操作',align:'center',width:80,formatter:function(value,rowData,index){
                return "<a href='javascript:void(0)' onclick='edit("+rowData.taskId+")'>编辑 </a>&nbsp;&nbsp;" 
                +  "<a href='javascript:void(0)' onclick='detail("+rowData.taskId+")'>查看</a>&nbsp;&nbsp;"
                +"<a href='javascript:void(0)' onclick='close("+rowData.taskId+")'>关闭</a>"                        
                }},
		 	
		]],
		loadFilter: function(data){
			if(data && data.result){
				return data.result;
			}
			return null;
		}
	});
});
//编辑任务
function edit(id){	          
	 	parent.openTopWindow({url:"system/task/updateTask?taskId="+id,
	 	title:"修改产品信息",	   		 	
	 	 width : 750,
    height : 600,
	})    	          
}   
//查看任务
function detail(id){	          
	 	parent.openTopWindow({url:"system/task/taskInfo?taskId="+id,
	 	title:"修改产品信息",	   		 	
	 	 width : 750,
    height : 600,
	})    	          
}   
</script>
</body>
</html>