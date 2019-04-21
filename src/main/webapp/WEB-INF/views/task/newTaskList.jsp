<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/10
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
    <table id="myTable" lay-filter="myTable"></table>
    <script type="text/html" id="bar">
        <a class="layui-btn layui-btn-xs" lay-event="new">新建</a>
    </script>
    <script>
        // 自定义模块
        layui.config({
            base: 'ext/'   // 模块目录

        });
        layui.use(['form', 'table','soulTable','layer'], function () {
            var table = layui.table,
                soulTable = layui.soulTable,
                layer = layui.layer,
                form = layui.form;
            var myTable = table.render({
                elem: '#myTable'
                , height: 555
                , limit: 10
                , page: true
                , cols: [[
                    {type: 'checkbox', fixed: 'left'},
                    {field: 'title', title: '名称', width: 250, sort: true, filter: true},
                    {field: 'decription', title: '描述', width: 150, sort: true, filter: true},
                    {field: 'belong', title: '创建人', width: 265, filter: true},
                    {field: 'createTime', title: '创建时间', width: 270, filter: {type: 'date[yyyy-MM-dd HH:mm:ss]'}},
                    {title: '操作', templet: '#bar'}
                ]]
                , done: function () {
                    soulTable.render(this)
                }
            });
            search({});

            function search(data) {
                var loading = layer.load(2);
                $.ajax({
                    url: 'task/getAllTaskList',
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
                if (obj.event === 'new') {
                    $("#main").load(data.url);
                }
            });
        });
    </script>
</body>

