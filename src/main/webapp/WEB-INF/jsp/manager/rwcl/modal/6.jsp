<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/5
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String result_value = request.getParameter("result_value");
    TtMap result_map = new TtMap();
    String admin_name = "";
    String s_time = "";
    if (result_value != null && !result_value.equals("")) {
        result_map = Tools.jsonDeCode_mp(result_value);
    }
    if (!Tools.myIsNull(request.getParameter("admin_name"))) {
        admin_name = request.getParameter("admin_name");
    }
    if (!Tools.myIsNull(request.getParameter("s_time"))) {
        s_time = request.getParameter("s_time");
    }
    String dt_edit = "";
    if (!Tools.myIsNull(request.getParameter("dt_edit"))) {
        dt_edit = request.getParameter("dt_edit");
    }
    request.setAttribute("result_map", result_map);
%>
<li class="text-primary"><em>征信员银行意见：</em>
    <div class="big-conte" style="display: none;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            <%=s_time%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            <%=dt_edit%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong><%=admin_name%>
        </div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope"
             style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">征信员银行意见：</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="zxyyhyj" name="zxyyhyj" class="form-control"><%=result_map.get("zxyyhyj")%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">申请通融原因：</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="tr_msg" name="tr_msg" class="form-control"><%=result_map.get("tr_msg")%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">通融资料:</label>
                    <div class="col-sm-10">
                        <div class="row inline-from gallerys">
                            <%
                                String imgPreName1_1 = "imgstep1_5ss";
                                String[] ssImgs1_1 = { //设置已有值
                                        !Tools.myIsNull(result_map.get(imgPreName1_1)) ? result_map.get(imgPreName1_1) : ""
                                };
                                ssImgs1_1 = ssImgs1_1[0].split(",");
                                String sImgs1_1 = "";
                                for (int i = 0; i < ssImgs1_1.length; i++) {

                                    if (ssImgs1_1[i] != null && !ssImgs1_1[i].equals("")) {
                                        %>
                            <div  style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;" id="div_imgstep1_5ss<%=i+1%>">
                                <img class="imgclass gallery-pic" onclick="$.openPhotoGallery(this)" id="imgstep1_5ss_view<%=i+1%>" name="imgstep1_5ss_view<%=i+1%>" src="<%=ssImgs1_1[i]%>"  style="width: 100%;height:100px;border-radius:10px;">
                            </div>
                            <%
                                    }
                                }
                            %>

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</li>
