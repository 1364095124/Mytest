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
        <p style="color:#696969;margin-left:15px;">新建事项&nbsp;/&nbsp;<span style="font-size:22px;">填写差旅费表单</span></p>
        <hr/>
    </div>

    <div class="form " style="background: #ffffff;">
    <h2 style="text-align: center">差旅费报销单</h2>
        <br/>
        <form class="layui-form" action="" id="test">
            <div class="layui-form-item">
                <label class="layui-form-label">所属部门</label>
                <div class="layui-input-block">
                    <input type="text" name="department_Name" id="department_Name"  lay-verify="required"  readonly
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">报销人</label>
                <div class="layui-input-block" style="width: 500px;">
                    <input type="text" name="account" id="account"  lay-verify="required"  readonly
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">出发地点</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="start_place"  lay-verify="required"
                               autocomplete="off" class="layui-input">
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
                <div class="layui-input-block" style="width:300px !important;">
                    <select name="type"  >
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
                    <input type="text" name="sum" lay-verify="required|number" placeholder="请输入金额"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">具体事项</label>
                <div class="layui-input-block" style="width:800px;">
                    <textarea placeholder="请输入内容" name="note" id="note" class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button  class="layui-btn" lay-submit lay-filter="SubForm">立即提交</button>
                    <button  type="button" name="saveForm" class="layui-btn layui-btn-primary">存为草稿</button>
                </div>
            </div>
            <br/>
            <br/>
        </form>
    </div>

<script>
    $("#account").val($("#curUser").html());
    //初始化部门列表
    $.ajax({
        type:'post',
        url:'org/queryJobInfoByAccount',
        data:{
            "account":$("#curUser").html()
        },
        dataType:'json',
        success:function(rs){
            $("#department_Name").val(rs.departmentName);
        },
        error:function(){
            alert("获取用户职位信息异常！");
        }
    });

    layui.use(['form', 'layedit', 'laydate','layer'], function() {
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

        $("button[name='saveForm']").on('click',function(){
            $.ajax({
                type:'post',
                url:'task/saveTask',
                data:$("#test").serialize(),
                dataType:'json',
                success:function(data){
                    if(data.success==true){
                        layer.alert('保存成功', {icon: 1});
                    }else{
                        layer.alert(data.msg, {icon: 2});
                    }
                },
                error:function(){
                    layer.alert('操作异常！！！', {icon: 5});
                }
            });
        });

        form.on('submit(SubForm)', function(data) {
            var param = JSON.stringify(data.field);//定义临时变量获取表单提交过来的数据，非json格式
            console.log(param);
            $.ajax({
                url: "task/autoStartApply",
                type: 'post',//method请求方式，get或者post
                dataType: 'json',//预期服务器返回的数据类型
                contentType: "application/json; charset=utf-8",
                data: param,
                //表格数据序列化
                success: function (res) {//res为相应体,function为回调函数
                    layer.close(layer.index);
                    if (res.success == true) {
                        layer.alert('发送成功', {icon: 1});
                        setTimeout(function(){
                            $("#main").load("task/allTaskList");
                        },200);

                    } else {
                        layer.alert(data.msg, {icon: 2});
                    }
                },
                error: function () {
                    layer.alert('操作异常！！！', {icon: 5});
                }

            });
            return false;
        });
    });



</script>
</body>
</html>
