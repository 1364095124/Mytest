<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/26
  Time: 14:20
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
                 <option value="note"  >内容</option>
                <option value="state">状态</option>
            </select>
        </span>
    <button class="layui-btn" data-type="reload">搜索</button>

</div>

<table id="test" lay-filter="test"></table>
    <script type="text/html" id="sumState">

    </script>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">查看批注</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">查看流程</a>
    </script>

<script>
    var n;
    layui.use('table', function() {
        var table = layui.table;
        //渲染
        table.render({
            elem: '#test'  //绑定table表格
            , height: 450
            , url: 'task/daiban/daibanList' //后台springmvc接收路径
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
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {
                    field: 'createTime',
                    align: 'center',
                    title: '申请时间',
                    width: 250,
                    fixed: 'left',
                    unresize: true,
                    sort: true
                }
                , {field: 'name', align: 'center', title: '名称' }
                , {field: 'applyName', title: '申请人'}

                , {fixed:'right',align:'cneter',templet:'#barDemo'}
            ]]
        });
        table.on('tool(test)', function(obj) {
            var data = obj.data;
            n = data;
            if (obj.event === 'detail') {
                var data = obj.data;
                var leaveForm=data.leaveForm;
                var temp='<div class="form " style="background: #ffffff;">\n' +
                    '    <h2 style="text-align: center">差旅费报销单</h2>\n' +
                    '        <br/>\n' +
                    '        <form class="layui-form" action="" id="test">\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">报销人所属部门：</label>\n' +
                    '                <div class="layui-input-block" style="width: 400px;">\n' +
                    '                    <input type="text" name="department_Name" value='+leaveForm.department_Name+' readonly\n' +
                    '                           autocomplete="off" placeholder="请输入部门" class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">报销人</label>\n' +
                    '                <div class="layui-input-block" style="width: 500px;">\n' +
                    '                    <input type="text" name="account" value='+leaveForm.account+'   readonly \n' +
                    '                           autocomplete="off" class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <div class="layui-inline">\n' +
                    '                    <label class="layui-form-label">出发地点</label>\n' +
                    '                    <div class="layui-input-inline">\n' +
                    '                        <input type="tel" name="start_place"  value='+leaveForm.start_place+' readonly\n' +
                    '                               autocomplete="off" class="layui-input">\n' +
                    '                    </div>\n' +
                    '                </div>\n' +
                    '                <div class="layui-inline">\n' +
                    '                    <label class="layui-form-label">到达地点</label>\n' +
                    '                    <div class="layui-input-inline">\n' +
                    '                        <input type="text" name="end_place" value='+leaveForm.end_place+' readonly ' +
                    '                            class="layui-input">\n' +
                    '                    </div>\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <div class="layui-inline">\n' +
                    '                    <label class="layui-form-label">出发时间</label>\n' +
                    '                    <div class="layui-input-inline">\n' +
                    '                        <input type="tel" name="start_time" value='+leaveForm.start_time+' readonly\n' +
                    '                               autocomplete="off" class="layui-input">\n' +
                    '                    </div>\n' +
                    '                </div>\n' +
                    '                <div class="layui-inline">\n' +
                    '                    <label class="layui-form-label">到达时间</label>\n' +
                    '                    <div class="layui-input-inline">\n' +
                    '                        <input type="text" name="end_time" value='+leaveForm.end_time+' readonly\n' +
                    '                                class="layui-input">\n' +
                    '                    </div>\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">费用类型</label>\n' +
                    '                <div class="layui-input-block" style="width:300px !important;">\n' +
                    '                    <select name="type"  >\n' +
                    '                        <option value="'+leaveForm.type+'">'+leaveForm.type+'</option>\n' +
                    '                        <option value="0" selected="">车费</option>\n' +
                    '                        <option value="1" >住宿费</option>\n' +
                    '                        <option value="2">伙食费</option>\n' +
                    '                        <option value="3">其他综合</option>\n' +
                    '                    </select>\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '            <div class="layui-form-item">\n' +
                    '                <label class="layui-form-label">合计：</label>\n' +
                    '                <div class="layui-input-block" style="width: 500px;">\n' +
                    '                    <input type="text" name="sum" value='+leaveForm.sum+' readonly\n' +
                    '                            class="layui-input">\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '            <div class="layui-form-item layui-form-text">\n' +
                    '                <label class="layui-form-label">具体事项</label>\n' +
                    '                <div class="layui-input-block" style="width:800px;">\n' +
                    '                    <textarea  name="note" class="layui-textarea">'+leaveForm.note+'</textarea>\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '            <br/>\n' +
                    '            <br/><hr/><br/>\n' +
                    '            <div class="layui-form-item layui-form-text">\n' +
                    '                <label class="layui-form-label">批注</label>\n' +
                    '                <div class="layui-input-block" style="width:800px;">\n' +
                    '                    <textarea  name="comment" id="comment" class="layui-textarea">没意见</textarea>\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        <div class="layui-form-item">\n' +
                    '            <div class="layui-input-block">\n' +
                    '                <button lay-submit lay-filter="SubForm" state="1" class="layui-btn" >同意</button>\n' +
                    '                <button lay-submit lay-filter="SubForm"  state="0" class="layui-btn layui-btn-primary">不同意</button>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
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
                form.render();
                form.on('submit(SubForm)', function(data) {
                   var comment=$("#comment").val();
                   var state=$(this).attr("state");
                   console.log("state"+state);
                   $.ajax({
                      type:'post',
                      url:'task/doAuditing',
                      data:{
                          "taskId":n.id,
                          "comment":comment,
                          "state":state
                      },
                       dataType:'json',
                      success:function(rs){
                          if(rs.success){
                              layer.close(index);
                              layer.alert('成功', {icon: 1});
                              setTimeout(function(){
                                  $("#main").load("task/daibanjsp");
                              },200);
                          }else{
                              layer.alert(rs.msg, {icon: 2});
                          }
                      },
                      error:function(){
                          layer.alert('异常！', {icon: 2});
                      }
                   });
                   return false;
                });
            }
        });
    });
</script>
</body>

