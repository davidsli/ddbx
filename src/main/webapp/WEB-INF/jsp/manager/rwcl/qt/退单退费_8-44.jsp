
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="" class="tab-content">
    <style>
        .flex-box{
            display: flex;
            flex-direction: column;
        }
        .flex-box div[class^='flex-row']{
            width: 100%;
        }
        .flex-box .flex-row{
            height: 35px;
        }
        .flex-row-rhcen{
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        em{
            cursor: pointer;
        }
        .flex-row-rhcen em{
            padding: 0 5px;
        }
        .flex-rowcen{
            flex: 1;
        }
        .text-primary em{
            display: block;
            font-size: 15px;
            line-height: 25px;
        }
        .text-primary .big-conte{
            background-color:#f7f7f7;
            height:auto!important;
            height:100px;
            display:none;
            min-height:100px;
            padding: 15px 0;
            margin: 15px 0;
            border-radius:10px;
        }
        .big-conte-row span{
            text-align: right;
            padding-right: 15px;
            line-height: 34px;
            width: 25%;
            float: left;

        }
        .big-conte-row input{
            float: left;
            width: 20%;
        }
        .big-conte-row{
            margin: 20px;
            height: 34px;
        }
    </style>
</div>
<li class="text-primary">
    <em>退单数据修正:</em>
    <div class="big-conte_">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong></div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope"  style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="tdtfsh_89" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <input type="hidden" name="adminid" value="${sessionScope.pd.id}">
                <input type="hidden" name="type_id" value="${requestScope.type_id}">
                <input type="hidden" name="icbc_id" value="${pd.icbc_id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">客户姓名</label>
                    <div class="col-sm-3">
                        <input value="${pd.c_name}" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                    <label class="col-sm-2 control-label">业务编号</label>
                    <div class="col-sm-3">
                        <input value="${pd.gems_code}" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                </div>

                <!-- ngIf: !notUseButton -->
                <br>
                <!-- 		<div ng-repeat="mt in task.filepathlist"> -->
                <!-- 			<div type="hidden" ng-init="addImage(mt)"> -->
                <!-- 			</div> -->
                <!-- 	    </div> -->
                <div style="overflow: hidden;margin-left: 7%;">
                    <!-- ngRepeat: img in task.filepathlist -->
                </div>
                <div class="clear"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" style="margin-top: 57px;">退单退费说明</label>
                    <div class="col-sm-8" style="margin-top: 40px;">
                        <textarea name="result_1_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"></textarea>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
                <div class="modal-footer">
                    <a onclick="location.href='${pageContext.request.contextPath}/erp/wdrw_list.do?type=wdrw&dn=${requestScope.dn }&qn=list&cn=${requestScope.cn }&yw_id=${requestScope.yw_id }'" class="btn btn-warning" >取消</a>
                    <a onclick="erp_tdtfsh_89()"  class="btn btn-primary" >提交</a>
                </div>
            </form>
            <script type="text/javascript">
                function erp_tdtfsh_89(){
                    var form = new FormData(document.getElementById("tdtfsh_89"));
                    $.ajax({
                        url:"${pageContext.request.contextPath}/erp/erp_tdtfsh_89.do",
                        type:"post",
                        data:form,
                        processData:false,
                        contentType:false,
                        success:function(data){
                            alert("提交成功!");
                            window.location.href='${pageContext.request.contextPath}/erp/wdrw_list.do?type=wdrw&dn=${requestScope.dn }&qn=list&cn=${requestScope.cn }';
                        },
                        error:function(e){
                            alert("错误！！");
                        }
                    });
                }
            </script>
        </div>
    </div>
</li>
