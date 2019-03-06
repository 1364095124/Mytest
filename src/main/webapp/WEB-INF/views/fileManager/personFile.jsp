<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/5
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--个人空间--%>
<body>
<button class="ayui-btn layui-btn-radius layui-btn-normal" name="download">
    <i class="layui-icon layui-icon-download-circle"/>download</button>
    <div id="demo"></div>
    <script>
        var layout = [
            { name: '菜单名称', treeNodes: true, headerClass: 'value_col', colClass: 'value_col', style: '' },
            {
                name: '操作',
                headerClass: 'value_col',
                colClass: 'value_col',
                style: 'width: 20%',
                render: function(row) {
                    return "<a class='layui-btn layui-btn-danger layui-btn-sm' onclick='del(" + row + ")'><i class='layui-icon'>&#xe640;</i> 删除</a>"; //列渲染
                }
            },
        ];
        layui.use(['form', 'treetable', 'layer'], function() {
            var layer = layui.layer, form = layui.form, $ = layui.jquery;

            var tree = layui.treetable({
                elem: '#demo', //传入元素选择器
                spreadable: false, //设置是否全展开，默认不展开
                checkbox: true,
                nodes: [{
                    "id": "1",
                    "name": "父节点1",
                    "checked": false,
                    "children": [{
                        "id": "11",
                        "name": "子节点11",
                    },
                        {
                            "id": "12",
                            "name": "子节点12",
                        }
                    ]
                },
                    {
                        "id": "2",
                        "name": "父节点2",
                        "checked": true,
                        "children": [{
                            "id": "21",
                            "name": "子节点21",
                            "children": [{
                                "id": "211",
                                "name": "子节点211"
                            }]
                        }]
                    },
                    {
                        "id": "3",
                        "name": "父节点3"
                    }
                ],
                layout: layout
            });

            form.render();
        });

        $("button[name='download']").on('click',function(){
            window.open('file/download');
            setTimeout(function(){
                window.history.back(-1);
            },1000)

        });
    </script>
</body>

