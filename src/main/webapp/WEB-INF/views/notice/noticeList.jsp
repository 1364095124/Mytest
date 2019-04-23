<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/15
  Time: 11:05
  Description:公告列表
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>



<table id="myTable" lay-filter="myTable"></table>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs" name="edit" lay-event="edit">详情</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" name="del" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn mgl-20" name="add" lay-event="add">新增</button>
        <button class="layui-btn mgl-20" lay-submit="" lay-filter="export">导出</button>
    </div>
</script>
<script>
    var flag;
    //查询当前用户是否有公告管理权限
    $.ajax({
       type:'post',
       url:'aut/queryAutByAccount',
        data:{
           'permission':'公告管理'
        },
        success:function(rs){
           rs=eval(rs);
           if(rs>0){
               flag=true;
           }else{
               flag=false;
           }
        },
        error:function(){
           alert("获取权限异常！");
        }
    });
    // 自定义模块
    layui.config({
        base: 'ext/'   // 模块目录

    });
    layui.use(['form', 'table','soulTable','layer','laydate'], function () {
        var table = layui.table,
            soulTable = layui.soulTable,
            layer=layui.layer,
            laydate=layui.laydate,
            form = layui.form;
        var myTable = table.render({
            elem: '#myTable'
            ,height: 555
            ,limit: 10
            ,page: true
            ,toolbar: '#toolbarDemo'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'},
                {field: 'title', title: '标题', width: 250, sort: true, filter: true},
                {field: 'content', title: '详细', width: 150, sort: true, filter: true},
                {field: 'tiggerTime', title: '过期时间', width: 265 , filter: {type: 'date[yyyy-MM-dd HH:mm:ss]'}},
                {field: 'createName', title: '创建人', width: 150,  filter: true, sort:true},
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
                url: 'notice/getAllNotice',
                data: data,
                dataType: 'json',
                success: function (res) {
                    myTable.reload({
                        data: res.data
                    });
                    if(!flag){
                        $("a[name='del']").addClass("layui-btn-disabled");
                        $("a[name='del']").attr("disabled","disabled");
                        $("button[name='add']").addClass("layui-btn-disabled");
                        $("button[name='add']").attr("disabled","disabled");
                    }
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
                var ht = '<form class="layui-form" id="myForm" action="">\n' +
                    '    <br/><br/><div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">标题</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="title" id="title" required  lay-verify="required"\n' +
                    '                   placeholder="请输入标题" style="width:400px;" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">过期时间</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="tiggerTime" id="tiggerTime" required  lay-verify="required"\n' +
                    '                    class="layui-input" style="width:400px;">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '<div class="layui-form-item layui-form-text">\n' +
                    '                <label class="layui-form-label">具体事项</label>\n' +
                    '                <div class="layui-input-block" style="width:700px;">\n' +
                    '                    <textarea placeholder="请输入内容" name="content" id="content" class="layui-textarea"></textarea>\n' +
                    '                </div>\n' +
                    '            </div>'+
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
                laydate.render({
                    elem: '#tiggerTime' //指定元素
                    ,type: 'datetime'
                });
                form.render();
                form.on('submit(sub)',function(rs){
                    var param = JSON.stringify(rs.field);//定义临时变量获取表单提交过来的数据，非json格式
                    $.ajax({
                        url: "notice/addNotice",
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
                                    $("#main").load("notice/noticeList");
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
                layer.confirm('确定要删除'+data.title+'公告吗？', {
                    btn: ['确定','取消'] //按钮
                }, function(){
                    $.ajax({
                        type:'post',
                        url:'notice/delNotice',
                        data:{
                            "id":data.id
                        },
                        dataType: 'json',
                        success:function(rs){
                            if(rs.success){
                                layer.msg(data.title+'删除成功', {icon: 1});
                                setTimeout(function(){
                                    $("#main").load("notice/noticeList");
                                },200)
                            }else{
                                layer.msg(data.title+'删除失败',{icon:2});
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
                    '    <br/><br/><div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">标题</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="title" id="title" value="'+data.title+'"  required  lay-verify="required"\n' +
                    '                   placeholder="请输入标题" style="width:400px;" class="layui-input" readonly>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">过期时间</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="tiggerTime" id="tiggerTime" value="'+data.tiggerTime+'" required  lay-verify="required"\n' +
                    '                    class="layui-input" style="width:400px;" readonly>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '<div class="layui-form-item layui-form-text">\n' +
                    '                <label class="layui-form-label">具体事项</label>\n' +
                    '                <div class="layui-input-block" style="width:700px;">\n' +
                    '                    <textarea placeholder="请输入内容" readonly name="content" id="content" class="layui-textarea">'+data.content+'</textarea>\n' +
                    '                </div>\n' +
                    '            </div>'+
                    '    <div class="layui-form-item">\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <button class="layui-btn" name="submit" lay-submit lay-filter="subForm">提交</button>\n' +
                    '            <button type="button" name="update" class="layui-btn layui-btn-primary">修改</button>\n' +
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

                if(!flag){
                    $("button[name='submit']").addClass("layui-btn-disabled");
                    $("button[name='submit']").attr("disabled","disabled");
                    $("button[name='update']").addClass("layui-btn-disabled");
                    $("button[name='update']").attr("disabled","disabled");
                }
                laydate.render({
                    elem: '#tiggerTime' //指定元素
                    ,type: 'datetime'
                });
                form.render();
                $(document).on('click','button[name="update"]',function(){
                    $("#title").attr("readonly",false);
                    $("#tiggerTime").attr("readonly",false);
                    $("#content").attr("readonly",false);
                });
                form.on('submit(subForm)',function(rs){
                    var param=JSON.stringify(rs.field);
                    $.ajax({
                        url: "notice/updateNotice",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data:  {
                          "id":data.id,
                          "title":$("#title").val(),
                          "tiggerTime":$("#tiggerTime").val(),
                          "content":$("#content").val()
                        },
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(layer.index);
                            if (res.success == true) {
                                layer.alert('成功', {icon: 1});
                                //$("#res").click();//调用重置按钮将表单数据清空
                                setTimeout(function () {
                                    $("#main").load("notice/noticeList");
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

    })
</script>

</body>



