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
    <div class="" style="margin-top: 20px;margin-left:20px;">
        <div id="demo"></div>
    </div>
    <script>
        var layout = [
            {name: 'id',field: 'id',headerClass: 'value_col',colClass: 'value_col'},
            {name: '菜单名称',treeNodes: true,headerClass: 'value_col',colClass: 'value_col'},
            {name: '操作',headerClass: 'value_col',colClass: 'value_col',style: 'width: 30%',
                render: function(row) {
                    return [
                        '<a class="layui-btn layui-btn-xs layui-btn-danger"> <i class="layui-icon "></i> </a>',
                ].join('');
                }
            }
        ];
        layui.use(['form', 'tree', 'layer'], function() {
            var layer = layui.layer;
            var    form = layui.form;
            var tree1 = layui.treeGird({
                elem: '#demo', //传入元素选择器
                spreadable: false, //设置是否全展开，默认不展开
                checkbox: true,
                nodes: [{
                    "id": "1",
                    "name": "父节点1",
                    "children": [{
                        "id": "11",
                        "name": "父节点11"
                    },
                        {
                            "id": "12",
                            "name": "父节点12"
                        }
                    ]
                },
                    {
                        "id": "2",
                        "name": "父节点2",
                        "children": [{
                            "id": "21",
                            "name": "子节点21",
                            "children": [{
                                "id": "211",
                                "name": "子节点211"
                            },
                                {
                                    "id": "211",
                                    "name": "子节点211"
                                }
                            ]
                        }]
                    }
                ],
                layout: layout
            });
            form.render();
        });
        //收起
        $('#collapse').on('click', function() {
            layui.collapse(tree1);
        });
        //删除
        $('#deleteAll').on('click', function() {
            var arr = layui.getSelected(tree1);
            //console.log(arr);
        });
        //展开
        $('#expand').on('click', function() {
            layui.expand(tree1);
        });

    </script>
</body>

