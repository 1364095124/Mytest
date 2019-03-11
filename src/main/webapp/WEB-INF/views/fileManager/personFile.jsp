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
<%--<div style="background-color:#ffffff;">
    <ul class="layui-timeline">
        <li class="layui-timeline-item">
            <i class="layui-icon layui-icon-circle-dot layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
                <h3 class="layui-timeline-title">8月18日</h3>
                <p>
                    layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。
                    <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                    <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                </p>
            </div>
        </li>
        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
                <h3 class="layui-timeline-title">8月16日</h3>
                <p>杜甫的思想核心是儒家的仁政思想，他有<em>“致君尧舜上，再使风俗淳”</em>的宏伟抱负。个人最爱的名篇有：</p>
                <ul>
                    <li>《登高》</li>
                    <li>《茅屋为秋风所破歌》</li>
                </ul>
            </div>
        </li>
        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
                <h3 class="layui-timeline-title">8月15日</h3>
                <p>
                    中国人民抗日战争胜利日
                    <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                    <br>铭记、感恩
                    <br>所有为中华民族浴血奋战的英雄将士
                    <br>永垂不朽
                </p>
            </div>
        </li>
        <li class="layui-timeline-item">
            <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
                <div class="layui-timeline-title">过去</div>
            </div>
        </li>
    </ul>
</div>--%>

<button class="ayui-btn layui-btn-radius layui-btn-normal" name="download">
    <i class="layui-icon layui-icon-download-circle"/>download</button>
<a href="/file/download">前往下载</a>
<button class="layui-btn layui-btn-normal" name="test">测试</button>
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

        $("button[name='test']").on('click',function(){
           $.ajax({
               url:"process/deploy",
               data:"",
               type:"post",
               error:function(){
                   alert("异常");
               }
           }) ;
        });

    </script>
</body>

