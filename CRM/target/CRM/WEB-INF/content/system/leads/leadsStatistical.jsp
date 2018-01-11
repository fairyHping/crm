<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ basePath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta charset="UTF-8">
<title>线索管理</title>
<%@include file="../../script.html"%>
</head>
<body>
	<div>
		<div id="toolbar" style="padding-top: 10px;">
			<select style="color: gray" class="easyui-combobox"
			name="source" id="source">
				<option value="">---请选择筛选条件---</option>
				<option value="name">公司名</option>
				<option value="contactsName">联系人</option>
				<option value="ownerName">负责人</option>
				<option value="creatorName">创建人</option>
			</select> 
			<input class="easyui-textbox" name="content" id="content"> <a id="searchBtn"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-search',plain:true">搜索</a>
				<a class="easyui-linkbutton" id="resetButton"
					data-options="iconCls:'icon-undo',plain:true">重置</a> 
		</div>
	</div>
	<table id="StatisticalList" style="width: 100%">
	</table>

	<script type="text/javascript">
		$(function() {
			/* 按条件查询*/
			$("#searchBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				var source=$("#source").combobox("getValue");
				var content=$("#content").textbox("getText");
				$("#StatisticalList").datagrid("load",
					{
					"condition" : {
						"source" : source,
						"content" : content
					}
				});

			});
		});

		$(function() {
			$("#StatisticalList")
					.datagrid(
							{
								url : "system/leads/statisticalList",
								toolbar : "#toolbar",
								pagination : true,
								fitColumns : true,
								rownumbers : true,
								idField : "leadsId",
								columns : [ [
										{
											field : 'leadsId',
											width : 60,
											align : 'center',
											checkbox : true
										},
										{
											field : 'name',
											title : '公司名',
											width : 60
										},
										{
											field : 'contactsName',
											title : '联系人姓名',
											width : 60
										},
										{
											field : 'saltname',
											title : '尊称',
											width : 60
										},
										{
											field : 'mobile',
											title : '手机',
											width : 60
										},
										{
											field : 'nextstepTime',
											title : '下次联系时间',
											width : 60
										},
										{
											field : 'nextstep',
											title : '下次联系内容',
											width : 60
										},
										{
											field : 'ownerUser',
											title : '负责人',
											width : 60,
											formatter : function(value) {
												if (value) {
													return value.userName;
												} else {
													return "";
												}

											}
										},
										{
											field : 'creatorUser',
											title : '创建人',
											width : 60,
											formatter : function(value) {
												if (value) {
													return value.userName;
												} else {
													return "";
												}

											}
										},
										{
											field : 'createTime',
											title : '创建时间',
											width : 60
										} ] ],
								loadFilter : function(data) {
									if (data && data.result) {
										return data.result;
									}
									return null;
								}
							});
			
			$("#resetButton").on("click", function(event) {

				event.preventDefault();
				$("#content").textbox("clear");
				$('#source').combobox("setValue", "--请选择筛选条件--");
			})
		});
	</script>
</body>
</html>