/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2017-11-14 02:21:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.content.system.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class listUsers_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/permission.tld", Long.valueOf(1510541264077L));
    _jspx_dependants.put("/WEB-INF/content/system/user/../../script.html", Long.valueOf(1510192096840L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

	String basePath = request.getContextPath();//获取应用程序的根路径
	//获取应用程序的全路径
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ basePath + "/";

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<base href=\"");
      out.print(path);
      out.write("\">\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>用户管理</title>\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"static/easyui/themes/bootstrap/easyui.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"static/easyui/themes/icon.css\">\r\n");
      out.write("\t<link href=\"static/webuploader/webuploader.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"static/jquery/jquery.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"static/easyui/jquery.easyui.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"static/easyui/locale/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"static/webuploader/webuploader.min.js\"></script>\r\n");
      out.write("\t<script class=\"resources library\" src=\"static/js/area.js\" type=\"text/javascript\"></script>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"toolbar\">\r\n");
      out.write("\t\t<label>用户名：</label><input type=\"text\" name=\"username\" id=\"username\"\r\n");
      out.write("\t\t\tclass=\"easyui-textbox\"> <label>用户角色：</label> <input\r\n");
      out.write("\t\t\ttype=\"text\" name=\"roleId\" value=\"--请选择--\" id=\"roleId\"\r\n");
      out.write("\t\t\tclass=\"easyui-combobox\" data-options=\"width:100\"> <label>用户状态：</label>\r\n");
      out.write("\t\t<input type=\"text\" name=\"status\" id=\"status\" value=\"--请选择--\"\r\n");
      out.write("\t\t\tclass=\"easyui-combobox\" data-options=\"width:100\"> <a\r\n");
      out.write("\t\t\tclass=\"easyui-linkbutton\" id=\"searchButton\"\r\n");
      out.write("\t\t\tdata-options=\"iconCls:'icon-search',plain:true\">查询</a> <a\r\n");
      out.write("\t\t\tclass=\"easyui-linkbutton\" id=\"resetButton\"\r\n");
      out.write("\t\t\tdata-options=\"iconCls:'icon-undo',plain:true\">重置</a> <span\r\n");
      out.write("\t\t\tid=\"operation\" style=\"float: right; margin-right: 10px\"> \r\n");
      out.write("\t\t\t");
      if (_jspx_meth_acl_005fhasPermission_005f0(_jspx_page_context))
        return;
      out.write(" \r\n");
      out.write("\t\t\t");
      if (_jspx_meth_acl_005fhasPermission_005f1(_jspx_page_context))
        return;
      out.write(" \r\n");
      out.write("\t\t\t");
      if (_jspx_meth_acl_005fhasPermission_005f2(_jspx_page_context))
        return;
      out.write(" \r\n");
      out.write("\t\t\t");
      if (_jspx_meth_acl_005fhasPermission_005f3(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<table id=\"userList\" style='width: 100%'></table>\r\n");
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t/* 为分配角色按钮添加事件 */\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t$(\"#assignButton\").on(\"click\", function(event) {\r\n");
      out.write("\t\t\t//阻止原有的点击事件行为\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\t\t\t//获取选中的用户，选中的是一整行数据\r\n");
      out.write("\t\t\tvar rows = $(\"#userList\").datagrid(\"getChecked\");\r\n");
      out.write("\t\t\t//没有选中某一个用户时进行提示\r\n");
      out.write("\t\t\tif (!rows || rows.length < 1) {\r\n");
      out.write("\t\t\t\tparent.$.messager.alert(\"警告\", \"必须选中为其分配角色的用户！\", \"warning\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t//获取到用户的id\r\n");
      out.write("\t\t\tvar userIds = new Array();\r\n");
      out.write("\t\t\t$.each(rows, function(index, obj) {\r\n");
      out.write("\t\t\t\tif (obj) {\r\n");
      out.write("\t\t\t\t\tuserIds.push(obj.userId);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t\t//打开新窗口，新窗口中展示角色列表页面\r\n");
      out.write("\t\t\tparent.openTopWindow({\r\n");
      out.write("\t\t\t\twidth : 600,\r\n");
      out.write("\t\t\t\theight : 400,\r\n");
      out.write("\t\t\t\ttitle : \"分配角色\",\r\n");
      out.write("\t\t\t\turl : \"system/users/assign?userIds=\" + userIds.join(\",\"),\r\n");
      out.write("\t\t\t\tonClose : function() {\r\n");
      out.write("\t\t\t\t\t$(\"#userList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t$(\"#userList\").datagrid(\"uncheckAll\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t/* 按条件查询 */\r\n");
      out.write("\t\t$(\"#searchButton\").on(\"click\", function(event) {\r\n");
      out.write("\t\t\t//阻止原有的点击事件行为\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\t\t\tvar userName = $(\"#username\").textbox(\"getText\");\r\n");
      out.write("\t\t\tvar roleId = $(\"#roleId\").combobox(\"getValue\");\r\n");
      out.write("\t\t\tvar status = $(\"#status\").combobox(\"getValue\");\r\n");
      out.write("\t\t\troleId = (roleId == '--请选择--') ? null : roleId;\r\n");
      out.write("\t\t\tstatus = (status == '--请选择--') ? null : status;\r\n");
      out.write("\t\t\t$(\"#userList\").datagrid(\"load\", {\r\n");
      out.write("\t\t\t\t\"condition\" : {\r\n");
      out.write("\t\t\t\t\t\"userName\" : userName,\r\n");
      out.write("\t\t\t\t\t\"roleId\" : roleId,\r\n");
      out.write("\t\t\t\t\t\"status\" : status\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t//删除的方法\r\n");
      out.write("\t\tfunction removeUser(url, userIds) {\r\n");
      out.write("\t\t\tparent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {\r\n");
      out.write("\t\t\t\tif (r) {\r\n");
      out.write("\t\t\t\t\t$.post(url, {\r\n");
      out.write("\t\t\t\t\t\t\"userIds\" : userIds\r\n");
      out.write("\t\t\t\t\t}, function(data) {\r\n");
      out.write("\t\t\t\t\t\tif (data.success) {\r\n");
      out.write("\t\t\t\t\t\t\tparent.$.messager.show({\r\n");
      out.write("\t\t\t\t\t\t\t\t\"title\" : \"提示\",\r\n");
      out.write("\t\t\t\t\t\t\t\t\"msg\" : data.message,\r\n");
      out.write("\t\t\t\t\t\t\t\t\"timeout\" : 6000\r\n");
      out.write("\t\t\t\t\t\t\t})\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#userList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#userList\").datagrid(\"uncheckAll\");\r\n");
      out.write("\t\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t\tparent.$.messager.alert({\r\n");
      out.write("\t\t\t\t\t\t\t\ttitle : \"提示\",\r\n");
      out.write("\t\t\t\t\t\t\t\tmsg : data.message\r\n");
      out.write("\t\t\t\t\t\t\t})\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}, \"json\")\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t/* 删除某一行或多行数据 */\r\n");
      out.write("\t\t$(\"#removeButton\").on(\"click\", function(event) {\r\n");
      out.write("\t\t\t//阻止原有的点击事件行为\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\t\t\t//获取选中的用户，选中的是一整行数据\r\n");
      out.write("\t\t\tvar rows = $(\"#userList\").datagrid(\"getChecked\");\r\n");
      out.write("\t\t\t//没有选中某一个用户时进行提示\r\n");
      out.write("\t\t\tif (!rows || rows.length < 1) {\r\n");
      out.write("\t\t\t\tparent.$.messager.alert(\"警告\", \"必须选中要删除的用户！\", \"warning\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tvar userIds = new Array();\r\n");
      out.write("\t\t\t$.each(rows, function(index, obj) {\r\n");
      out.write("\t\t\t\tif (obj) {\r\n");
      out.write("\t\t\t\t\tuserIds.push(obj.userId);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t\tremoveUser(\"system/users/deleteUser\", userIds.join(\",\"))\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#editButton\").on(\"click\", function(event) {\r\n");
      out.write("\t\t\t//阻止原有的点击事件行为\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\t\t\t//获取选中的用户，选中的是一整行数据\r\n");
      out.write("\t\t\tvar rows = $(\"#userList\").datagrid(\"getChecked\");\r\n");
      out.write("\t\t\t//没有选中某一个用户时进行提示\r\n");
      out.write("\t\t\tif (!rows || rows.length < 1) {\r\n");
      out.write("\t\t\t\tparent.$.messager.alert(\"警告\", \"必须选中要修改的用户！\", \"warning\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (rows && rows.length > 1) {\r\n");
      out.write("\t\t\t\tparent.$.messager.alert(\"警告\", \"只能选中一位用户！\", \"warning\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t//获取到用户的id\r\n");
      out.write("\t\t\tvar userId = rows[0].userId;\r\n");
      out.write("\r\n");
      out.write("\t\t\t//打开新窗口，新窗口中展示角色列表页面\r\n");
      out.write("\t\t\tparent.openTopWindow({\r\n");
      out.write("\t\t\t\twidth : 600,\r\n");
      out.write("\t\t\t\theight : 400,\r\n");
      out.write("\t\t\t\ttitle : \"修改用户信息\",\r\n");
      out.write("\t\t\t\turl : \"system/users/updateUser?userId=\" + userId,\r\n");
      out.write("\t\t\t\tonClose : function() {\r\n");
      out.write("\t\t\t\t\t$(\"#userList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t$(\"#userList\").datagrid(\"uncheckAll\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#addButton\").on(\"click\", function(event) {\r\n");
      out.write("\t\t\t//阻止原有的点击事件行为\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\t\t\t//打开新窗口，新窗口中展示角色列表页面\r\n");
      out.write("\t\t\tparent.openTopWindow({\r\n");
      out.write("\t\t\t\twidth : 600,\r\n");
      out.write("\t\t\t\theight : 500,\r\n");
      out.write("\t\t\t\ttitle : \"添加用户信息\",\r\n");
      out.write("\t\t\t\turl : \"system/users/addUser\",\r\n");
      out.write("\t\t\t\tonClose : function() {\r\n");
      out.write("\t\t\t\t\t$(\"#userList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t$(\"#userList\").datagrid(\"uncheckAll\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\r\n");
      out.write("\t\t/* 获取所有角色信息 */\r\n");
      out.write("\t\t$('#roleId').combobox({\r\n");
      out.write("\t\t\t\"url\" : \"system/roles/listAll\",\r\n");
      out.write("\t\t\t\"valueField\" : 'roleId',\r\n");
      out.write("\t\t\t\"textField\" : 'roleName',\r\n");
      out.write("\t\t\t\"loadFilter\" : function(data) {\r\n");
      out.write("\t\t\t\tif (data && data.success) {\r\n");
      out.write("\t\t\t\t\treturn data.result;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\treturn null;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t$('#status').combobox({\r\n");
      out.write("\t\t\t\"url\" : \"system/dictionary/listStatus\",\r\n");
      out.write("\t\t\t\"valueField\" : 'value',\r\n");
      out.write("\t\t\t\"textField\" : 'valueName',\r\n");
      out.write("\t\t\t\"loadFilter\" : function(data) {\r\n");
      out.write("\t\t\t\tif (data && data.success) {\r\n");
      out.write("\t\t\t\t\treturn data.result;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\treturn null;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#userList\")\r\n");
      out.write("\t\t\t\t.datagrid(\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\turl : \"system/users/listUsers\",\r\n");
      out.write("\t\t\t\t\t\t\ttoolbar : '#toolbar',\r\n");
      out.write("\t\t\t\t\t\t\tpagination : true,\r\n");
      out.write("\t\t\t\t\t\t\tfitColumns : true,\r\n");
      out.write("\t\t\t\t\t\t\tidField : 'userId',\r\n");
      out.write("\t\t\t\t\t\t\trownumbers : true,\r\n");
      out.write("\t\t\t\t\t\t\tcolumns : [ [\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'userId',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80,\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'right',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tcheckbox : true\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'userName',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '用户名',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'roles',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '用户角色',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80,\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tformatter : function(value) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif (value && value.length > 0) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tvar roleNames = new Array();\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t$\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t.each(\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tvalue,\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tfunction(index,\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tobj) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tif (obj) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\troleNames\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t.push(obj.roleName);\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\treturn roleNames.join(\",\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\treturn \"\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'phone',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '联系方式',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'email',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '电子邮箱',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'status',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '用户状态',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 60,\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tformatter : function(value) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif (value == 1) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\treturn \"正常\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif (value == 0) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\treturn \"已被禁用\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif (value == 2) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\treturn \"已被删除\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\treturn \"\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'note',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '备注信息',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'createTime',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '创建时间',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'updateTime',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '更新时间',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80\r\n");
      out.write("\t\t\t\t\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tfield : 'operation',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle : '查看详情',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\talign : 'center',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\twidth : 80,\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tformatter : function(value, rowData,\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tindex) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\treturn \"<a href='javascript:void(0)' onclick='detail(\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t+ rowData.userId\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t+ \")'>查看详情</a>\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t] ],\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\tloadFilter : function(data) {\r\n");
      out.write("\t\t\t\t\t\t\t\tif (data && data.result) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\treturn data.result;\r\n");
      out.write("\t\t\t\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t\t\t\treturn null;\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#resetButton\").on(\"click\", function(event) {\r\n");
      out.write("\r\n");
      out.write("\t\t\tevent.preventDefault();\r\n");
      out.write("\t\t\t$(\"#username\").textbox(\"clear\");\r\n");
      out.write("\t\t\t$('#roleId').combobox(\"setValue\", \"--请选择--\");\r\n");
      out.write("\t\t\t$('#status').combobox(\"setValue\", \"--请选择--\");\r\n");
      out.write("\t\t})\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\tfunction detail(userId) {\r\n");
      out.write("\t\t//打开新窗口，新窗口中展示用户详情页面\r\n");
      out.write("\t\tparent.openTopWindow({\r\n");
      out.write("\t\t\twidth : 650,\r\n");
      out.write("\t\t\theight : 420,\r\n");
      out.write("\t\t\ttitle : \"用户信息\",\r\n");
      out.write("\t\t\turl : \"system/users/userInfo?userId=\" + userId,\r\n");
      out.write("\t\t\tonClose : function() {\r\n");
      out.write("\t\t\t\t$(\"#userList\").datagrid(\"uncheckAll\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_acl_005fhasPermission_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  acl:hasPermission
    com.zhidi.common.taglib.PermissionTagSupport _jspx_th_acl_005fhasPermission_005f0 = (com.zhidi.common.taglib.PermissionTagSupport) _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.get(com.zhidi.common.taglib.PermissionTagSupport.class);
    _jspx_th_acl_005fhasPermission_005f0.setPageContext(_jspx_page_context);
    _jspx_th_acl_005fhasPermission_005f0.setParent(null);
    // /WEB-INF/content/system/user/listUsers.jsp(32,3) name = code type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_acl_005fhasPermission_005f0.setCode("system:user:create");
    int _jspx_eval_acl_005fhasPermission_005f0 = _jspx_th_acl_005fhasPermission_005f0.doStartTag();
    if (_jspx_eval_acl_005fhasPermission_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t<a class=\"easyui-linkbutton\" id=\"addButton\"\r\n");
        out.write("\t\t\t\t\tdata-options=\"iconCls:'icon-add',plain:true\">新增</a>\r\n");
        out.write("\t\t\t");
        int evalDoAfterBody = _jspx_th_acl_005fhasPermission_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_acl_005fhasPermission_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.reuse(_jspx_th_acl_005fhasPermission_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.reuse(_jspx_th_acl_005fhasPermission_005f0);
    return false;
  }

  private boolean _jspx_meth_acl_005fhasPermission_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  acl:hasPermission
    com.zhidi.common.taglib.PermissionTagSupport _jspx_th_acl_005fhasPermission_005f1 = (com.zhidi.common.taglib.PermissionTagSupport) _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.get(com.zhidi.common.taglib.PermissionTagSupport.class);
    _jspx_th_acl_005fhasPermission_005f1.setPageContext(_jspx_page_context);
    _jspx_th_acl_005fhasPermission_005f1.setParent(null);
    // /WEB-INF/content/system/user/listUsers.jsp(36,3) name = code type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_acl_005fhasPermission_005f1.setCode("system:user:edit");
    int _jspx_eval_acl_005fhasPermission_005f1 = _jspx_th_acl_005fhasPermission_005f1.doStartTag();
    if (_jspx_eval_acl_005fhasPermission_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t<a class=\"easyui-linkbutton\" id=\"editButton\"\r\n");
        out.write("\t\t\t\t\tdata-options=\"iconCls:'icon-edit',plain:true\">修改</a>\r\n");
        out.write("\t\t\t");
        int evalDoAfterBody = _jspx_th_acl_005fhasPermission_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_acl_005fhasPermission_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.reuse(_jspx_th_acl_005fhasPermission_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.reuse(_jspx_th_acl_005fhasPermission_005f1);
    return false;
  }

  private boolean _jspx_meth_acl_005fhasPermission_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  acl:hasPermission
    com.zhidi.common.taglib.PermissionTagSupport _jspx_th_acl_005fhasPermission_005f2 = (com.zhidi.common.taglib.PermissionTagSupport) _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.get(com.zhidi.common.taglib.PermissionTagSupport.class);
    _jspx_th_acl_005fhasPermission_005f2.setPageContext(_jspx_page_context);
    _jspx_th_acl_005fhasPermission_005f2.setParent(null);
    // /WEB-INF/content/system/user/listUsers.jsp(40,3) name = code type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_acl_005fhasPermission_005f2.setCode("system:user:delete");
    int _jspx_eval_acl_005fhasPermission_005f2 = _jspx_th_acl_005fhasPermission_005f2.doStartTag();
    if (_jspx_eval_acl_005fhasPermission_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t<a class=\"easyui-linkbutton\" id=\"removeButton\"\r\n");
        out.write("\t\t\t\t\tdata-options=\"iconCls:'icon-remove',plain:true\">删除</a>\r\n");
        out.write("\t\t\t");
        int evalDoAfterBody = _jspx_th_acl_005fhasPermission_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_acl_005fhasPermission_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.reuse(_jspx_th_acl_005fhasPermission_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.reuse(_jspx_th_acl_005fhasPermission_005f2);
    return false;
  }

  private boolean _jspx_meth_acl_005fhasPermission_005f3(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  acl:hasPermission
    com.zhidi.common.taglib.PermissionTagSupport _jspx_th_acl_005fhasPermission_005f3 = (com.zhidi.common.taglib.PermissionTagSupport) _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.get(com.zhidi.common.taglib.PermissionTagSupport.class);
    _jspx_th_acl_005fhasPermission_005f3.setPageContext(_jspx_page_context);
    _jspx_th_acl_005fhasPermission_005f3.setParent(null);
    // /WEB-INF/content/system/user/listUsers.jsp(44,3) name = code type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_acl_005fhasPermission_005f3.setCode("system:user:grant");
    int _jspx_eval_acl_005fhasPermission_005f3 = _jspx_th_acl_005fhasPermission_005f3.doStartTag();
    if (_jspx_eval_acl_005fhasPermission_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t<a class=\"easyui-linkbutton\" id=\"assignButton\"\r\n");
        out.write("\t\t\t\t\tdata-options=\"iconCls:'icon-man',plain:true\">分配角色</a>\r\n");
        out.write("\t\t\t");
        int evalDoAfterBody = _jspx_th_acl_005fhasPermission_005f3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_acl_005fhasPermission_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.reuse(_jspx_th_acl_005fhasPermission_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005facl_005fhasPermission_0026_005fcode.reuse(_jspx_th_acl_005fhasPermission_005f3);
    return false;
  }
}
