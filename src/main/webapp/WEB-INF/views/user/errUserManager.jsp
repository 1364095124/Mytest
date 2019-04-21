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
    <a class="layui-btn layui-btn-xs" lay-event="edit">启用</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">

        <button class="layui-btn mgl-20" lay-submit="" lay-filter="export">导出</button>
    </div>
</script>
<script type="text/html" id="Disstate">

    {{#  if(d.isDisabled == '0'){ }}
    <input type="checkbox" name="isRead" value="启用中" lay-skin="switch"
           lay-text="启用中|禁用中" lay-filter="isShow" checked>
    {{#  } else { }}
    <input type="checkbox" name="isRead" value="禁用中" lay-skin="switch"
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
                {field: 'ip', title: '访问ip', width:250,sort:true,filter: true},
                {field: 'createTime', title: '发生时间', width: 150, sort: true, filter: {type: 'date[yyyy-MM-dd HH:mm:ss]'}},
                {field: 'reason', title: '原因', width: 265 , filter: true},
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
                url: 'user/getAllErrUser',
                data: data,
                dataType: 'json',
                success: function (res) {
                    myTable.reload({
                        data: res.data
                    })
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



        //监听行工具条
        table.on('tool(myTable)', function(obj) {
            var data = obj.data;

            if (obj.event === 'del') {
                layer.confirm('确定要删除吗？', {
                    btn: ['确定','取消'] //按钮
                }, function(){
                    $.ajax({
                        type:'post',
                        url:'user/delErrUser',
                        data:{
                            "id":data.id
                        },
                        dataType: 'json',
                        success:function(rs){
                            if(rs.success){
                                layer.msg(data.name+'删除成功', {icon: 1});
                                setTimeout(function(){
                                    $("#main").load("user/errUserList");
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
               $.ajax({
                   type:'post',
                   url:'user/updateDisToR',
                   data:{
                       "account":data.account,
                       "isDisabled":0
                   },
                   dataType:'json',
                   success:function(rs){
                       if(rs.success){
                           layer.msg(data.account+'启用成功', {icon: 1});
                           setTimeout(function(){
                               $("#main").load("user/errUserList");
                           },200)
                       }else{
                           layer.msg(data.account+'删除失败',{icon:2});
                       }
                   },
                   error:function(){
                       layer.msg("操作异常",{icon:5});
                   }
               });
            }
        });

    })
</script>

</body>


