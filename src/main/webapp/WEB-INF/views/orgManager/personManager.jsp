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
    var accountList;//保存所有已经注册的账号
    var jobList; //保存所有已经注册的职位
    var depList; //保存所有已经注册的部门
    var orgList; //保存所有已经注册的组织

    //初始化组织列表
    $.ajax({
        type:'post',
        url:'org/getAllOrg',
        data:{},
        dataType:'json',
        success:function (result) {
            var list=result.data;
            orgList='<option value=""></option>';
            for (var i = 0; i < list.length; i++) {
                orgList += '<option value="' + list[i].id + '">' + list[i].name + '</option>';
            }
        },
        error:function(){
            alert("初始化组织列表失败！");
        }
    });

    //初始化职位列表
    $.ajax({
        type:'post',
        url:'org/getAllJob',
        data:{},
        dataType:'json',
        success:function (result) {
            var list=result.data;
            jobList='<option value=""></option>';
            for (var i = 0; i < list.length; i++) {
                jobList += '<option value="' + list[i].id + '">' + list[i].name + '</option>';
            }
        },
        error:function(){
            alert("初始化职位列表失败！");
        }
    });

    //初始化部门列表
    $.ajax({
        type:'post',
        url:'org/getAllDep',
        data:{},
        dataType:'json',
        success:function (result) {
            var list=result.data;
            depList='<option value=""></option>';
            for (var i = 0; i < list.length; i++) {
                depList += '<option value="' + list[i].id + '">' + list[i].name + '</option>';
            }
        },
        error:function(){
            alert("初始化部门列表失败！");
        }
    });

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
                {field: 'name', title: '姓名', width:250,sort:true,filter: true},
                {field: 'jobName', title: '职位名称', width: 150, sort: true, filter: true},
                {field: 'departmentName', title: '部门名称', width: 265 , filter: true},
                {field: 'organizationName', title: '组织名称', width: 270, filter: true},
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
                url: 'org/getAllPersonJobList',
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


                var ht = '<form class="layui-form" id="myForm" action="">\n' +
                    '        <br/><br/><div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">账号</label>\n' +
                    '            <div class="layui-input-block" >\n' +
                    '                <select name="account" id="account" lay-verify="required">\n' ;
                    ht+=accountList;
                    ht+='                </select>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">所属组织</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <select name="organizationid" id="organizationid" lay-verify="required">\n' ;
                    ht+=orgList;
                    ht+='                </select>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">所属部门</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <select name="departmentid" id="departmentid" lay-verify="required">\n';
                    ht+=depList;
                    ht+='                </select>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">所属职位</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <select name="jobid" id="jobid" lay-verify="required">\n';
                    ht+=jobList;
                    ht+='                </select>\n' +
                    '            </div>\n' +
                    '        </div><br/>\n' +
                    '<div class="layui-form-item">\n' +
                    '    <div class="layui-input-block">\n' +
                    '      <button type="button" name="sub" class="layui-btn" >立即提交</button>\n' +
                    '      <button type="reset" class="layui-btn layui-btn-primary">重置</button>\n' +
                    '    </div>\n' +
                    '  </div>'
                    '    </form>';

                var index = layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['700px', '480px'],//定义宽和高
                    title: '新增人员职位信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: ht//打开的内容
                });
                form.render();
                $(document).on('click','button[name="sub"]',function(){
                    $.ajax({
                        url: "org/addPersonJob",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data:  {
                            "account":$("#account").val(),
                            "organizationid":$("#organizationid").val(),
                            "departmentid":$("#departmentid").val(),
                            "jobid":$("#jobid").val()
                        },
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(layer.index);
                            if (res.success == true) {
                                layer.alert('成功', {icon: 1});
                                //$("#res").click();//调用重置按钮将表单数据清空
                                setTimeout(function () {
                                    $("#main").load("org/personJobList");
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
                layer.confirm('确定要删除'+data.name+'-'+data.jobName+'吗？', {
                    btn: ['确定','取消'] //按钮
                }, function(){
                    $.ajax({
                        type:'post',
                        url:'org/delPersonJob',
                        data:{
                            "id":data.id
                        },
                        dataType: 'json',
                        success:function(rs){
                            if(rs.success){
                                layer.msg(data.name+'删除成功', {icon: 1});
                                setTimeout(function(){
                                    $("#main").load("org/personJobList");
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
                var ht = '<form class="layui-form" id="myForm" action="">\n' +
                    '        <br/><br/><div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">账号</label>\n' +
                    '            <div class="layui-input-block" >\n' +
                    '             <input type="text" name="account" id="account" readonly value="'+data.account+'_'+data.name+'" ' +
                    ' class="layui-input"></div>'+
                    '        </div>\n' +
                    '        <div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">所属组织</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <select name="organizationid" id="organizationid" lay-verify="required">\n' +
                    '                    <option value='+data.organizationid+' selected="selected">'+data.organizationName+'</option>';
                ht+=orgList;
                ht+='                </select>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">所属部门</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <select name="departmentid" id="departmentid" lay-verify="required">\n'+
                    '                    <option value='+data.departmentid+' selected="selected">'+data.departmentName+'</option>';
                ht+=depList;
                ht+='                </select>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '        <div class="layui-form-item" style="width:500px;">\n' +
                    '            <label class="layui-form-label">所属职位</label>\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <select name="jobid" id="jobid" lay-verify="required">\n'+
                    '                    <option value='+data.jobid+' selected="selected">'+data.jobName+'</option>';
                ht+=jobList;
                ht+='                </select>\n' +
                    '            </div>\n' +
                    '        </div><br/>\n' +
                    '<div class="layui-form-item">\n' +
                    '    <div class="layui-input-block">\n' +
                    '      <button type="button" name="subEdit" class="layui-btn" >立即提交</button>\n' +
                    '      <button type="reset" class="layui-btn layui-btn-primary">重置</button>\n' +
                    '    </div>\n' +
                    '  </div>'
                '    </form>';

                var index = layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['700px', '480px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: ht//打开的内容
                });


                form.render();
                $(document).on('click','button[name="subEdit"]',function(){
                    $.ajax({
                        url: "org/updatePersonJob",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data:  {
                            "id":data.id,
                            "account":$("#account").val(),
                            "departmentid":$("#departmentid").val(),
                            "organizationid":$("#organizationid").val(),
                            "jobid":$("#jobid").val()
                        },
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(layer.index);
                            if (res.success == true) {
                                setTimeout(function () {
                                    $("#main").load("org/personJobList");
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

