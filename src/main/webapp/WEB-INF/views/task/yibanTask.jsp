<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/23
  Time: 0:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
    <table id="myTable" lay-filter="myTable"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="findComment">查看批注</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="findPro">查看流程</a>
    </script>
    <script>
        var list;
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
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {
                        field: 'createTime',
                        align: 'center',
                        title: '申请时间',
                        width: 250,
                        fixed: 'left',
                        filter: {type: 'date[yyyy-MM-dd HH:mm:ss]'},
                        sort: true
                    }
                    , {field: 'name', align: 'center', title: '名称', sort: true, filter: true }
                    , {field: 'applyName', title: '申请人', sort: true, filter: true}
                    , {fixed:'right',align:'cneter',templet:'#barDemo'}

                ]]
                , done: function () {
                    soulTable.render(this)
                }
            });
            search({});

            function search(data) {
                var loading = layer.load(2);
                $.ajax({
                    url: 'task/getYiBanTask',
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
            });
            table.on('tool(myTable)', function(obj) {
                var data = obj.data;
                n = data;
                if (obj.event == 'detail') {
                    var d =data.leaveForm ;
                    var temp='<div class="form " style="background: #ffffff;">\n' +
                        '    <h2 style="text-align: center">差旅费报销单</h2>\n' +
                        '        <br/>\n' +
                        '        <form class="layui-form" action="" id="test">\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <label class="layui-form-label">报销人所属部门：</label>\n' +
                        '                <div class="layui-input-block" style="width: 400px;">\n' +
                        '                    <input type="text" name="department_Name" value='+d.department_Name+' readonly\n' +
                        '                           autocomplete="off" placeholder="请输入部门" class="layui-input">\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <label class="layui-form-label">报销人</label>\n' +
                        '                <div class="layui-input-block" style="width: 500px;">\n' +
                        '                    <input type="text" name="account" value='+d.account+'   readonly \n' +
                        '                           autocomplete="off" class="layui-input">\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <label class="layui-form-label">出发地点</label>\n' +
                        '                    <div class="layui-input-inline">\n' +
                        '                        <input type="tel" name="start_place"  value='+d.start_place+' readonly\n' +
                        '                               autocomplete="off" class="layui-input">\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <label class="layui-form-label">到达地点</label>\n' +
                        '                    <div class="layui-input-inline">\n' +
                        '                        <input type="text" name="end_place" value='+d.end_place+' readonly ' +
                        '                            class="layui-input">\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <label class="layui-form-label">出发时间</label>\n' +
                        '                    <div class="layui-input-inline">\n' +
                        '                        <input type="tel" name="start_time" value='+d.start_time+' readonly\n' +
                        '                               autocomplete="off" class="layui-input">\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <label class="layui-form-label">到达时间</label>\n' +
                        '                    <div class="layui-input-inline">\n' +
                        '                        <input type="text" name="end_time" value='+d.end_time+' readonly\n' +
                        '                                class="layui-input">\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <label class="layui-form-label">费用类型</label>\n' +
                        '                <div class="layui-input-block" style="width:300px !important;">\n' +
                        '                    <select name="type" >\n' +
                        '                        <option value="">'+d.type+'</option>\n' +
                        '                        <option value="0" selected="">车费</option>\n' +
                        '                        <option value="1" >住宿费</option>\n' +
                        '                        <option value="2">伙食费</option>\n' +
                        '                        <option value="3">其他综合</option>\n' +
                        '                    </select>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <label class="layui-form-label">合计：</label>\n' +
                        '                <div class="layui-input-block" style="width: 500px;">\n' +
                        '                    <input type="text" name="sum" value='+d.sum+' readonly\n' +
                        '                            class="layui-input">\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <div class="layui-form-item layui-form-text">\n' +
                        '                <label class="layui-form-label">具体事项</label>\n' +
                        '                <div class="layui-input-block" style="width:800px;">\n' +
                        '                    <textarea  name="note" class="layui-textarea">'+d.note+'</textarea>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <br/>\n' +
                        '            <br/>\n' +
                        '        </form>\n' +
                        '    </div>';
                    var index=layer.open({
                        type: 1,//类型
                        offset: '50px',
                        area: ['1000px', '800px'],//定义宽和高
                        title: '查看详细信息',//题目
                        shadeClose: false,//点击遮罩层关闭
                        content: temp//打开的内容
                    });
                }else if(obj.event=='findPro'){
                    $("#main").load("task/openActivitiProccessImagePage",{"pProcessInstanceId":data.processInstanceId});

                }else if(obj.event=='findComment'){
                    console.log(data.processInstanceId);
                    $.ajax({
                        type:'post',
                        url:'task/listHistoryComment',
                        data:{
                            "processInstanceId":data.leaveForm.processInstanceId
                        },
                        dataType:'json',
                        success:function(rs){
                            var ht='<form class="layui-form" action="">';
                            for(var i=0;i<rs.length;i++){
                                ht+='<br/><div class="layui-form-item">\n' +
                                    '        <label class="layui-form-label">审批人</label>\n' +
                                    '        <div class="layui-input-block">\n' +
                                    '            <input type="text" name="name" value="'+rs[i].name+'" class="layui-input">\n' +
                                    '        </div>\n' +
                                    '    </div>\n' +
                                    '    <div class="layui-form-item">\n' +
                                    '        <label class="layui-form-label">审批时间</label>\n' +
                                    '        <div class="layui-input-block">\n' +
                                    '            <input type="text" name="cTime" value="'+rs[i].cTime+'" class="layui-input">\n' +
                                    '        </div>\n' +
                                    '    </div>\n' +
                                    '    <div class="layui-form-item">\n' +
                                    '        <label class="layui-form-label">审批意见</label>\n' +
                                    '        <div class="layui-input-block">\n' +
                                    '            <textarea name="comment"  class="layui-textarea">'+rs[i].comment+'</textarea>\n' +
                                    '        </div>\n' +
                                    '    </div><hr/>'
                            }
                            ht+='</form>';
                            layer.open({
                                type: 1,//类型
                                offset: '50px',
                                area: ['1000px', '800px'],//定义宽和高
                                title: '查看审批意见',//题目
                                shadeClose: false,//点击遮罩层关闭
                                content: ht//打开的内容
                            });

                        },
                        error:function(){
                            layer.alert("异常！",{icon:5});
                        }
                    })
                }
            });
        });
    </script>
</body>

