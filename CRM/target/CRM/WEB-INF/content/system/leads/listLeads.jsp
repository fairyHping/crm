<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="acl" uri="http://www.zhidisoft.com/taglib/acl"%>
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
<style type="text/css">
#ul li {
	text-decoration: none; /*去掉前面的圆点*/
	list-style: none;
	float: left;
	display: block; /* 将链接设为块级元素 */
	padding: 0px 3px; /* 设置内边距 */
	text-decoration: none; /* 去掉下划线 */
	border-right: 1px solid #000; /* 在左侧加上分隔线 */
	font-size: 14px;
}

#ul {
	padding: 10px;
}

a {
	text-decoration: none;
}

#ul li:hover {
	cursor: pointer;
}
</style>

</head>
<body>
	<div style="background-color: #ECECFF; height: 30px; margin-top: -8px">
		<ul id="ul">
			<li><strong>视图：☰</strong></li>
			<li>全部</li>
			<li>我负责的</li>
			<li>下属负责的</li>
			<li>下属创建</li>
			<li>已转换线索</li>
			<li>今日需联系</li>
			<li>本周需联系</li>
			<li>本月需联系</li>
			<li>7日未联系</li>
			<li>15日未联系</li>
			<li>30日未联系</li>
			<li>最近修改</li>
			<li style="border: 0;">最近创建</li>
		</ul>
	</div>
	<div id="toolbar">
		<select style="width: 100px;" name="batch" id="batch"
			class="easyui-combobox">
			<option value="">批量操作</option>
			<acl:hasPermission code="system:leads:delete">
				<option value="deleteBatch">批量删除</option>
			</acl:hasPermission>
			<acl:hasPermission code="system:leads:toPool">
				<option value="toPoolBatch">批量放入线索池</option>
			</acl:hasPermission>
		</select> <span> <select style="color: gray" class="easyui-combobox"
			name="source" id="source">
				<option value="">---请选择筛选条件---</option>
				<option value="name">公司名</option>
				<option value="contactsName">联系人</option>
				<option value="ownerName">负责人</option>
				<option value="creatorName">创建人</option>
		</select> <input class="easyui-textbox" name="content" id="content"
			style="width: 100px;"> <a id="searchBtn"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-search',plain:true">搜索</a> <a
			class="easyui-linkbutton" id="resetButton"
			data-options="iconCls:'icon-undo',plain:true">重置</a> <a id="sendSms"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-large_smartart',plain:true">发送短信</a> <a
			id="receiveEmail" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true">接收邮件</a>
		</span> <span style="float: right"> 
		<acl:hasPermission code="system:leads:recycle">
				<a id="recycle" class="easyui-linkbutton"
					data-options="iconCls:'icon-no',plain:true">回收站</a>
			</acl:hasPermission> 
			<acl:hasPermission code="system:leads:transform">
				<a id="transformBtn" class="easyui-linkbutton"
					data-options="iconCls:'icon-reload',plain:true">线索转换</a>
			</acl:hasPermission> 
			<acl:hasPermission code="system:leads:edit">
				<a id="editBtn" class="easyui-linkbutton"
					data-options="iconCls:'icon-edit',plain:true">修改线索</a>
			</acl:hasPermission> 
			<acl:hasPermission code="system:leads:add">
				<a id="addBtn" class="easyui-linkbutton"
					data-options="iconCls:'icon-add',plain:true">新建线索</a>
			</acl:hasPermission> 
		</span>
	</div>
	<table id="leadsList" style="width: 100%">
	</table>
	<script type="text/javascript">
		$(function() {
			/* 快速检索工具栏 */
			$("li").on("click", function() {
				var li = $(this).text();
				$("#leadsList").datagrid("load", {
					"condition" : {
						"li" : li
					}
				});
			});

			$("#sendSms").on("click",function(event){
				event.preventDefault();
				//获取选中的线索，选中的是一整行数据
				var rows = $("#leadsList").datagrid("getChecked");
				//没有选中某一个线索时进行提示
				if (!rows || rows.length < 1) {
					parent.$.messager.alert("警告", "必须选中要修改的线索！", "warning");
					return;
				}
				if (rows && rows.length > 1) {
					parent.$.messager.alert("警告", "只能选中一个线索！", "warning");
					return;
				}
				//获取选中的线索的联系电话
				var telephone= rows[0].mobile;
				var con=rows[0].contactsName;
				window.location.href="system/sale/sms?telephone="+telephone+"&contactsName="+con;
				
			});
			/* 按条件查询*/
			$("#searchBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				var source = $("#source").combobox("getValue");
				var content = $("#content").textbox("getText");
				$("#leadsList").datagrid("load", {
					"condition" : {
						"source" : source,
						"content" : content
					}
				});

			});

			/* 添加线索 */
			$("#addBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				//打开新窗口，新窗口中展示线索页面
				parent.openTopWindow({
					width : 780,
					height : 480,
					title : "添加线索",
					url : "system/leads/addLeads",
					onClose : function() {
						$("#leadsList").datagrid("reload");
						$("#leadsList").datagrid("uncheckAll");
					}

				});

			});

			/* 回收站 */
			$("#recycle").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				//打开新窗口，新窗口中展示角色列表页面
				parent.openTopWindow({
					width : 900,
					height : 600,
					title : "线索回收站",
					url : "system/leads/leadsRecycle",
					onClose : function() {
						$("#leadsList").datagrid("reload");
						$("#leadsList").datagrid("uncheckAll");
					}
				});
			});

			/* 修改线索 */
			$("#editBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				//获取选中的线索，选中的是一整行数据
				var rows = $("#leadsList").datagrid("getChecked");
				//没有选中某一个线索时进行提示
				if (!rows || rows.length < 1) {
					parent.$.messager.alert("警告", "必须选中要修改的线索！", "warning");
					return;
				}
				if (rows && rows.length > 1) {
					parent.$.messager.alert("警告", "只能选中一个线索！", "warning");
					return;
				}
				//获取选中的线索的id
				var leadsId = rows[0].leadsId;
				//打开新窗口，新窗口中展示修改线索页面
				parent.openTopWindow({
					width : 780,
					height : 480,
					title : "修改线索信息",
					url : "system/leads/updateLeads?leadsId=" + leadsId,
					onClose : function() {
						$("#leadsList").datagrid("reload");
						$("#leadsList").datagrid("uncheckAll");
					}
				});

			});

			/* 线索转换 */
			$("#transformBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				//获取选中的线索，选中的是一整行数据
				var rows = $("#leadsList").datagrid("getChecked");
				//没有选中某一个线索时进行提示
				if (!rows || rows.length < 1) {
					parent.$.messager.alert("警告", "必须选中要转换的线索！", "warning");
					return;
				}
				if (rows && rows.length > 1) {
					parent.$.messager.alert("警告", "只能选中一个线索！", "warning");
					return;
				}
				//获取选中的线索的id
				var leadsId = rows[0].leadsId;
				//打开新窗口，新窗口中展示修改线索页面
				parent.openTopWindow({
					width : 780,
					height : 450,
					title : "修改线索信息",
					url : "system/leads/transformToCustomer?leadsId=" + leadsId,
					onClose : function() {
						$("#leadsList").datagrid("reload");
						$("#leadsList").datagrid("uncheckAll");
					}
				});

			});
		});

		/* 线索详情 */
		function detail(leadsId) {
			//打开新窗口，新窗口中展示线索详情页面
			parent.openTopWindow({
				width : 750,
				height : 450,
				title : "线索信息",
				url : "system/leads/leadsInfo?leadsId=" + leadsId,
				onClose : function() {
					$("#leadsList").datagrid("uncheckAll");
				}
			});
		}
		$(function() {
			$("#leadsList")
					.datagrid(
							{
								url : "system/leads/listLeads",
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
											field : 'isTransformed',
											title : '是否已转换',
											width : 60,
											formatter : function(value) {
												if (value==0) {
													return "是";
												} else {
													return "否";
												}

											}
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
										},
										{
											field : 'haveTime',
											title : '距到期天数',
											width : 60,
											formatter : function(value) {
												if (value) {
													var date = ((new Date(value) - new Date()) / 1000 / 60 / 60 / 24);
													var daysNum = parseInt(date);
													if (daysNum < 0) {
														daysNum = 0;
													}
													return daysNum + '天';

												} else {
													return "";
												}

											}
										},
										{
											field : 'operation',
											title : '操作',
											width : 60,
											align : 'center',
											formatter : function(value,
													rowData, index) {
												return "<a href='javascript:void(0)'  onclick='detail("
														+ rowData.leadsId
														+ ")'>查看</a>"
											}
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

		$("#batch").combobox({
			onChange : function() {
				//获取选中的线索，选中的是一整行数据		  
				var rows = $("#leadsList").datagrid("getChecked");
				//没有选中某一个用户时进行提示
				if (!rows || rows.length < 1) {
					parent.$.messager.alert("警告", "必须选中线索！", "warning");
					return;
				}
				//获取选中的线索的id
				var leadsIds = new Array();
				$.each(rows, function(index, obj) {
					if (obj) {
						leadsIds.push(obj.leadsId);
					}
				});
				$.ajax({
					url : "system/leads/" + $("#batch").combobox("getValue"),
					type : "POST",
					data : {
						"leadsIds" : leadsIds.join(",")
					},
					success : function(data) {
						if (data.success) {
							parent.$.messager.show({
								"title" : "提示",
								"msg" : data.message,
								"timeout" : 6000
							})
							$("#leadsList").datagrid("reload");
						} else {
							parent.$.messager.alert({
								"title" : "提示",
								"msg" : data.message
							})
						}
						$("#batch").combobox("setValue", "批量操作");
					}

				});
			}
		});
	</script>
</body>
</html>