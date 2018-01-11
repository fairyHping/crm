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
        <title>商机管理</title>
        <%@include file="../script.html" %>
    
    </head>
    <body>
       <form id="Form"  method="post">
      <div>
	    	<div style="padding: 1px;background-color: #ECECFF" >
	    		<label>客户视图：</label>
		    		 <a class="easyui-linkbutton" data-options="iconCls:'icon-more',plain:true">全部</a>
		    		 <a class="easyui-linkbutton add-button" data-options="iconCls:'icon-man',plain:true">我负责的</a>
			    	 <a class="easyui-linkbutton remove-button" data-options="iconCls:'icon-tip',plain:true">我创建的</a>
			    	  <a class="easyui-linkbutton add-button" data-options="iconCls:'icon-man',plain:true">下属负责的</a>
			    	 <a class="easyui-linkbutton remove-button" data-options="iconCls:'icon-tip',plain:true">下属创建的</a>
	    		<span style="margin-right: 150px">
	                 <a class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">今日需联系</a>
	    			 <a class="easyui-linkbutton add-button" data-options="iconCls:'icon-add',plain:true">本周需联系</a>
		    		 <a class="easyui-linkbutton remove-button" data-options="iconCls:'icon-edit',plain:true">本月需联系</a>
		    		  <a class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">7日需联系</a>
	    			 <a class="easyui-linkbutton add-button" data-options="iconCls:'icon-add',plain:true">15日需联系</a>
		    		 <a class="easyui-linkbutton remove-button" data-options="iconCls:'icon-edit',plain:true">30日需联系</a>
		    		 <a class="easyui-linkbutton edit-bmutton" data-options="iconCls:'icon-add',plain:true">最近创建</a>
		    		 <a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-man',plain:true">最近更新</a>
		    		 <a class="easyui-linkbutton assign-button" data-options="iconCls:'icon-cart',plain:true">回收站</a>
		    		 
	    		</span>
	    	</div>	
	    	<div style="padding: 10px">
	    	     <select class="easyui-combobox" id="source">
	    	        <option value="">批量操作</option>
	    	        <option value="ownerUserId">负责者</option>
	    	        <option value="createUserId">创建者</option>
	    	         <option value="origin">商机来源</option>
	    	      </select>
		    	  <span style="">
		    	   <input type="text" id="origin" class="easyui-textbox" style="width: 50%;">
	               <a id="searchBtn" class="easyui-linkbutton " data-options="iconCls:'icon-search',plain:true">搜索</a> 
	    	      </span>
	    	      <a  id="add" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" style="margin-left: 20px">添加商机</a>
	    	       <a  id="updateBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
	    	      <a  id="deleteBtn" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">删除</a>
	    	      <a  id="tab" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true">商机工具</a>
    	       </div>	 	 
    	</div>
    	<table id="businessList" style="width:100%"></table>
    	</form>
    	<div id="topWindow"></div>
    
    	<script type="text/javascript">
    	
    	//新建客户信息在弹窗页面
     	 $("#add").on("click",function(){	          
             	parent.openTopWindow({url :"system/business/add",
     		 	title:"新建商机",	   		 	
     		 	 width : 800,
               height : 400,
               onClose : function() {
   				$("#businessList").datagrid("reload");
   				$("#businessList").datagrid("uncheckAll");
   			}       
   			});
             	    	          
         });
    	
         //为搜索按钮添加事件处理函数
     	 $(function(){
     		 $('#searchBtn').on("click", function(event) {
     			event.preventDefault();
     			var date = {condition : {
     				'source' : $('#source').combobox('getValue'),
     				'origin' : $('#origin').textbox('getValue')}
     			};
     			
     			loadBusiness(date)
     		});
     		 function loadBusiness(date){
     			
     			 $("#businessList").datagrid('load', date);
     		 } 
     	 });
     	     
     	//删除商机
 		function removeBusiness(url, businessIds) {
 			parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
 				if (r) {
 					$.post(url, {
 						"businessIds" : businessIds
 					}, function(data) {
 						if (data.success) {
 							parent.$.messager.show({
 								"title" : "提示",
 								"msg" : data.message,
 								"timeout" : 6000
 							})
 							$("#businessList").datagrid("reload");
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
 			var rows = $("#businessList").datagrid("getChecked");
 			//没有选中某一个客户时进行提示
 			if (!rows || rows.length < 1) {
 				parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
 				return;
 			}
 			var businessIds = new Array();
 			$.each(rows, function(index, obj) {
 				if (obj) {
 					businessIds.push(obj.id);
 				}
 			});

 			removeBusiness("system/business/delBusiness",businessIds.join(","))
 		});

			$(function(){
				$("#businessList").datagrid({
					url : "system/business/list",
					toolbar : "#toolbar",
					pagination : true,
					fitColumns : true,
					rownumbers : true,
					idField : "id",
					columns : [[
						{field:'id',width:70,align:'center',checkbox:true},		
						{field:'customer',title:'客户',width:70,align:'center',formatter:function(value){
							if(value){
								return value.name;
							}
							return "";
						}},
						{field:'origin',title:'商机来源',width:70,align:'center'},
						{field:'nextstepTime',title:'下次联系时间',width:70,align:'center'},
						{field:'nextstep',title:'下次联系内容',width:70,align:'center'},
						{field:'creator',title:'负责者',width:70,align:'center',formatter:function(value){
							if(value){
								return value.userName;
							}
							return "";
						} },
						{field:'user',title:'创建者',width:70,align:'center',formatter:function(value){
							if(value){
								return value.userName;
							}
							return "";
						} },
						{field:'createTime',title:'创建时间',width:70,align:'center'},
						{field:'updateTime',title:'更新时间',width:70,align:'center'},
					    {field:'opreation',title:'操作',width:100,align:'center',formatter:function(value,rowData,index){
                                 return "<a href='javascript:void(0)'  onclick='detail("+rowData.id+")'>查看</a>&nbsp;&nbsp;"   
						    }}
					]],
					loadFilter: function(data){
						if(data && data.result){
							return data.result;
							$("#businessList").datagrid("reload");
						}
						return null;
					}
				});
			});
			$("#updateBtn").on("click", function(event) {
				//阻止原有的点击事件行为
				event.preventDefault();
				//获取选中的用户，选中的是一整行数据
				var rows = $("#businessList").datagrid("getChecked");
				//没有选中某一个用户时进行提示
				if (!rows || rows.length < 1) {
					parent.$.messager.alert("警告", "必须选中要修改的用户！", "warning");
					return;
				}
				if (rows && rows.length > 1) {
					parent.$.messager.alert("警告", "只能选中一位用户！", "warning");
					return;
				}
	 
				//获取到商机的id
				var ids = new Array();
				$.each(rows, function(index, obj) {
					if (obj) {
						ids.push(obj.id);
					}
				});

			    //编辑商机信息在弹窗页面 */
			            parent.openTopWindow({
			            url :"system/business/edit?id="+ids,
			   		 	title:"编辑商机",	
			   		    width : 800,
			            height : 500,
			             onClose : function() {
			 				$("#businessList").datagrid("reload");
			 				$("#businessList").datagrid("uncheckAll");
			 			}       
						}); 
			});
			  /*  //查看商机信息在弹窗页面 */
        	function detail(id){	
				parent.openTopWindow({
		   		 url:"system/business/find?id="+id,
	   		 	title:"查看客户详情",	   		 	
	   		 	width : 800,
                height : 400,
                onClose : function() {
	 				$("#businessList").datagrid("reload");
	 				$("#businessList").datagrid("uncheckAll");
	 			}       
				});   	          
    		}	   
    	</script>
    </body>
</html>