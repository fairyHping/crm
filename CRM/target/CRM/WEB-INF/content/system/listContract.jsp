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
        <title>合同</title>
        <%@include file="../script.html" %>
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
	background-color: #F4F4F4;
	padding: 20px;
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
     
     
      <div>
	    	<div style="background-color: #ECECFF; padding-bottom: 5px">
			<ul id="ul">
				<li><strong>视图：☰</strong></li>
				<li>全部</li>
				<li>我负责的</li>
				<li>下属负责的</li>
				<li>我创建的</li>
				<li>下属创建的</li>
				<li>今日签约</li>
				<li>本周签约</li>
				<li>本月签约</li>
				<li>最近创建</li>
				<li style="border: 0;">最近更新</li>
			</ul>
			
		</div>
	   </div>
	    	     	 
		<div id="toolbar" >
					<a id="remove-button" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				<select id="source" class="easyui-combobox">
					<option value="">任意字段</option>
					<option value="number">合同编号</option>
					<option value="ownerUserId">负责人</option>
					<option value="businessId">商机</option>
				</select>
				
				<input id="content" type="text" name="contractname" class="easyui-textbox">
    			<a id="searchButton" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
    			<span style="margin-left:100px;">
    				<a id="recycle" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" style="float: right;margin-right: 20px">回收站</a>
    				<a id="add-button" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" style="float: right;margin-right: 20px">添加合同</a>
		    	</span>	 
    	</div>
    	<table id="contractList" style="width:100%">
    	</table>
    	
    	
    
    	<script type="text/javascript">
    	
			$(function(){
				$("#contractList").datagrid({
					url : "system/contract/list",
					toolbar : "#toolbar",
					pagination : true,
					fitColumns : true,
					rownumbers : true,
					idField : "contractId",
					columns : [[
						{field:'contractId',width:80,align:'center',checkbox:true},		
						{field:'number',title:'合同编号',width:80},
						{field:'customer',title:'客户',width:80,
							formatter:function(value){
								if(value){
									
									return value.name;
								}
								return "";
							}},
						{field:'contacts',title:'联系人',width:80,formatter:function(value){
							if(value){
								
								return value.name;
							}
							return "";
						}}, 
						{field:'user',title:'负责人',width:80,formatter:function(value){
							if(value){
								
								return value.userName;
							}
							return "";
						}},
						{field:'dueDate',title:'签约日期',width:80},
						{field:'price',title:'合同金额(元)',width:80},
						{field:'updateTime',title:'距合同到期天数',width:80,formatter: function(value){
							if (value) {
								var date=((new Date()-new Date(value))/1000/60/60/24);
								return parseInt(date) +'天';
							} else {
								return "";
							}

						}
					},
					    {field:'opreation',title:'操作',width:80,formatter:function(value,rowData,index){
                                 return "<a href='javascript:void(0)' onclick='detail("+rowData.contractId+")'>查看</a>&nbsp;&nbsp"
                                 +"<a href='javascript:void(0)'  onclick='edit("+rowData.contractId+")'>编辑</a>"   
						    }}
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
				/* 快速检索工具栏 */
				$("li").on("click",function(){
					var li=$(this).text();
					$("#contractList").datagrid("load", {
						"condition" : {
							"li":li
						}
					});
					
					
				});

				$("#recycle").on("click", function(event) {
					//阻止原有的点击事件行为
					event.preventDefault();
					//打开新窗口，新窗口中展示角色列表页面
					parent.openTopWindow({
						width : 900,
						height : 600,
						title : "合同回收站",
						url : "system/contract/contractRecycle",
						onClose : function() {
							$("#contractList").datagrid("reload");
							$("#contractList").datagrid("uncheckAll");
						}

					});

				});
				


				
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
					 $("#contractList").datagrid('load', date);
				 } 

				
				
				//添加合同
				$("#add-button").on("click",function(event){
					//阻止默认的连接的跳转行为
					event.preventDefault();
					
					//打开新窗口，新窗口中展示角色列表页面
					parent.openTopWindow({width:800,
							height:500,
							title:"添加合同",
							url:"system/contract/addContract",
							onClose : function(){
								$("#contractList").datagrid("reload");
							}
						});
				});
			


				//删除的方法
				function removeContract(url, contractIds) {
					parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
						if (r) {
							$.post(url, {
								"contractIds" : contractIds
							}, function(data) {
								if (data.success) {
									parent.$.messager.show({
										"title" : "提示",
										"msg" : data.message,
										"timeout" : 6000
									})
									$("#contractList").datagrid("reload");
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
					var rows = $("#contractList").datagrid("getChecked");
					//没有选中某一个用户时进行提示
					if (!rows || rows.length < 1) {
						parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
						return;
					}
					var contractIds = new Array();
					$.each(rows, function(index, obj) {
						if (obj) {
							contractIds.push(obj.contractId);
						}
					});

					removeContract("system/contract/deleteContract", contractIds.join(","))
				});
			});		
			//修改信息	
			function edit(contractId){	
				parent.openTopWindow({
		   		 url:"system/contract/updateContract?contractId="+contractId,
	   		 	title:"修改合同信息",	   		 	
	   		 	width : 950,
                height : 700,
				})
				doSearch()    	          
    		}
			//查看详情	
			function detail(contractId){	
				parent.openTopWindow({
		   		 url:"system/contract/ContractInfo?contractId="+contractId,
	   		 	title:"修改合同信息",	   		 	
	   		 	width : 950,
                height : 700,
				})
				doSearch()    	          
    		}
    	</script>
    </body>
</html>