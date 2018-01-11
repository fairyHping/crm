<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String basepath=request.getContextPath();
   String path=request.getLocalAddr()+"://"+request.getServerName()+":"+request.getServerPort()+basepath+"/";
   %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta charset="UTF-8">
<title>员工管理</title>
 <%@ include file="../../script.html" %>
</head>
<body>

<!-- 工具条  用于查询 增删改查 -->
<div id="toolbar" >
	<label style="margin-left:20px;">员工姓名：</label><input type="text" name="name" id="content" class="easyui-textbox"> 
	<label style="margin-left:20px;">所属岗位：</label>
	<select name="positionId" class="easyui-combobox" id="positionId">
		<option value="">所属岗位</option> 
		<c:forEach items="${positions }" var="pos">
	    	<option value="${pos.positionId }">${pos.name}</option>
	    </c:forEach>
	</select>
	<select name="mgrId" class="easyui-combobox" id="mgrId">
		<option value="">选择上级领导</option> 
		<c:forEach items="${employees }" var="emp">
	    	<option value="${emp.empId }">${emp.name}</option>
	    </c:forEach>
	</select>
	<a class="easyui-linkbutton" id="searchButton" data-options="iconCls:'icon-search',plain:true">查询</a>
	<span style="float:right;margin-right: 10px">
    	<a id="removebutton" class="easyui-linkbutton " data-options="iconCls:'icon-remove',plain:true" style="margin-left: 20px">删除</a>
    		<a class="easyui-linkbutton " id="add-button" data-options="iconCls:'icon-add',plain:true" >添加员工</a>
    	</span>
</div>
<table id="employeeList" style="width:100%"></table>
<script type="text/javascript">
$(function(){
	$("#employeeList").datagrid({
		url : "system/hr/listEmployee",
		toolbar : "#toolbar",
		pagination : true,
		fitColumns : true,
		rownumbers : true,
		idField : "empId",
		columns : [[
			{field:'empId',width:80,align:'center',checkbox:true},
			{field:'name',title:'员工姓名',align:'center',width:80},
			{field:'sex',title:'性别',align:'center',width:80, formatter:function(value){
				if(value==1 ){
					
					return "男";
				}
				if(value==0 ){
					
					return "女";
				}
				return "";
			}}, 
			{field:'position',title:'岗位名称',align:'center',width:80,formatter:function(value){
				if(value){
					
					return value.name;
				}
				return "";
			}},
		 	{field:'dept',title:'所在部门',align:'center',width:80,formatter:function(value){
				if(value ){
					
					return value.name;
				}
				return "";
			}},
			
			{field:'user',title:'创建人',align:'center',width:80,formatter:function(value){
				if(value ){
					
					return value.userName;
				}
				return "";
			}},
			{field:'createTime',title:'创建日期',align:'center',width:80},
			{field:'opreation',title:'操作',align:'center',width:80,formatter:function(value,rowData,index){
                return "<a href='javascript:void(0)' onclick='edit("+rowData.empId+")'>编辑 </a>&nbsp;&nbsp;"                        
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
	 	parent.openTopWindow({url:"system/hr/updateEmployee?empId="+id,
	 	title:"修改员工信息",	   		 	
	 	 width : 750,
    	height : 500,
    	onClose : function() {
			$("#employeeList").datagrid("reload");
			$("#employeeList").datagrid("uncheckAll");
		}
	})    	          
}   
</script>
<script type="text/javascript">
$(function(){

	//搜索
	$("#searchButton").on("click",function(event){
		//阻止默认的连接的跳转行为
		event.preventDefault();
		
		var mgrId=$("#mgrId").val();
		var positionId=$("#positionId").val();
		var content=$("#content").textbox("getText");
		$("#employeeList").datagrid("load",
				{"condition":{
					"positionId":positionId,
					"content":content,
					"mgrId":mgrId
					}}
				);			
	});
	
//添加
$("#add-button").on("click",function(event){
	//阻止默认的连接的跳转行为
	event.preventDefault();
	
	//打开新窗口，新窗口中展示角色列表页面
	parent.openTopWindow({width:750,
			height:500,
			title:"添加任务",
			url:"system/hr/addEmployee",
			onClose : function(){
				$("#employeeList").datagrid("reload");
			}
		});
});	

//删除的方法
function removeTask(url, employeeIds) {
	parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
		if (r) {
			$.post(url, {
				"employeeIds" : employeeIds
			}, function(data) {
				if (data.success) {
					parent.$.messager.show({
						"title" : "提示",
						"msg" : data.message,
						"timeout" : 6000
					})
					$("#employeeList").datagrid("reload");
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
	var rows = $("#employeeList").datagrid("getChecked");
	//没有选中某一个用户时进行提示
	if (!rows || rows.length < 1) {
		parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
		return;
	}
	var employeeIds = new Array();
	$.each(rows, function(index, obj) {
		if (obj) {
			employeeIds.push(obj.empId);
		}
	});

	removeTask("system/hr/deleteEmployee", employeeIds.join(","))
});
});	

</script>
</body>
</html>