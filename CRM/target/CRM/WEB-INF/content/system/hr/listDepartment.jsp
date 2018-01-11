<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
        <base href="<%=path%>">
        <meta charset="UTF-8">
        <title>用户管理</title>
        <%@ include file="../../script.html" %>
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
	<label style="margin-left:20px;">部门名称：</label><input type="text" name="name" id="content" class="easyui-textbox"> 
	<label style="margin-left:20px;">上级部门：</label>
	<select name="parentId" class="easyui-combobox" id="source">
		<option value="">选择上级部门</option> 
		<c:forEach items="${depts }" var="dept">
	    	<option value="${dept.departmentId }">${dept.name}</option>
	    </c:forEach>
	</select>
	<a class="easyui-linkbutton" id="searchButton" data-options="iconCls:'icon-search',plain:true">查询</a>
	<span style="float:right;margin-right: 10px">
    	<a id="removebutton" class="easyui-linkbutton " data-options="iconCls:'icon-remove',plain:true" style="margin-left: 20px">删除</a>
    		<a class="easyui-linkbutton " id="add-button" data-options="iconCls:'icon-add',plain:true" >添加部门</a>
    	</span>
</div>

<table id="departmemtList" style="width:100%"></table>
<script type="text/javascript" >
		//为分配添加、修改、删除、添加角色按钮绑定事件
			$(function(){
				//搜索
				$("#searchButton").on("click",function(event){
					//阻止默认的连接的跳转行为
					event.preventDefault();
					
					var source=$("#source").val();
					var content=$("#content").textbox("getText");
					$("#departmemtList").datagrid("load",
							{"condition":{
								"source":source,
								"content":content
								}}
							);			
				});
				
				//添加
				$("#add-button").on("click",function(event){
					//阻止默认的连接的跳转行为
					event.preventDefault();
					
					//打开新窗口，新窗口中展示角色列表页面
					parent.openTopWindow({width:650,
							height:400,
							title:"添加任务",
							url:"system/hr/addDepartment",
							onClose : function(){
								$("#departmemtList").datagrid("reload");
							}
						});
				});	

				//删除的方法
				function removeTask(url, departmentIds) {
					parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
						if (r) {
							$.post(url, {
								"departmentIds" : departmentIds
							}, function(data) {
								if (data.success) {
									parent.$.messager.show({
										"title" : "提示",
										"msg" : data.message,
										"timeout" : 6000
									})
									$("#departmemtList").datagrid("reload");
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
					var rows = $("#departmemtList").datagrid("getChecked");
					//没有选中某一个用户时进行提示
					if (!rows || rows.length < 1) {
						parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
						return;
					}
					var departmentIds = new Array();
					$.each(rows, function(index, obj) {
						if (obj) {
							departmentIds.push(obj.departmentId);
						}
					});

					removeTask("system/hr/deleteDepartment", departmentIds.join(","))
				});
			});	
 			
</script>
<script type="text/javascript">
$(function(){
	$("#departmemtList").datagrid({
		url : "system/hr/listDepartment",
		toolbar : "#toolbar",
		pagination : true,
		fitColumns : true,
		rownumbers : true,
		idField : "departmentId",
		columns : [[
			{field:'departmentId',width:80,align:'center',checkbox:true},
			/* {field:'departmentId',title:'部门编号',align:'center',width:80,}, */
			{field:'name',title:'部门名称',align:'center',width:80},
			{field:'dept',title:'上级部门',align:'center',width:80,formatter:function(value){
				if(value ){
					
					return value.name;
				}
				return "";
			}},
			{field:'description',title:'描述',align:'center',width:80},
			{field:'opreation',title:'操作',align:'center',width:80,formatter:function(value,rowData,index){
                return "<a href='javascript:void(0)' onclick='edit("+rowData.departmentId+")'>编辑 </a>&nbsp;&nbsp;"                        
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
//编辑部门
function edit(id){	          
	 	parent.openTopWindow({url:"system/hr/updateDepartment?departmentId="+id,
	 	title:"修改产品信息",	   		 	
	 	 width : 650,
    	height : 400,
    	onClose : function() {
			$("#departmemtList").datagrid("reload");
			$("#departmemtList").datagrid("uncheckAll");
		}
	})    	          
}   
</script>

</body>
</html>