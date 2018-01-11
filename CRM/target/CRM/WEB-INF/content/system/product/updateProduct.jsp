<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String basepath=request.getContextPath();
   String path=request.getLocalAddr()+"://"+request.getServerName()+":"+request.getServerPort()+basepath+"/";
   %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta charset="UTF-8">
<title>修改产品</title> 
 <%@ include file="../../script.html" %>
<style type="text/css">
#div {
	text-align: center;
	width: 700px;
	margin-left:15px;
	margin-right: 30px;
	margin-top:20px;
	border: 1px solid #f5f5f5;
}

table{
	border: 1px solid #f5f5f5;
	border-collapse: collapse;
	width: 100%;
	height: 380px;
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

<div id="div">
     <div id="main" class="easyui-panel">
          <form id="addForm" enctype="multipart/form-data">
            <table style=" border:1px solid ; border-collapse: collapse;width: 95%" >
                  <tbody>
                    <tr ><td colspan="4" >产品基本信息
                    	<input name="id" type="hidden" value="${product.id }">
                    	
                    </td></tr>
                    <tr>
                        <td class="td1">产品名称</td>
                        <td class="td2"><input type="text" class="easyui-textbox" name="name" data-options="required:true" placeholder="产品名称" value="${product.name }"></td>
                        <td class="td1">产品类别</td>
                        <td class="td2">
                        	<select  name="categoryId" class="easyui-combobox" style="width: 150px">
                        		<c:forEach items="${requestScope.Category }" var="category">
                        			<c:choose>
                        				<c:when test="${category.id eq product.categoryId}">
                        					<option  value="${category.id}" selected="selected">${category.name }</option>
                        				</c:when>
                        				<c:otherwise>
                        					<option value="${category.id}">${category.name}</option>
                        				</c:otherwise>
                        			</c:choose>                        			
								</c:forEach>              
                        	</select>                       
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">研发时间</td>
                        <td class="td2"><input class="easyui-datebox" type="text" name="developmentTime" data-options="required:true "
                        	 value="<fmt:formatDate value="${product.developmentTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"></td>
                        <td class="td1">详情连接</td>
                        <td class="td2"><input class="easyui-textbox" type="text" name="link" data-options="required:true" value="${product.link }"></td>
                    </tr>
                     <tr>
                        
                        <td class="td1">开发团队</td>
                        <td class="td2"><input class="easyui-textbox" type="text" name="developmentTeam" data-options="required:true, validType:'maxLength[10]'" value="${product.developmentTeam }">
                        		<input type="hidden" value="${product.creatorUserId }"></td>
                         <td class="td1">成本价</td>
                        <td class="td2"><input class="easyui-textbox" type="text" name="costPrice" data-options="required:true" value="${product.costPrice }"></td>
                    <tr>
                       
                    	<td class="td1" >建议售价</td>
                        <td colspan="3" class="td2"><input class="easyui-textbox" type="text" name="suggestedPrice" value="${product.suggestedPrice }" class="easyui-validatebox" data-options="required:true, validType:'maxLength[64]'" ></td>
                    </tr>                 
                   
                    <tr>
                        <td class="td1">备注</td>
                        <td colspan="2" class="td2"><textarea class="theme-textbox-radius"
								rows="5" cols="50" name="description"
								data-options="validType:'maxLength[150]'"></textarea></td>
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
    </div>
  </body>
 
	
  <script type="text/javascript">
//修改产品
	$("#saveProduct").on("click",function(){
		var isValid = $('#addForm').form('validate');
		if(!isValid){
			return;
		}	
		$.post("system/product/doUpdateProduct",$("#addForm").serialize(),function(data){				
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
	<script type="text/javascript">
		//上传处理
		var chooseIdCardUploader = WebUploader.create({
			// 选完文件后，是否自动上传。
		    auto: true,
		    // swf文件路径
		    swf: 'https://cdn.bootcss.com/webuploader/0.1.1/Uploader.swf',		
		    // 文件接收服务端。
		    server: 'CRM/system/product/doAddProduct',		
		    // 选择文件的按钮。可选。
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
		    pick: '#chooseIdCard',		
		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		    resize: false,
		    // 只允许选择图片文件。
		    accept: {
		        title: 'Images',
		        extensions: 'gif,jpg,jpeg,bmp,png',
		        mimeTypes: 'image/*'
		    }
		});
		chooseIdCardUploader.on('fileQueued', function( file ) {
			chooseIdCardUploader.makeThumb( file, function( error, src ) {
		        if (error) {
		            $("#chooseIdCardPreview").replaceWith('<span>不能预览</span>');
		            return;
		        }
		        $("#chooseIdCardPreview").attr( 'src', src );
		    }, 100, 100 );
		});
		//文件上传成功接受回调信息
		chooseIdCardUploader.on('uploadSuccess', function (file,response) {
			parent.$.messager.alert({
       			title:"提示",
       			msg:"文件上传成功",
			})
			 $("#IdCardUrl").val(response.url);
	    });
		
		
	</script>

</html></title>
</head>
<body>

</body>
</html>