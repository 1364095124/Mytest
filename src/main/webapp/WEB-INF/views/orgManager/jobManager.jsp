<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/4
  Time: 18:56
  Description:职位管理页面
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>



<table id="myTable" lay-filter="myTable"></table>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">

        <button class="layui-btn mgl-20"  lay-event="add">新增</button>
        <button class="layui-btn mgl-20" lay-submit="" lay-filter="export">导出</button>
    </div>
</script>
<script>
    var list;//保存所有已经注册的职位
    // 自定义模块
    layui.config({
        base: 'ext/'   // 模块目录

    });
    layui.use(['form', 'table','soulTable','layer'], function () {
        var table = layui.table,
            soulTable = layui.soulTable,
            layer=layui.layer,
            form = layui.form;
        var myTable = table.render({
            elem: '#myTable'
            ,height: 555
            ,limit: 10
            ,page: true
            ,toolbar: '#toolbarDemo'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'},
                {field: 'name', title: '名称', width: 250, sort: true, filter: true},
                {field: 'number', title: '编码', width: 150, sort: true, filter: true},
                {field: 'pname', title: '上级职位', width: 265 , filter: true},
                {field: 'createTime', title: '创建时间', width: 270, filter: {type: 'date[yyyy-MM-dd HH:mm:ss]'}},
                {field: 'createAccount', title: '创建人', width: 150,  filter: true, sort:true},
                {title: '操作',  templet: '#bar'}
            ]]
            ,done: function () {
                soulTable.render(this)
            }
        });
        search({});
        function search(data) {
            var loading = layer.load(2);
            $.ajax({
                url: 'org/getAllJob',
                data: data,
                dataType: 'json',
                success: function (res) {
                    myTable.reload({
                        data: res.data
                    })
                    list=res.data;
                },
                complete: function () {
                    layer.close(loading)
                }
            })
        }
        form.on('submit(search)', function (data) {
            search(data.field);
        })
        form.on('submit(export)', function () {
            soulTable.export(myTable);
        })

        //头工具栏事件
        table.on('toolbar(myTable)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            if(obj.event=='add') {

                var str = '<option value=""></option>';
                for (var i = 0; i < list.length; i++) {
                    str += '<option value="' + list[i].id + '">' + list[i].name + '</option>';
                }
                var ht = ' <form class="layui-form" id="myForm" action="">\n' +
                    '        <br/><br/><div class="layui-form-item">\n' +
                    '            <label class="layui-form-label">职位名称</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <input type="text" name="name"  id="name" required  lay-verify="required" ' +
                    '                   placeholder="请输入名称" style="width:500px;" autocomplete="off" class="layui-input">\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item">\n' +
                    '            <label class="layui-form-label">职位编码</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <input type="text" name="number"  id="number" style="width:500px;"  placeholder="请输入编码"\n' +
                    '                       autocomplete="off" class="layui-input">\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">上级职位</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <select name="pid" id="pid" >\n';
                ht += str;
                ht += '                </select>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item">\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <button type="button" name="sub" class="layui-btn" lay-submit lay-filter="subForm">立即提交</button>\n' +
                    '                <button type="reset" class="layui-btn layui-btn-primary">重置</button>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '\n' +
                    '    </form>';

                var index = layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['1000px', '500px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: ht//打开的内容
                });
                form.render();
                $(document).on('click','button[name="sub"]',function(){
                    $.ajax({
                        url: "org/addJob",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data:  $("#myForm").serialize(),
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(layer.index);
                            if (res.success == true) {
                                layer.alert('成功', {icon: 1});
                                //$("#res").click();//调用重置按钮将表单数据清空
                                setTimeout(function () {
                                    $("#main").load("org/jobList");
                                }, 200)


                            } else {
                                layer.alert(res.msg, {icon: 2});
                            }
                        },
                        error: function () {
                            layer.close(layer.index);
                            layer.alert('操作失败！！！', {icon: 5});
                        }

                    });
                });
            }
        });

        //监听行工具条
        table.on('tool(myTable)', function(obj) {
            var data = obj.data;

            if (obj.event === 'del') {
                layer.confirm('确定要删除'+data.name+'吗？', {
                    btn: ['确定','取消'] //按钮
                }, function(){
                    $.ajax({
                        type:'post',
                        url:'org/delJob',
                        data:{
                            "id":data.id
                        },
                        dataType: 'json',
                        success:function(rs){
                            if(rs.success){
                                layer.msg(data.name+'删除成功', {icon: 1});
                                setTimeout(function(){
                                    $("#main").load("org/jobList");
                                },200)
                            }else{
                                layer.msg(data.name+'删除失败',{icon:2});
                            }
                        },
                        error:function(){
                            layer.msg("操作异常",{icon:5});
                        }
                    })

                }, function() {
                    layer.closeAll();
                });
            }else if(obj.event== 'edit'){
                var str = '<option value=""></option>';
                for (var i = 0; i < list.length; i++) {
                    if(data.pid==list[i].pid){
                        str+='<option value="' + list[i].id + '" selected="selected">' + list[i].name + '</option>';
                    }else{
                        str += '<option value="' + list[i].id + '">' + list[i].name + '</option>';
                    }
                }
                var ht = ' <form class="layui-form" id="myForm" action="">\n' +
                    '        <br/><br/><div class="layui-form-item">\n' +
                    '            <label class="layui-form-label">职位名称</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <input type="text" name="name"  id="name" value="'+data.name+'" required  lay-verify="required" ' +
                    '                    style="width:500px;" autocomplete="off" class="layui-input">\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item">\n' +
                    '            <label class="layui-form-label">职位编码</label>\n' +
                    '            <div class="layui-input-block">\n' ;
                if(data.number==undefined){
                    ht+='<input type="text" name="number"  id="number" style="width:500px;"  \n' +
                        '    autocomplete="off" class="layui-input">\n' ;
                }else {
                    ht += '<input type="text" name="number"  id="number" style="width:500px;"  value="' + data.number + '"\n' +
                        '   autocomplete="off" class="layui-input">\n';
                }
                ht+='            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">上级职位</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <select name="pid" id="pid" >\n';
                ht += str;
                ht += '                </select>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item">\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <button type="button" name="subEdit" class="layui-btn" lay-submit lay-filter="subForm">立即提交</button>\n' +
                    '                <button type="reset" class="layui-btn layui-btn-primary">重置</button>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '\n' +
                    '    </form>';

                var index = layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['1000px', '500px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: ht//打开的内容
                });


                form.render();
                $(document).on('click','button[name="subEdit"]',function(){
                    $.ajax({
                        url: "org/updateJob",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data:  {
                            "id":data.id,
                            "name":$("#name").val(),
                            "number":$("#number").val(),
                            "pid":$("#pid").val()
                        },
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(layer.index);
                            if (res.success == true) {

                                //$("#res").click();//调用重置按钮将表单数据清空
                                setTimeout(function () {
                                    $("#main").load("org/jobList");
                                }, 200)
                                layer.alert('成功', {icon: 1});

                            } else {
                                layer.alert(res.msg, {icon: 2});
                            }
                        },
                        error: function () {
                            layer.close(layer.index);
                            layer.alert('操作失败！！！', {icon: 5});
                        }

                    });
                });
            }
        });

    })
</script>

</body>

