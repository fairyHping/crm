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
	<label style="margin-left:20px;"></label>
	<select class="easyui-combobox"  id="source">
			<option value="">请选择筛选条件</option>
			<option value="productName">产品名称</option>
			<option value="link">详情链接</option>
			<option value="creatorUserId">创建人</option>
	</select> 
	<input type="text" id="content" class="easyui-textbox " style="width: 15%;">
	 <a id="searchButton" class="easyui-linkbutton " data-options="iconCls:'icon-search',plain:true">搜索</a> 
	
    	<span style="margin-left:100px;">
    		<a id="removebutton" class="easyui-linkbutton " data-options="iconCls:'icon-remove',plain:true" style="float: right;margin-right: 20px">删除</a>
    		<a class="easyui-linkbutton " id="add-button" data-options="iconCls:'icon-add',plain:true" style="float: right;margin-right: 20px">添加产品</a>
    		<a class="easyui-linkbutton " data-options="iconCls:'icon-add',plain:true" style="float: right;margin-right: 30px">产品工具</a>
    	</span>
</div>
   <table id="productList" style="width:100%"></table>
    <script type="text/javascript">
    		//为分配添加、修改、删除、添加角色按钮绑定事件
			$(function(){
				
				//为搜索按钮添加事件处理函数
				 $('#searchButton').on("click", function(event) {
					event.preventDefault();
					var date = {condition : {
						'source' : $('#source').combobox('getValue'),
						'content' : $('#content').textbox('getValue')}
					};
					loadProduct(date)
				});
				 function loadProduct(date){
					 $("#productList").datagrid('load', date);
				 } 
									

				//添加	
				$("#add-button").on("click",function(event){
					//阻止默认的连接的跳转行为
					event.preventDefault();
					
					//打开新窗口，新窗口中展示角色列表页面
					parent.openTopWindow({width:800,
							height:500,
							title:"添加产品",
							url:"system/product/addProduct",
							onClose : function(){
								$("#listProduct").datagrid("reload");
							}
						});
				});
				//删除的方法
				function removeProduct(url, productIds) {
					parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
						if (r) {
							$.post(url, {
								"productIds" : productIds
							}, function(data) {
								if (data.success) {
									parent.$.messager.show({
										"title" : "提示",
										"msg" : data.message,
										"timeout" : 6000
									})
									$("#productList").datagrid("reload");
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
					var rows = $("#productList").datagrid("getChecked");
					//没有选中某一个用户时进行提示
					if (!rows || rows.length < 1) {
						parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
						return;
					}
					var productIds = new Array();
					$.each(rows, function(index, obj) {
						if (obj) {
							productIds.push(obj.id);
						}
					});

					removeProduct("system/product/deleteProduct", productIds.join(","))
				});
							
								
			});
    		
			$(function(){
				$("#productList").datagrid({
					url : "system/product/listProduct",
					toolbar : "#toolbar",
					pagination : true,
					fitColumns : true,
					rownumbers : true,
					idField : "id",
					columns : [[
						{field:'id', title:'全选',width:80,align:'center',checkbox:true},
						{field:'productImages',title:'图片',align:'center',width:80,formatter:function(value){
								if(value ){								
								return "<img style=\"height:50px;width:80px\" src="+ value.path+ ">";
							}
							return "";
					
							
						}},
						{field:'name',title:'产品名称',align:'center',width:80},
						{field:'link',title:'详情连接',align:'center',width:80},
						{field:'user',title:'创始人',align:'center',width:80,formatter:function(value){
							if(value ){
								
								return value.userName;
							}
							return "";
						}},
						{field:"operation",title:'操作',width:80,formatter:function(value,rowData,index){
		                    return "<a href='javascript:void(0)' onclick='detail("+rowData.id+")'>查看   </a>"
		                    +"<a href='javascript:void(0)' onclick='edit("+rowData.id+")'>编辑   </a>"                              
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

			 //编辑产品
	   		function edit(id){	          
		   		 	parent.openTopWindow({url:"system/product/updateProduct?id="+id,
		   		 	title:"修改产品信息",	   		 	
		   		 	 width : 750,
	                height : 500,
					})    	          
	    		}  
	   	 //查看产品
	   		function detail(id){	          
		   		 	parent.openTopWindow({url:"system/product/productInfo?id="+id,
		   		 	title:"查看产品信息",	   		 	
		   		 	 width : 700,
	                height : 500,
					})    	          
	    		}   
    	</script>
    </body>
</html>