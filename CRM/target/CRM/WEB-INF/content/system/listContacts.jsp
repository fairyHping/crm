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
        <title>联系人管理</title>
        <%@include file="../script.html" %>
    
    </head>
    <body>
     <form id="form" method="post">
      <div>
	    	<div style="padding: 1px;background-color: #ECECFF" >
	    		<label>客户视图：</label>
		    		 <a class="easyui-linkbutton" data-options="iconCls:'icon-more',plain:true">全部</a>
	    		<span style="margin-right: 150px">
	                 <a class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">今日添加</a>
	    			 <a class="easyui-linkbutton add-button" data-options="iconCls:'icon-add',plain:true">本周添加</a>
		    		 <a class="easyui-linkbutton remove-button" data-options="iconCls:'icon-edit',plain:true">本月添加</a>
		    		 <a class="easyui-linkbutton edit-bmutton" data-options="iconCls:'icon-add',plain:true">最近创建</a>
		    		 <a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-man',plain:true">最近更新</a>
		    		 <a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-cart',plain:true">回收站</a>
	    		</span>
	    	</div>	
	    	<div style="padding: 10px">
		    	    <select class="easyui-combobox" id="source">
	    	        <option value="">批量操作</option>
	    	        <option value="name">联系人名</option>
	    	        <option value="createUserId">创建者</option>
	    	      </select>
		    	  <span style="">
		    	   <input type="text" id="name" class="easyui-textbox " style="width: 25%;">
	               <a id="searchBtn" class="easyui-linkbutton " data-options="iconCls:'icon-search',plain:true">搜索</a> 
	    	      </span>
	    	      <a  id="add" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" style="margin-left: 50px">新建联系人</a>
	    	      <a  id="deleteBtn" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">删除</a>
	    	      <a  id="updateBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
	    	      <a  id="tab" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">客户工具</a>
    	       </div>	 	 
    	</div>
    	<table id="contactsList" style="width:100%"></table>
    	</form>
    	<div id="topWindow"></div>
    
    	<script type="text/javascript">
    
    //新建客户信息在弹窗页面
  	 $("#add").on("click",function(){	          
          	parent.openTopWindow({url :"system/customer/add",
  		 	title:"新建联系人",	   		 	
  		 	 width : 700,
            height : 400,
            onClose : function() {
				$("#contactsList").datagrid("reload");
				$("#contactsList").datagrid("uncheckAll");
			}       
			});
          	    	          
      });
	  
     //为搜索按钮添加事件处理函数
 $(function(){
	 $('#searchBtn').on("click", function(event) {
		event.preventDefault();
		var date = {condition : {
			'source' : $('#source').combobox('getValue'),
			'name' : $('#name').textbox('getValue')}
		};
		
		loadContacts(date)
	});
	 function loadContacts(date){
		 $("#contactsList").datagrid('load', date);
	 } 
 });
     
     
		//删除
		function removeContacts(url, contactsIds) {
			parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
				if (r) {
					$.post(url, {
						"contactsIds" : contactsIds
					}, function(data) {
						if (data.success) {
							parent.$.messager.show({
								"title" : "提示",
								"msg" : data.message,
								"timeout" : 6000
							})
							$("#contactsList").datagrid("reload");
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
		$("#deleteBtn").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//获取选中的客户，选中的是一整行数据
			var rows = $("#contactsList").datagrid("getChecked");
			//没有选中某一个客户时进行提示
			if (!rows || rows.length < 1) {
				parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
				return;
			}
			var contactsIds = new Array();
			$.each(rows, function(index, obj) {
				if (obj) {
					contactsIds.push(obj.id);
				}
			});

			removeContacts("system/customer/delContacts",contactsIds.join(","))
		});

		  
			$(function(){
				$("#contactsList").datagrid({
					url : "system/customer/contacts",
					toolbar : "#toolbar",
					pagination : true,
					fitColumns : true,
					rownumbers : true,
					idField : "id",
					columns : [[
						{field:'id',width:70,align:'center',checkbox:true},		
						{field:'name',title:'联系人姓名',width:70,align:'center'},
						{field:'saltname',title:'尊称',width:70,align:'center'},
						{field:'customer',title:'所属客户',width:70,align:'center',formatter:function(value){
							if(value){
								return value.name;
							}
							return "";
						} },
						{field:'telephone',title:'电话',width:70,align:'center'},
						{field:'qqNo',title:'qq',width:70,align:'center'},
						{field:'email',title:'Email',width:70,align:'center'},
						{field:'user',title:'创建者',width:70,align:'center',formatter:function(value){
							if(value){
								return value.userName;
							}
							return "";
						} },
						{field:'createTime',title:'创建时间',width:70,align:'center'},
					    {field:'opreation',title:'操作',width:100,align:'center',formatter:function(value,rowData,index){
                                 return "<a href='javascript:void(0)'  onclick='detail("+rowData.id+")'>查看</a>&nbsp;&nbsp;"
                   
						    }}
					]],
					loadFilter: function(data){
						if(data && data.result){
							return data.result;
							$("#contactsList").datagrid("reload");
						}
						return null;
					}
				});
				
			});
			$("#updateBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				//获取选中的用户，选中的是一整行数据
				var rows = $("#contactsList").datagrid("getChecked");
				//没有选中某一个用户时进行提示
				if (!rows || rows.length < 1) {
					parent.$.messager.alert("警告", "必须选中要修改的用户！", "warning");
					return;
				}
				if (rows && rows.length > 1) {
					parent.$.messager.alert("警告", "只能选中一位用户！", "warning");
					return;
				}
	 
				//获取到用户的id
				var ids = new Array();
				$.each(rows, function(index, obj) {
					if (obj) {
						ids.push(obj.id);
					}
				});

			    //编辑联系人信息在弹窗页面 */
			            	parent.openTopWindow({
			             url :"system/customer/toedit?id="+ids,
			   		 	title:"编辑联系人",	
			   		      width : 800,
			              height : 500,
			             onClose : function() {
			 				$("#contactsList").datagrid("reload");
			 				$("#contactsList").datagrid("uncheckAll");
			 			}       
						}); 
			});
			  /*  //查看联系人信息在弹窗页面 */
        	function detail(id){	
				parent.openTopWindow({
		   		 url:"system/customer/findAll?id="+id,
	   		 	title:"查看客户详情",	   		 	
	   		 	width : 800,
                height : 400,
                onClose : function() {
	 				$("#contactsList").datagrid("reload");
	 				$("#contactsList").datagrid("uncheckAll");
	 			}       
				});   	          
    		}	     
    	</script>
    </body>
</html>