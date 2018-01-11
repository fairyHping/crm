<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path %>">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../script.html" %>
</head>
<body>


	<div id="toolbar" >
					<a id="remove-button" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				<select id="source" class="easyui-combobox">
					<option value="">任意字段</option>
					<option value="smsRecordId">短信编号</option>
					<option value="userId">发件人</option>
					<option value="sendTime">发送时间</option>
				</select>
				
				<input id="content" type="text" name="smsrecordname" class="easyui-textbox">
    			<a id="searchButton" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
    	</div>
    	<table id="smsRecordList" style="width:100%">
    	</table>
    	
    	
    
    	<script type="text/javascript">
    	
			$(function(){
				$("#smsRecordList").datagrid({
					url : "system/sale/list",
					toolbar : "#toolbar",
					pagination : true,
					fitColumns : true,
					rownumbers : true,
					idField : "smsRecordId",
					columns : [[
						{field:'smsRecordId',width:80,align:'center',checkbox:true},		
						{field:'user',title:'发件人',width:80,formatter:function(value){
							if(value){
								
								return value.userName;
							}
							return "";
						}},
						{field:'telephone',title:'接收号码',width:80},
						{field:'content',title:'发送内容',width:80},
						{field:'sendTime',title:'发送时间',width:80},
					]],
					loadFilter: function(data){
						if(data && data.result){
							return data.result;
						}
						return null;
					}
				});
			});
		
    	</script>
    	
    	<script type="text/javascript">
			$(function(){

				//为搜索按钮添加事件处理函数
				 $('#searchButton').on("click", function(event) {
					event.preventDefault();
					var date = {condition : {
						'source' : $('#source').combobox('getValue'),
						'content' : $('#content').textbox('getValue')}
					};
					loadContract(date)
				});
				 function loadContract(date){
					 $("#smsRecordList").datagrid('load', date);
				 } 

				//删除的方法
					function removeSmsRecord(url, smsRecordIds) {
						parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
							if (r) {
								$.post(url, {
									"smsRecordIds" : smsRecordIds
								}, function(data) {
									if (data.success) {
										parent.$.messager.show({
											"title" : "提示",
											"msg" : data.message,
											"timeout" : 6000
										})
										$("#smsRecordList").datagrid("reload");
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
					$("#remove-button").on("click", function(event) {
						//阻止原有的点击事件行为
						event.preventDefault();
						//获取选中的用户，选中的是一整行数据
						var rows = $("#smsRecordList").datagrid("getChecked");
						//没有选中某一个用户时进行提示
						if (!rows || rows.length < 1) {
							parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
							return;
						}
						var smsRecordIds = new Array();
						$.each(rows, function(index, obj) {
							if (obj) {
								smsRecordIds.push(obj.smsRecordId);
							}
						});

						removeSmsRecord("system/sale/deleteSmsRecord", smsRecordIds.join(","))
					
				});	
				 
				})
    	
    	</script>
</body>
</html>