<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/14
  Time: 23:29
  Description:会议管理页面
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>



<table id="myTable" lay-filter="myTable"></table>
<script type="text/html" id="bar">

    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">

        <button class="layui-btn mgl-20"  lay-event="add">新增</button>
        <button class="layui-btn mgl-20" lay-submit="" lay-filter="export">导出</button>
    </div>
</script>
<script>
    var accountList;
    //初始化账号列表
    $.ajax({
        type:'post',
        url:'person/getAllPerson',
        data:{},
        dataType:'json',
        success:function (result) {
            var list=result.data;
            accountList='<option value=""></option>';
            for (var i = 0; i < list.length; i++) {
                accountList += '<option value="' + list[i].account + '">'+list[i].account+'_' + list[i].name + '</option>';
            }
        },
        error:function(){
            alert("初始化账号列表失败！");
        }
    });
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
                {field: 'createAccount', title: '授权人', width: 150, sort: true, filter: true},
                {field: 'createTime', title: '授权日期', width: 265 , filter: {type: 'date[yyyy-MM-dd HH:mm:ss]'}},
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
                url: 'aut/getAllMettingAut',
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


                var ht = '<form class="layui-form" action="">\n' +
                    '  <br/><br/>  <div class="layui-form-item" style="width:510px;">\n' +
                    '        <label class="layui-form-label">选择账号</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <select name="account" id="account" lay-verify="required">\n' ;
                    ht+=accountList;
                    ht+='            </select>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">权限名称</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="permission" id="permission" readonly style="width:400px;"' +
                        'value="会议管理" class="layui-input"><div/>\n' +
                    '    </div><br/><br/>\n' +
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
                    area: ['1000px', '500px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: ht//打开的内容
                });
                form.render();
                form.on('submit(sub)',function(rs){
                    var param = JSON.stringify(rs.field);//定义临时变量获取表单提交过来的数据，非json格式
                    $.ajax({
                        url: "aut/addNoticeAut",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data:  {
                            "account":$('#account option:selected').val(),
                            "permission":$("#permission").val()
                        },
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(layer.index);
                            if (res.success == true) {
                                layer.alert('成功', {icon: 1});
                                //$("#res").click();//调用重置按钮将表单数据清空
                                setTimeout(function () {
                                    $("#main").load("aut/mettingAutList");
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
                    return false;
                });
            }
        });

        //监听行工具条
        table.on('tool(myTable)', function(obj) {
            var data = obj.data;

            if (obj.event === 'del') {
                layer.confirm('确定要删除'+data.account+'的授权吗？', {
                    btn: ['确定','取消'] //按钮
                }, function(){
                    $.ajax({
                        type:'post',
                        url:'aut/delAut',
                        data:{
                            "id":data.id
                        },
                        dataType: 'json',
                        success:function(rs){
                            if(rs.success){
                                layer.msg(data.name+'删除成功', {icon: 1});
                                setTimeout(function(){
                                    $("#main").load("aut/mettingAutList");
                                },200)
                            }else{
                                layer.msg(data.account+'的授权删除失败',{icon:2});
                            }
                        },
                        error:function(){
                            layer.msg("操作异常",{icon:5});
                        }
                    })

                }, function() {
                    layer.closeAll();
                });

            }
        });

    })
</script>

</body>




