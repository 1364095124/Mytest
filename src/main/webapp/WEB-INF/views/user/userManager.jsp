<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/8
  Time: 13:32
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
<script type="text/html" id="Disstate">
    {{#  if(d.isDisabled == 0){ }}
    <input type="checkbox" name="isDisabled" value="启用中" lay-skin="switch"
           lay-text="启用中|禁用中" lay-filter="isShow" checked>
    {{#  } else { }}
    <input type="checkbox" name="isDisabled" value="禁用中" lay-skin="switch"
           lay-text="启用中|禁用中" lay-filter="isShow" >
    {{#  } }}
</script>
<script>


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
                {field: 'account', title: '账号', width: 250, sort: true, filter: true},
                {field: 'name', title: '姓名', width:250,sort:true,filter: true},
                {field: 'sex', title: '性别', width: 150, sort: true, filter: true},
                {field: 'phone', title: '联系电话', width: 265 , filter: true},
                {field: 'isDisabled', title: '状态', width: 270, templet:'#Disstate'},
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
                url: 'person/getAllPerson',
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
            if(obj.event=='add') {
                var ht='<form class="layui-form" action="">\n' +
                    '    <br/><br/><div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">账号</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="account" id="account" required  lay-verify="required" ' +
                    '               placeholder="请输入账号"  class="layui-input"></div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">密码</label>\n' +
                    '        <div class="layui-input-inline">\n' +
                    '            <input type="password" name="password" id="password"  required lay-verify="required" ' +
                    '               value="123456"  class="layui-input"></div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">重复密码</label>\n' +
                    '        <div class="layui-input-inline">\n' +
                    '            <input type="password" name="repassword" id="repassword" required lay-verify="required"' +
                    '               value="123456"  class="layui-input"></div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-row">\n' +
                    '        <div class="layui-col-md6">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">姓名</label>\n' +
                    '                <div class="layui-input-block">\n' +
                    '                    <input type="text" name="name" id="name" required  lay-verify="required" placeholder="请输入姓名"  class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-col-md6">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">年龄</label>\n' +
                    '                <div class="layui-input-block">\n' +
                    '                    <input type="text" name="age" id="age"   placeholder="请输入年龄"  class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">性别</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="radio" name="sex" value="1" title="男">\n' +
                    '            <input type="radio" name="sex" value="0" title="女" checked>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-row">\n' +
                    '        <div class="layui-col-md6">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">联系电话</label>\n' +
                    '                <div class="layui-input-block">\n' +
                    '                    <input type="text" name="phone" id="phone"  placeholder="请输入手机号"  class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-col-md6">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">邮箱</label>\n' +
                    '                <div class="layui-input-block">\n' +
                    '                    <input type="text" name="email" id="email" lay-verify="email"   placeholder="请输入邮箱"  class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    ' <div class="layui-form-item">\n' +
                    '    <label class="layui-form-label">是否管理员</label>\n' +
                    '    <div class="layui-input-block">\n' +
                    '      <input type="checkbox" lay-text="是|否" name="switch" lay-skin="switch">\n' +
                    '    </div>\n' +
                    '  </div>\n'+
                    '        <div class="layui-form-item">\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <button class="layui-btn"  name="sub" lay-submit lay-filter="SubForm">立即提交</button>\n' +
                    '                <button type="reset" class="layui-btn layui-btn-primary">重置</button>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '</form>';
                var index = layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['1000px', '600px'],//定义宽和高
                    title: '请填写信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: ht//打开的内容
                });
                form.render();
                form.on('submit(SubForm)',function(){
                    var pwd=$("#password").val()
                    var repwd=$("#repassword").val();
                    if(pwd!=repwd){
                        layer.alert('两次密码不一致！！！', {icon: 5});
                    }else{
                        $.ajax({
                            url: "person/insertPerson",
                            type: 'post',//method请求方式，get或者post
                            dataType: 'json',//预期服务器返回的数据类型
                            data:  {
                                "account":$("#account").val(),
                                "password":pwd,
                                "age":$("#age").val(),
                                "name":$("#name").val(),
                                "phone":$("#phone").val(),
                                "email":$("#email").val(),
                                "sex":$("input[name='sex']:checked").val()
                            },
                            //表格数据序列化
                            success: function (res) {//res为相应体,function为回调函数
                                layer.close(layer.index);
                                if (res.success == true) {
                                    setTimeout(function () {
                                        $("#main").load("person/personList");
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
                    }
                    return false;
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
                        url:'person/delPerson',
                        data:{
                            "account":data.account
                        },
                        dataType: 'json',
                        success:function(rs){
                            if(rs.success){
                                layer.msg(data.account+'删除成功', {icon: 1});
                                setTimeout(function(){
                                    $("#main").load("person/personList");
                                },200)
                            }else{
                                layer.msg(data.account+'删除失败',{icon:2});
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
                var ht='<form class="layui-form" action="">\n' +
                    '    <br/><br/><div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">账号</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="account" id="account" required  lay-verify="required" ' +
                    '                 readonly value="'+data.account+'" class="layui-input"></div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">密码</label>\n' +
                    '        <div class="layui-input-inline">\n' +
                    '            <input type="password" name="password" id="password"  required lay-verify="required" ' +
                    '               value="'+data.password+'"  class="layui-input"></div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">重复密码</label>\n' +
                    '        <div class="layui-input-inline">\n' +
                    '            <input type="password" name="repassword" id="repassword" required lay-verify="required"' +
                    '               value="'+data.password+'"  class="layui-input"></div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-row">\n' +
                    '        <div class="layui-col-md6">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">姓名</label>\n' +
                    '                <div class="layui-input-block">\n' +
                    '                    <input type="text" name="name" id="name" value="'+data.name+'"required  lay-verify="required" placeholder="请输入姓名"  class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-col-md6">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">年龄</label>\n' +
                    '                <div class="layui-input-block">\n' +
                    '                    <input type="text" name="age" id="age"   value="'+data.age+'"  class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">性别</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="radio" name="sex" value="1" title="男" checked>\n' +
                    '            <input type="radio" name="sex" value="0" title="女" >\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-row">\n' +
                    '        <div class="layui-col-md6">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">联系电话</label>\n' +
                    '                <div class="layui-input-block">\n' +
                    '                    <input type="text" name="phone" id="phone" value="'+data.phone+'"  class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-col-md6">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">邮箱</label>\n' +
                    '                <div class="layui-input-block">\n' +
                    '                    <input type="text" name="email" id="email"  lay-verify="email" value="'+data.email+'"  class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    ' <div class="layui-form-item">\n' +
                    '    <label class="layui-form-label">是否管理员</label>\n' +
                    '    <div class="layui-input-block">\n' +
                    '      <input type="checkbox" lay-text="是|否" name="switch" lay-skin="switch">\n' +
                    '    </div>\n' +
                    '  </div>\n'+
                    '        <div class="layui-form-item">\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <button class="layui-btn"  name="sub" lay-submit lay-filter="sub">立即提交</button>\n' +
                    '                <button type="reset" class="layui-btn layui-btn-primary">重置</button>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '</form>';
                var index = layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['1000px', '700px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: ht//打开的内容
                });


                form.render();
                form.on('submit(sub)',function(){
                    $.ajax({
                        url: "person/updatePerson",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data:  {
                            "account":$("#account").val(),
                            "password":pwd,
                            "age":$("#age").val(),
                            "name":$("#name").val(),
                            "phone":$("#phone").val(),
                            "email":$("#email").val(),
                            "sex":$("input[name='sex']:checked").val()
                        },
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(index);
                            if (res.success == true) {
                                layer.alert('成功', {icon: 1});
                                setTimeout(function () {
                                    $("#main").load("person/personList");
                                }, 200)


                            } else {
                                layer.alert(res.msg, {icon: 2});
                            }
                        },
                        error: function () {
                            layer.close(index);
                            layer.alert('操作失败！！！', {icon: 5});
                        }

                    });
                    return false;
                });
            }
        });

    })
</script>

</body>



