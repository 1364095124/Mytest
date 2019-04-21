<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/2/27
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <link rel="shortcut icon" href="images/logo.png">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css">
    <script src="js/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/jquery/jquery.cookie.min.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
</head>
<style type="text/css">
    body{
        background-color:#f5f5f5
    }
     #g{
        height:2px;
        width:5px;
        background:#1890ff;
        position:absolute;
        transition: 1s;
        animation: mymove 4s ;
         animation-fill-mode:forwards;
    }
    @keyframes mymove
    {
        from {width:5px;}
        to {width:1870px;}
    }
</style>
<body>
<div style="background: #ffffff;height:130px;">
    <br/>
    <hr/>
    <br/>
    <p style="color:#696969;margin-left:15px;">忘记密码&nbsp;/&nbsp;<span style="font-size:22px;">找回密码</span></p>

</div>
<div id="g"></div>

<div class="container">

    <br/>
    <br/>
    <br/>
    <div class="layui-row">
        <div class="layui-col-md6 layui-col-md-offset3">
            <form class="layui-form" action="" style="background: #ffffff;height:500px;">
                <br/>
                <br/>
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-block">
                        <input type="text" name="account" id="account" required style="width:300px;"  lay-verify="required"
                               placeholder="请输入要找回密码的账号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <br/>
                <div class="layui-row">
                    <div class="layui-col-md5">
                        <div class="layui-form-item">
                            <label class="layui-form-label">验证码</label>
                            <div class="layui-input-block">
                                <input type="text" name="code" id="code" required  lay-verify="required"
                                       placeholder="验证码三分钟有效" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md7">
                        <button type="button" name="getCode" class="layui-btn layui-btn-normal">获取验证码</button>
                    </div>
                </div>
                <br/>
                <div class="layui-form-item">
                    <label class="layui-form-label">滑动验证</label>
                    <div class="layui-input-block" style="width:300px;">
                        <div id="slider"></div>
                    </div>
                </div>
                <br/>
                <br/>
                <hr/>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button  class="layui-btn" lay-submit lay-filter="SubForm">立即提交</button>
                        <button  type="button" name="back" class="layui-btn layui-btn-primary">返回登陆</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    // 自定义模块
    layui.config({
        base: 'dist/sliderVerify/'   // 模块目录

    });
    layui.use(['form','sliderVerify','layer'], function() {
        var form=layui.form;
        var layer=layui.layer;
        var sliderVerify = layui.sliderVerify;
        var slider = sliderVerify.render({
            elem: '#slider'
        });
        form.on('submit(SubForm)', function(data) {
            if(slider.isOk()){//用于表单验证是否已经滑动成功
                var param = JSON.stringify(data.field);//定义临时变量获取表单提交过来的数据，非json格式
                //测试是否获取到表单数据，调试模式下在页面控制台查看
                $.ajax({
                    url: "checkCode",
                    type: 'post',//method请求方式，get或者post
                    dataType: 'json',//预期服务器返回的数据类型
                    data: {
                        "account":$("#account").val(),
                        "code":$("#code").val()
                    },
                    //表格数据序列化
                    success: function (res) {//res为相应体,function为回调函数
                        layer.close(layer.index);
                        if (res.success == true) {
                            layer.alert('成功', {icon: 1});
                            //$("#res").click();//调用重置按钮将表单数据清空
                            setTimeout(function () {
                                $("#main").load("msg/unreadMsg");
                            },200)

                        } else {
                            layer.alert(data.msg, {icon: 2});
                        }
                    },
                    error: function () {
                        layer.close(layer.index);
                        layer.alert('操作失败！！！', {icon: 5});
                    }

                });
            }else{
                layer.msg("请先通过滑块验证");
            }
            return false;
        });

        $("button[name='back']").on('click',function(){
            window.location.href="login";

        });
        $("button[name='getCode']").on('click',function(){
            var str=$("#account").val();
            if(str==null||str==""){
                layer.alert('请先填写账号！！！', {icon: 5});
            }else {
                $("button[name='getCode']").addClass("layui-btn-disabled");
                $.ajax({
                    url: "getCode",
                    type: "post",
                    data: {
                        "account": $("#account").val()
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.success) {
                            layer.alert('发送验证码成功！', {icon: 1});
                            setTimeout(function () {
                                $("button[name='getCode']").removeClass("layui-btn-disabled");
                            }, 1000 * 60 * 3);
                        } else {
                            layer.alert(data.msg, {icon: 2});
                            $("button[name='getCode']").removeClass("layui-btn-disabled");
                        }

                    },
                    error: function () {
                        alert("获取验证码异常！");
                    }
                });
            }
        });

    });


</script>
</body>
</html>
