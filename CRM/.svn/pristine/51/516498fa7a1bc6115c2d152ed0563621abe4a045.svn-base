<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   String basepath=request.getContextPath();
   String path=request.getLocalAddr()+"://"+request.getServerName()+":"+request.getServerPort()+basepath+"/";
   %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta charset="UTF-8">
<title>添加产品</title> 
 <%@ include file="../../script.html" %>

 <style type="text/css">
#div {
	text-align: center;
	width: 750px;
	margin-left:15px;
	margin-right: 30px;
	margin-top:20px;
}

table{
	border: 1px solid #f5f5f5;
	border-collapse: collapse;
	width: 100%;
}

td{
	border: 1px solid #f5f5f5;
	
}
#other {
	text-align: left;
	
}

.td1 {
	text-align: right;
	background-color: #f5f5f5;
	line-height: 35px;
}

.td2 {
	text-align: left
}
</style>
</head>
<body>

<div class="container" id="div">
        <div id="main" class="easyui-panel">
                <form id="addForm" enctype="multipart/form-data">
                <table style=" border:1px solid ; border-collapse: collapse;width: 95%" >
                    <tbody>
                    <tr>
                        <td class="td1">产品名称</td>
                        <td class="td2"><input  class="easyui-textbox"  type="text" name="name" data-options="required:true" placeholder="产品名称"></td>
                        <td class="td1">产品类别</td>
                        <td class="td2">
                        	<select name="categoryId" class="easyui-combobox" style="width: 150px">
                        		<option >默认</option>
                        		<c:forEach items="${requestScope.Category }" var="category">
									<option  value="${category.id}">${category.name}</option>
								</c:forEach>              
                        	</select>                       
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">研发时间</td>
                        <td class="td2"><input class="easyui-datebox t2" type="text" name="developmentTime" data-options="required:true " ></td>
                        <td class="td1">详情连接</td>
                        <td class="td2"><input  class="easyui-textbox" type="text" name="link" data-options="required:true" placeholder=""></td>
                    </tr>
                    <tr>
                        <td class="td1">开发团队</td>
                        <td class="td2"><input  class="easyui-textbox" type="text" name="developmentTeam" data-options="required:true, validType:'maxLength[10]'" ></td>
                        <td class="td1">成本价</td>
                        <td class="td2"><input  class="easyui-textbox" type="text" name="costPrice" data-options="required:true" placeholder=""></td>
                    </tr>                 
                    <tr>
                        <td class="td1" >建议售价</td>
                        <td colspan="3" class="td2"><input class="easyui-textbox" type="text" name="suggestedPrice" class="easyui-validatebox" data-options="required:true, validType:'maxLength[64]'" ></td>
                        </tr>
                     <tr style="height: 80px">
                        <td class="td1">主题</td>
                      
                        <td class="td2">
                        	<div id="chooseIdCard">选择文件</div>
                        	<input class="t2" type="file" name="image" id="image"/>
                    	</td>
                    	<td ></td>
                    	<td class="td2">
                        	
                        </td>
                       
                    </tr>
                    <tr>
                        <td class="td1">备注</td>
                        <td colspan="3" class="td2">
	    			<input class="easyui-textbox" data-options="multiline:true"  type="text" name="description" style="height:100px;width: 400px;"></input></td>
                    </tr>
                    </tbody>
                  
                </table>
                  </form>
            </div>
            <div class="btn-selection">
                <a href="javascript:void(0);" class="easyui-linkbutton save-btn" id="saveProduct" data-options="selected:true">保存</a>
                <a href="javascript:void(0);" class="easyui-linkbutton reset-btn" id="reset" data-options="selected:true">重置</a>
            </div>
        </div>
   
  </body>
 
	
  <script type="text/javascript">
//添加产品

		//重置
		$("#reset").on("click",function(){
			$("#addForm").form("clear")
		})
	</script>
	
	<script type="text/javascript">
	//添加，上传图片
	 $("#saveProduct").on("click",function(){
		 var isValid = $('#addForm').form('validate');
			if(!isValid){
				return;
			}	
		 $.ajax({  
	          url: 'system/product/doAddProduct' ,  
	          type: 'POST',  
	          data:new FormData($('#addForm')[0]),
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              
	        	  if(data.success){
	   				parent.$.messager.alert({
	       				title:"提示",
	       				msg:data.message,
	   				}) 
	   				parent.$("#topWindow").window("close")      				
	  			}else{
	  				$.messager.alert({
	           			title:"提示",
	           			msg:data.message,
	    			})
	  			} 
	               
	          }  
	     }); 
	 }); 
		
		
		
	</script>

</html>