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
	width: 650px;
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
	line-height: 35px;
}
#other {
	text-align: left;
	line-height: 40px;
}

.td1 {
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
     <div id="main" class="easyui-panel">
          <form id="addForm" enctype="multipart/form-data">
            <table style=" border:1px solid ; border-collapse: collapse;width: 95%" >
                  <tbody>
                 
                    <tr>
                        <td class="td1">产品名称</td>
                        <td class="td2">${product.name }</td>
                        <td class="td1">产品类别</td>
                        <td class="td2">
                        		<c:forEach items="${requestScope.Category }" var="category">
                        				<c:if test="${category.id eq product.categoryId}">${category.name}
                        				</c:if>                    	                      			
								</c:forEach>                                     
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">研发时间</td>
                        <td class="td2"><fmt:formatDate value="${product.developmentTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td class="td1">详情连接</td>
                        <td class="td2">${product.link }</td>
                    </tr>
                    <tr>
                        <td class="td1">创建人</td>
                        <td class="td2">${product.user.userName }</td>
                        <td class="td1">创建时间</td>
                        <td class="td2"><fmt:formatDate value="${product.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>   
                    <tr>
                        <td class="td1">开发团队</td>
                        <td class="td2">${product.developmentTeam }</td>
                        <td class="td1">成本价</td>
                        <td class="td2">${product.costPrice }</td>
                    </tr>                 
                    <tr>
                        <td class="td1" >建议售价</td>
                        <td  class="td2">${product.suggestedPrice }</td>
                        <td class="td1">更新时间</td>
                        <td class="td2"><fmt:formatDate value="${product.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        </tr>
                   
                     <tr style="height: 80px">
                        <td class="td1">主题</td>                     
                        <td >
                    		<img id="image" style="height:50px;width:80px" src="${product.productImages.path }"/>                  		
                    	</td>
                    </tr>
                    <tr>
                        <td class="td1">备注</td>
                        <td colspan="3" class="td2">${product.description }</textarea></td>
                    </tr>
                    </tbody>
                </table>
                  </form>
            </div>
        </div>
    </div>
  </body>
</html>