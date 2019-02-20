<!--
* @Description: 左侧菜单演示JSP,sidebar
* @Author: tt
* @Date: 2019-01-10 10:54:21
* @LastEditTime: 2019-01-16 13:45:29
* @LastEditors: tt
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="Tools" uri="/tld/manager" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">管理菜单</li>
            <%
                String nowurl = Tools.urlKill("cn|sdo|type|id")+"&cn=home&sdo=form&type=demo";
                String nowcn = "";
                String nowsdo = "";
                String nowtype = "";
            %>
            <li <% if(nowcn.equals("home") && nowtype.equals("demo")){ %> class="active" <%}%>>
                <a href="<%=nowurl%>"> <i class="fa fa-home"></i> <span>管理中心首页</span></a>
            </li>
            <%
                Map<String,Object> menus = (Map<String,Object>)request.getAttribute("menus");
                for (String key :menus.keySet()){  //一级菜单循环开始
                    Map<String,Object>  mainList = (Map<String,Object>) menus.get(key);
                    TtList submenus =(TtList)mainList.get("submenu");
                    TtMap mainInfo = (TtMap)mainList.get("mainmenu");
                    String iconHtmlMain = mainInfo.get("icohtml");
                    iconHtmlMain = !Tools.myIsNull(iconHtmlMain)?iconHtmlMain:"<i class=\"fa fa-sitemap\"></i>";
            %>
            <li>
                <a href="#"> <%=iconHtmlMain%> <span><%=key%></span></a>
                <ul class="treeview-menu">
                    <%
                        for (TtMap keysub :submenus){//二级级菜单循环开始
                            String icohtml = keysub.get("icohtml");
                            String subMenuName = keysub.get("showmmenuname");
                            String urlotherstr = keysub.get("urlotherstr");
                            nowcn = keysub.get("cn");
                            nowsdo = keysub.get("sdo");
                            nowtype = keysub.get("type");
                            boolean active = nowcn.equals(cn) &&  nowtype.equals(type) /*&& nowsdo.equals(sdo)*/;
                    %>
                    <li <% if(active){ %> class="active" <%}%> >
                        <a href="index?cn=<%=nowcn%>&sdo=<%=nowsdo%>&type=<%=nowtype%><%=urlotherstr%>"><%=icohtml%>
                            <span><%=subMenuName%></span>
                            <%--显示小图标 <span class="pull-right-container">
                                <small class="label pull-right bg-green">16</small>
                                <small class="label pull-right bg-red">5</small>
                            </span> --%>
                        </a>
                    </li>
                    <%//二级级菜单循环结束
                    }
                    %>
                </ul>
            </li>
            <%
                    //一级菜单循环结束
                }
            %>
        </ul> <!-- /.sidebar-menu -->
    </section> <!-- /.sidebar -->
</aside>
<script>
    $('li.active').parents('li').addClass('treeview').addClass('active');
</script>