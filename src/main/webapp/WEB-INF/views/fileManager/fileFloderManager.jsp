<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/20
  Time: 20:19
  Decription: 文件夹管理
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
    </div>
</script>
<script type="text/html" id="Type">

    {{#  if(d.password != ""){ }}
    <span class="layui-icon layui-icon-password"></span>
    {{#  } else { }}
    <span class="layui-icon layui-icon-auz"></span>
    {{#  } }}
</script>
<script>
    var list;
    // 自定义模块
    layui.config({
        base: 'ext/'   // 模块目录

    });
    layui.use(['form', 'table','soulTable','layer','upload'], function () {
        var table = layui.table,
            soulTable = layui.soulTable,
            layer=layui.layer,
            upload=layui.upload;
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
                {field: 'createTime', title: '创建时间', width: 270, filter: {type: 'date[yyyy-MM-dd HH:mm:ss]'}},
                {field: 'createAccount', title: '创建人', width: 150,  filter: true, sort:true},
                {field: 'note', title: '备注', width: 265 , filter: true},
                {field: 'type', title: '类型', width: 80, templet:'#Type'},
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
                url: 'file/getAllFileFloder',
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
                var str='<form class="layui-form" action="">\n' +
                    '    <br/><br/><div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">名称</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="name" required  lay-verify="required" id="name" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">上级目录</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <select name="pid" id="pid" >\n' +
                    '                <option value=""></option>\n' ;
                    for(var i=0;i<list.length;i++){
                        str+='<option value="'+list[i].id+'">'+list[i].name+'</option>';
                    }

                    str+='            </select>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">是否加密</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <select name="type"  lay-filter="type" lay-verify="required">\n' +
                    '                <option value="0">不加密</option>\n' +
                    '                <option value="1">加密</option>\n' +
                    '            </select>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item layui-form-text">\n' +
                    '        <label class="layui-form-label">描述</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <textarea name="note" id="note" placeholder="请输入内容" class="layui-textarea"></textarea>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                        '<div id="ext">\n' +
                        '        </div>'+
                    '    <div class="layui-form-item">\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <button class="layui-btn" lay-submit lay-filter="sub">立即提交</button>\n' +
                    '            <button type="reset" class="layui-btn layui-btn-primary">重置</button>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '</form>';
                var index = layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['1000px', '550px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: str//打开的内容
                });
                form.render();
                form.on('submit(sub)',function(rs){
                    var d;
                    d.name=$("#name").val();
                    d.note=$("#note").val();
                    d.pid=$("#pid option:selected").val();
                    d.createAccount=$("#curUser").html();
                    if($(".extcon").length>0){
                        d.password=$("#password").val();
                    }else{
                        d.password="";
                    }
                    $.ajax({
                        type:'post',
                        url:'file/addFileFloder',
                        data:d,
                        dataType:'json',
                        success:function(mydata){
                            if(mydata.success){
                                layer.alert('成功', {icon: 1});
                                //$("#res").click();//调用重置按钮将表单数据清空
                                setTimeout(function () {
                                    $("#main").load("file/fileFloderList");
                                }, 200)
                            }else{
                                layer.alert(res.msg, {icon: 2});
                            }
                        },
                        error:function(){
                            layer.close(layer.index);
                            layer.alert('操作失败！！！', {icon: 5});
                        }
                    });
                    return false;
                });
                form.on('select(type)', function(data){
                    if(data.value=='1'){
                        var str1='<div class="layui-form-item extcon">\n' +
                            '    <label class="layui-form-label">密码</label>\n' +
                            '    <div class="layui-input-block">\n' +
                            '        <input type="password" name="password" required  lay-verify="required" placeholder="请输入密码" class="layui-input">\n' +
                            '    </div>\n' +
                            '</div>\n';
                        $("#ext").append(str1);
                    }else{
                        if($(".extcon").length>0){
                            $('.extcon').remove();
                        }
                    }
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
                        url:'org/delOrg',
                        data:{
                            "id":data.id
                        },
                        dataType: 'json',
                        success:function(rs){
                            if(rs.success){
                                layer.msg(data.name+'删除成功', {icon: 1});
                                setTimeout(function(){
                                    $("#main").load("org/orgList");
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


                var index = layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['1000px', '500px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: ht//打开的内容
                });

                $("#pid").val(data.pid);
                form.render();
                form.on('submit(sub)',function(rs){
                    $.ajax({
                        url: "org/updateOrg",
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
                                    $("#main").load("org/orgList");
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
                    return false;
                });
            }
        });

    })
</script>

</body>



