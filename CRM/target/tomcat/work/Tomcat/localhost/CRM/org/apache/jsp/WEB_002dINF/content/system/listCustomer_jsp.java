/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2017-11-01 08:36:28 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.content.system;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class listCustomer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/content/system/../script.html", Long.valueOf(1509524963228L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	String basePath = request.getContextPath();
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("        <base href=\"");
      out.print(path);
      out.write("\">\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <title>客户管理</title>\r\n");
      out.write("        ");
      out.write("\t<link href=\"static/easyui/themes/insdep/easyui.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("    <link href=\"static/easyui/themes/insdep/easyui_animation.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("    <link href=\"static/easyui/themes/insdep/easyui_plus.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("    <link href=\"static/easyui/themes/insdep/insdep_theme_default.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("    <link href=\"static/easyui/themes/insdep/icon.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("    <link href=\"static/easyui/themes/insdep/iconfont/iconfont.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("    <link href=\"static/ztree/zTreeStyle/zTreeStyle.css\" rel=\"stylesheet\" type=\"text/css\" >\r\n");
      out.write("\t<link href=\"static/css/common.css\" rel=\"stylesheet\" type=\"text/css\" >\r\n");
      out.write("\t<link href=\"static/webuploader/webuploader.css\" rel=\"stylesheet\" type=\"text/css\" >\r\n");
      out.write("    <script type=\"text/javascript\" src=\"static/jquery/jquery.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"static/easyui/jquery.easyui.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"static/easyui/themes/insdep/jquery.insdep-extend.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"static/ztree/jquery.ztree.all.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"static/easyui/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("<!--     <script type=\"text/javascript\" src=\"static/kindeditor/kindeditor-all-min.js\"></script> -->\r\n");
      out.write("    <script type=\"text/javascript\" src=\"static/webuploader/webuploader.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("      <div>\r\n");
      out.write("\t    \t<div style=\"padding: 10px;background-color: #ECECFF\" >\r\n");
      out.write("\t    \t\t<label>客户视图：</label>\r\n");
      out.write("\t\t    \t\t <a class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-more',plain:true\">全部</a>\r\n");
      out.write("\t\t    \t\t <a class=\"easyui-linkbutton add-button\" data-options=\"iconCls:'icon-man',plain:true\">我的客户</a>\r\n");
      out.write("\t\t\t    \t <a class=\"easyui-linkbutton remove-button\" data-options=\"iconCls:'icon-tip',plain:true\">下属</a>\r\n");
      out.write("\t    \t\t<span style=\"|\">\r\n");
      out.write("\t                 <a class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-clock',plain:true\">今日新建</a>\r\n");
      out.write("\t    \t\t\t <a class=\"easyui-linkbutton add-button\" data-options=\"iconCls:'icon-remove',plain:true\">本周新建</a>\r\n");
      out.write("\t\t    \t\t <a class=\"easyui-linkbutton remove-button\" data-options=\"iconCls:'icon-edit',plain:true\">本月新建</a>\r\n");
      out.write("\t\t    \t\t <a class=\"easyui-linkbutton edit-bmutton\" data-options=\"iconCls:'icon-add',plain:true\">我的关注</a>\r\n");
      out.write("\t\t    \t\t <a class=\"easyui-linkbutton assign-button\" data-options=\"iconCls:'icon-man',plain:true\">我的共享</a>\r\n");
      out.write("\t\t    \t\t <a class=\"easyui-linkbutton assign-button\" data-options=\"iconCls:'icon-reload',plain:true\">共享给我的</a>\r\n");
      out.write("\t\t    \t\t <a class=\"easyui-linkbutton assign-button\" data-options=\"iconCls:'icon-cart',plain:true\">回收站</a>\r\n");
      out.write("\t\t    \t\t <a class=\"easyui-linkbutton assign-button\" data-options=\"iconCls:'icon-search',plain:true\">高级搜索</a>\r\n");
      out.write("\t    \t\t</span>\r\n");
      out.write("\t    \t</div>\t\r\n");
      out.write("\t    \t<div style=\"padding: 10px\">\r\n");
      out.write("\t    \t      <select style=\"width: 80px\">\r\n");
      out.write("\t    \t        <option>批量操作</option>\r\n");
      out.write("\t    \t      </select>\r\n");
      out.write("\t\t    \t  <span style=\"\">\r\n");
      out.write("\t\t    \t      <select style=\"color: gray\">\r\n");
      out.write("\t\t    \t           <option>---请选择筛选条件---</option>\r\n");
      out.write("\t\t    \t      </select>\r\n");
      out.write("\t\t    \t      <select style=\"color: gray\">\r\n");
      out.write("\t\t    \t            <option>包含</option>\r\n");
      out.write("\t\t    \t      </select>\r\n");
      out.write("\t\t    \t      <select style=\"width: 80px\"></select>    \t \r\n");
      out.write("\t\t    \t      <a  id=\"tab\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-search',plain:true\">搜索</a>\r\n");
      out.write("\t\t    \t      <a  id=\"tab\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-sum',plain:true\">送短信</a>\r\n");
      out.write("\t\t    \t      <a  id=\"tab\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-save',plain:true\">接收邮件</a>\r\n");
      out.write("\t    \t      </span>\r\n");
      out.write("\t    \t      <a  id=\"tab\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-add',plain:true\" style=\"margin-left: 200px\">新建客户</a>\r\n");
      out.write("\t    \t      <a  id=\"tab\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-redo',plain:true\">客户工具</a>\r\n");
      out.write("    \t       </div>\t \t \r\n");
      out.write("    \t</div>\r\n");
      out.write("    \t<table id=\"customerList\" style=\"width:100%\">\r\n");
      out.write("    \t</table>\r\n");
      out.write("    \t\r\n");
      out.write("    \t\r\n");
      out.write("    \r\n");
      out.write("    \t<script type=\"text/javascript\">\r\n");
      out.write("    \t\t\r\n");
      out.write("\t\t\t$(function(){\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(\"#customerList\").datagrid({\r\n");
      out.write("\t\t\t\t\turl : \"system/customer/list\",\r\n");
      out.write("\t\t\t\t\ttoolbar : \"#toolbar\",\r\n");
      out.write("\t\t\t\t\tpagination : true,\r\n");
      out.write("\t\t\t\t\tfitColumns : true,\r\n");
      out.write("\t\t\t\t\trownumbers : true,\r\n");
      out.write("\t\t\t\t\tidField : \"customerId\",\r\n");
      out.write("\t\t\t\t\tcolumns : [[\r\n");
      out.write("\t\t\t\t\t\t{field:'customerId',width:70,align:'right',checkbox:true},\t\t\r\n");
      out.write("\t\t\t\t\t\t{field:'name',title:'客户名称',width:70},\r\n");
      out.write("\t\t\t\t\t\t{field:'industry',title:'客户行业',width:70},\r\n");
      out.write("\t\t\t\t\t\t{field:'rating',title:'评分',width:70},\r\n");
      out.write("\t\t\t\t\t\t{field:'address',title:'客户联系地址',width:70},\r\n");
      out.write("\t\t\t\t\t\t{field:'zipCode',title:'邮编',width:70},\r\n");
      out.write("\t\t\t\t\t\t{field:'cUser',title:'拥有者',width:70,formatter:function(value){\r\n");
      out.write("\t\t\t\t\t\t\tif(value){\r\n");
      out.write("\t\t\t\t\t\t\t\treturn value.userName;\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\treturn \"\";\r\n");
      out.write("\t\t\t\t\t\t} },\r\n");
      out.write("\t\t\t\t\t\t{field:'user',title:'创建者',width:70,formatter:function(value){\r\n");
      out.write("\t\t\t\t\t\t\tif(value){\r\n");
      out.write("\t\t\t\t\t\t\t\treturn value.userName;\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\treturn \"\";\r\n");
      out.write("\t\t\t\t\t\t} },\r\n");
      out.write("\t\t\t\t\t\t{field:'createTime',title:'创建时间',width:70},\r\n");
      out.write("\t\t\t\t\t\t{field:'updateTime',title:'更新时间',width:70},\r\n");
      out.write("\t\t\t\t\t    {file:'opreation',title:'操作',width:100,formatter:function(value,roeData,index){\r\n");
      out.write("                                 return \"<a href='javascript:void(0)'  onclick='detail(\"+rowData.id+\")'>查看</a>\"\r\n");
      out.write("                                 +\"<a href='javascript:void(0)'  onclick='detail(\"+rowData.id+\")'>编辑</a>\"   \r\n");
      out.write("\t\t\t\t\t\t    }}\r\n");
      out.write("\t\t\t\t\t]],\r\n");
      out.write("\t\t\t\t\tloadFilter: function(data){\r\n");
      out.write("\t\t\t\t\t\tif(data && data.result){\r\n");
      out.write("\t\t\t\t\t\t\treturn data.result;\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#customerList\").datagrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\treturn null;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("    \t</script>\r\n");
      out.write("    </body>\r\n");
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
}