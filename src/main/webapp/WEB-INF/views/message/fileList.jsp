<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/23
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
    <table id="test"  lay-filter="myTable"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    </script>
    <script>
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
                , toolbar: '#toolbarDemo'
                , cols:[[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field:'sendTime', align:'center',title:'时间', width:250, fixed: 'left', unresize: true, sort: true}
                    ,{field:'send_id', align:'center',title:'发送人', width:220, edit: 'text'}
                    ,{field:'content', title:'内容', width:300, edit: 'text'}
                    ,{field:'isRead', title:'状态', width:170,templet:'#Readstate'}
                    ,{fixed: 'right', align:'center', toolbar: '#barDemo'}
                ]]
                , done: function () {
                    soulTable.render(this)
                }
            });
            search({});

            function search(data) {
                var loading = layer.load(2);
                $.ajax({
                    url: 'org/getAllDep',
                    data: data,
                    dataType: 'json',
                    success: function (res) {
                        myTable.reload({
                            data: res.data
                        })
                        list = res.data;
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
        });
    </script>
</body>

