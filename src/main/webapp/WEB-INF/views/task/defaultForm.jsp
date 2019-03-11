<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/2/28
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>费用报销单</title>

</head>
<body>
    <div style="background: #ffffff;height:130px;">
        <br/>

        <br/>
        <p style="color:#696969;margin-left:15px;">新建事项&nbsp;/&nbsp;<span style="font-size:22px;">填写表单</span></p>
        <hr/>
    </div>

    <div class="form " style="background: #ffffff;">
    <h2 style="text-align: center">差旅费报销单</h2>
        <br/>
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">报销人所属部门：</label>
                <div class="layui-input-block" style="width: 400px;">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入部门"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">报销人</label>
                <div class="layui-input-block" style="width: 500px;">
                    <input type="text" name="username" lay-verify="required" placeholder="请输入姓名"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">出发地点</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="start_place" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">到达地点</label>
                    <div class="layui-input-inline">
                        <input type="text" name="end_place" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">出发时间</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="start_time" id="start_time" lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">到达时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="end_time" id="end_time" lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>





            <div class="layui-form-item">
                <label class="layui-form-label">费用类型</label>
                <div class="layui-input-block">
                    <select name="interest" lay-filter="aihao">
                        <option value=""></option>
                        <option value="0" selected="">车费</option>
                        <option value="1" >住宿费</option>
                        <option value="2">伙食费</option>
                        <option value="3">其他综合</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">合计：</label>
                <div class="layui-input-block" style="width: 500px;">
                    <input type="text" name="money" lay-verify="required|number" placeholder="请输入金额"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">具体事项</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
            <br/>
            <br/>
        </form>
    </div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#start_time'
        });
        laydate.render({
            elem: '#end_time'
        });
        form.render();
    });
</script>
</body>
</html>
