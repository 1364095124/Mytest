<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/2/15
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理第三方应用</title>
</head>
<style type="text/css">
    a{
        text-decoration: none !important;
    }
</style>
<body>
<link rel="stylesheet" href="css/bootstrap-step/style.css"/>
<link rel="stylesheet" href="css/bootstrap/bootstrap.css"/>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/bootstrap-step/bootstrap-step.js"></script>
<div class="row">
    <button class="btn btn-success" id="tip" data-toggle='modal'
            data-target='#myModalNext'>模态框</button>
</div>
<div class="modal fade" id="myModalNext">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">选项配置</h4><ul class="nav nav-pills nav-justified step step-progress">
                <li class="active">
                    <a>步骤一<span class="caret"></span></a>
                </li>
                <li>
                    <a>步骤二<span class="caret"></span></a>
                </li>
                <li>
                    <a>步骤三<span class="caret"></span></a>
                </li>

            </ul>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="carousel slide" data-ride="carousel" data-interval="false" data-wrap="false">
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <p>单点登陆</p>
                                <div class="row">
                                    <div class="col-xs-6 col-xs-offset-3">
                                        <label>应用名称</label>
                                        <input type="text" class="form-control" readonly/>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-xs-6 col-xs-offset-3">
                                        <label>单点登陆地址</label>
                                        <input type="text" class="form-control" readonly/>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-xs-6 col-xs-offset-3">
                                        <div class="form-group" >
                                            <label class="control-label">是否启用</label>
                                            <select class="form-control " name="isDisabled" id="isDisabled0">
                                                <option value="0" selected = "selected" >启用</option>
                                                <option value="1">禁用</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-xs-offset-3">
                                        <button id="updateSso" class="btn btn-success">修改</button>
                                        <button id="saveSso" class="btn btn-primary">保存</button>
                                    </div>

                                </div>

                            </div>
                            <div class="item">
                                <p>消息集成</p>
                                <div class="form-group">
                                    <label for="">获取消息模式</label>
                                    <select class="form-control" name="type" id="type">
                                        <option value="0" selected = "selected">第三方推送消息</option>
                                        <option value="1">主动拉去消息</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <lable class="control-label">获取地址</lable>
                                    <input type="text"  class="form-control" name="msg_url" id="msg_url"/>
                                </div>
                                <div class="form-group" >
                                    <label class="control-label">是否启用</label>
                                    <select class="form-control " name="isDisabled" id="isDisabled">
                                        <option value="0" selected = "selected" >启用</option>
                                        <option value="1">禁用</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button id="updateMsg" class="btn btn-success">修改</button>
                                    <button id="saveMsg" class="btn btn-primary">保存</button>
                                </div>
                            </div>
                            <div class="item">
                                <p>代办集成</p>
                                <div class="form-group">
                                    <label for="">获取代办模式</label>
                                    <select class="form-control" name="type" id="type1">
                                        <option value="0" selected = "selected">第三方推送消息</option>
                                        <option value="1">主动拉去消息</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <lable class="control-label">获取地址</lable>
                                    <input type="text"  class="form-control" name="pending_url" id="pending_url"/>
                                </div>
                                <div class="form-group" >
                                    <label class="control-label">是否启用</label>
                                    <select class="form-control " name="isDisabled" id="isDisabled">
                                        <option value="0" selected = "selected" >启用</option>
                                        <option value="1">禁用</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button id="updatePend" class="btn btn-success">修改</button>
                                    <button id="savePend" class="btn btn-primary">保存</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default MN-pre">上一步</button>
                <button type="button" class="btn btn-primary MN-next">下一步</button>
            </div>
        </div>
    </div>
</div>
<script>
    $("#myModalNext .modal-footer button").each(function () {
        $(this).click(function () {
            if ($(this).hasClass("MN-next")) {
                $("#myModalNext .carousel").carousel('next');
                $("#myModalNext .step li.active").next().addClass("active");
            } else {
                $("#myModalNext .carousel").carousel('prev');
                if ($("#myModalNext .step li").length > 1) {
                    $($($("#myModalNext .step li.active"))[$("#myModalNext .step li.active").length - 1]).removeClass("active")
                }
            }
        })
    });


</script>
</body>
</html>
