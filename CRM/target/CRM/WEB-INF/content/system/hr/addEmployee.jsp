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
<title>添加员工</title>
<%@ include file="../../script.html" %>
<style type="text/css">
#div {
	text-align: center;
	width: 700px;
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
	height: 60px;
}
#other {
	text-align: left;
	line-height: 40px;
}

#td1 {
	text-align: right;
	background-color: #f5f5f5;
}

.td2 {
	text-align: left
}
</style>
</head>
<body>
<div id="div">
	<div class="easyui-panel">
        <form id="addForm" >
             <table style=" border:1px solid ; border-collapse: collapse;width: 95%" >
                <tbody>
                   <tr>
	    				<td id="td1">员工姓名:</td>
	    				<td class="td2"><input class="easyui-textbox" type="text" name="name" data-options="required:true"/></td>
	    				<td id="td1">员工性别:</td>
	    				<td class="td2"><input type="radio" name="sex" value="1"/>男
	    								<input type="radio" name="sex" value="0"/>女</td>
	    		</tr>
	    		<tr>
	    		<td id="td1">状态:</td>
	    				<td class="td2">正常</td>
	    			<td id="td1">所属岗位:</td>
	    			<td  class="td2">
	    				<select  name="positionId" class="easyui-combobox" data-options="required:true">
	    					<c:forEach items="${postions }" var="pos">
	    						<option value="${pos.positionId }">${pos.name}</option>
	    					</c:forEach>
	    				</select> 				
	    			</td>
	    		</tr>
	    		<tr><td id="td1">电话:</td>
	    			<td  class="td2"><input class="easyui-textbox" type="text" name="telephone" 
	    					data-options="required:true,validType:'mobile'" placeholder="请输入联系电话"/></td>
	    			<td id="td1">上级领导:</td>
	    			<td  class="td2">
	    				<select  name="mgrId" class="easyui-combobox" data-options="required:true">
	    					<c:forEach items="${requestScope.employees }" var="emp">
	    						<option value="${emp.empId }">${emp.name}</option>
	    					</c:forEach>
	    				</select> 				
	    			</td>
	   			</tr>
	   			<tr>
	   			<td id="td1">邮箱:</td>
	    			<td class="td2"><input class="easyui-textbox" name="email"
	    					placeholder="Email" data-options="validType:'email'" /></td>
	   				<td id="td1">对应用户:</td>
	    			<td  class="td2">
	    				<select  name="userId" class="easyui-combobox" data-options="required:true">
	    					<c:forEach items="${requestScope.users }" var="user">
	    						<option value="${user.userId }">${user.userName}</option>
	    					</c:forEach>
	    				</select> 				
	    			</td>	    				
	    			
	   			</tr>
	   			<tr>
	   				<td id="td1">地址：</td>
	   				<td class="td2" colspan="3"> 
	   					<input class="easyui-textbox" type="text" name="address">
	   				</td>
	   			</tr>
	   		 </tbody>	
	    </table>
	</form>
            </div>
            <div class="btn-selection" style="margin-top: 20px">
                <a href="javascript:void(0);" id="saveTask" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
                <a href="javascript:void(0);" id="resetbtn" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>
            </div>
        </div>
   <script type="text/javascript">
 //自定义验证
	$.extend(
			$.fn.validatebox.defaults.rules,{
				maxLength : {
					validator : function(value, param) {
							return param[0] >= value.length;
					},
					message : '请输入最大{0}位字符.'
				},
				minLength : {
					validator : function(value, param) {
							return param[0] <= value.length;
					},
					message : '请输入最小{0}位字符.'
				},
					mobile : {//手机号
						validator : function(value) {
						return /^1[34578][0-9]{9}$/i.test($.trim(value));
						},
						message : '手机号码格式不正确'
					},
					email : {     
				           validator: function(value){     
				               return /^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/i.test($.trim(value));     
				           },     
				           message: '电子邮箱格式不正确'    
				    }
		});
   </script>
  <script type="text/javascript">
//添加
	$("#saveTask").on("click",function(){
		var isValid = $('#addForm').form('validate');
		if(!isValid){
			return;
		}	
		$.post("system/hr/doAddEmployee",$("#addForm").serialize(),function(data){				
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
		},"json")			
	})
		//重置
		$("#reset").on("click",function(){
			$("#addForm").form("reset")
		})
	</script> 
</body>
</html>