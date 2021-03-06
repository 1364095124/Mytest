<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/23
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<body>

    <div class="demoTable">
        搜索：
        <div class="layui-inline">
            <input class="layui-input" placeholder="点击后面按钮选择查询类型" name="keyWord" id="keyWord" autocomplete="off">
        </div>
        <span class="input-group-btn">
            <select name="keyType" id="key_type" class="layui-btn layui-btn-normal">
                <option value="applyTime" selected="selected">时间</option>
                 <option value="note">内容</option>
                <option value="state">状态</option>
            </select>
        </span>
        <button class="layui-btn" data-type="reload">搜索</button>

    </div>

    <table id="test" lay-filter="test"></table>
    <script type="text/html" id="sumState">
        {{#  if(eval(d.sum) >=150){ }}
        <span style="background: #FF5722;color:#ffffff;">{{d.sum}}</span>
        {{#  } else { }}
        <span style="background: #009688;color:#ffffff;">{{d.sum}}</span>
        {{#  } }}
    </script>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="findComment">查看批注</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="findPro">查看流程</a>
    </script>

    <script>
        layui.use('table', function() {
            var table = layui.table;
            //渲染
            table.render({
                elem: '#test'  //绑定table表格
                , height: 450
                , url: 'task/taskList' //后台springmvc接收路径
                , page: true    //true表示分页
                , toolbar: '#toolbarDemo'

                /* page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                 layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                     //,curr: 5 //设定初始在第 5 页
                     ,groups: 3 //只显示 1 个连续页码
                     ,first: true //不显示首页
                     ,last: true //不显示尾页
                  }*/
                , where: {
                    account: $("#curUser").html()
                } //传参数
                , limit: 10
                , id: 'contenttable'
                , toolbar: '#toolbarDemo'
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {
                        field: 'applyTime',
                        align: 'center',
                        title: '申请时间',
                        width: 250,
                        fixed: 'left',
                        unresize: true,
                        sort: true
                    }
                    , {field: 'end_place', align: 'center', title: '目的地' }
                    , {field: 'start_time', title: '出差时间'}
                    , {field: 'sum', title: '金额', width: 170,templet:'#sumState'}
                    , {field: 'note', align: 'center',title:'详情' }
                    , {field: 'state',title:'状态'}
                    , {fixed:'right',align:'cneter',templet:'#barDemo'}
                ]]
            });
            table.on('tool(test)', function(obj) {
                var data = obj.data;
                n = data;
                if (obj.event == 'detail') {
                    var data = obj.data;
                    var temp='<div class="form " style="background: #ffffff;">\n' +
                        '    <h2 style="text-align: center">差旅费报销单</h2>\n' +
                        '        <br/>\n' +
                        '        <form class="layui-form" action="" id="test">\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <label class="layui-form-label">报销人所属部门：</label>\n' +
                        '                <div class="layui-input-block" style="width: 400px;">\n' +
                        '                    <input type="text" name="department_Name" value='+data.department_Name+' readonly\n' +
                        '                           autocomplete="off" placeholder="请输入部门" class="layui-input">\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <label class="layui-form-label">报销人</label>\n' +
                        '                <div class="layui-input-block" style="width: 500px;">\n' +
                        '                    <input type="text" name="account" value='+data.account+'   readonly \n' +
                        '                           autocomplete="off" class="layui-input">\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <label class="layui-form-label">出发地点</label>\n' +
                        '                    <div class="layui-input-inline">\n' +
                        '                        <input type="tel" name="start_place"  value='+data.start_place+' readonly\n' +
                        '                               autocomplete="off" class="layui-input">\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <label class="layui-form-label">到达地点</label>\n' +
                        '                    <div class="layui-input-inline">\n' +
                        '                        <input type="text" name="end_place" value='+data.end_place+' readonly ' +
                        '                            class="layui-input">\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <label class="layui-form-label">出发时间</label>\n' +
                        '                    <div class="layui-input-inline">\n' +
                        '                        <input type="tel" name="start_time" value='+data.start_time+' readonly\n' +
                        '                               autocomplete="off" class="layui-input">\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '                <div class="layui-inline">\n' +
                        '                    <label class="layui-form-label">到达时间</label>\n' +
                        '                    <div class="layui-input-inline">\n' +
                        '                        <input type="text" name="end_time" value='+data.end_time+' readonly\n' +
                        '                                class="layui-input">\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '\n' +
                        '\n' +
                        '\n' +
                        '\n' +
                        '            <div class="layui-form-item">\n' +
                        '                <label class="layui-form-label">费用类型</label>\n' +
                        '                <div class="layui-input-block" style="width:300px !important;">\n' +
                        '                    <select name="type"  >\n' +
                        '                        <option value=""></option>\n' +
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
                        '                    <input type="text" name="sum" value='+data.sum+' readonly\n' +
                        '                            class="layui-input">\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '\n' +
                        '            <div class="layui-form-item layui-form-text">\n' +
                        '                <label class="layui-form-label">具体事项</label>\n' +
                        '                <div class="layui-input-block" style="width:800px;">\n' +
                        '                    <textarea  name="note" class="layui-textarea">'+data.note+'</textarea>\n' +
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
                            "processInstanceId":data.processInstanceId
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
            var  active = {
                getCheckData: function(){//获取选中数据
                    var checkStatus = table.checkStatus('test')
                        ,data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                }
                ,getCheckLength: function(){//获取选中数目
                    var checkStatus = table.checkStatus('test')
                        ,data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                }
                ,isAll: function(){验证是否全选
                    var checkStatus = table.checkStatus('test');
                    layer.msg(checkStatus.isAll ? '全选': '未全选')
                }
                ,parseTable: function(){
                    table.init('parse-table-demo', {
                        limit: 3
                    });
                }
                ,add: function(){
                    table.addRow('test')
                }
                ,delete: function(){
                    layer.confirm('确认删除吗？', function(index){
                        table.deleteRow('test')
                        layer.close(index);
                    });
                }
                ,reload:function () {
                    var keyWord=$("#keyWord").val();
                    var keyType=$("#key_type option:selected").val();
                    table.reload('contenttable',{
                        where:{keyWord:keyWord,keyType:keyType}
                    });
                }
            };
        });
    </script>
</body>

