<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/2
  Time: 13:54
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
            <option value="sendTime" selected="selected">时间</option>
             <option value="content"  >内容</option>
        </select>
    </span>
    <button class="layui-btn" data-type="reload">搜索</button>

</div>

<table id="test" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">回复</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="Readstate">

    {{#  if(d.isRead == 0){ }}
    <input type="checkbox" name="isRead" value="{{d.isRead}}" lay-skin="switch"
           lay-text="已读|未读" lay-filter="isShow" >
    {{#  } else { }}
    <input type="checkbox" name="isRead" value="{{d.isRead}}" lay-skin="switch"
           lay-text="已读|未读" lay-filter="isShow" checked>
    {{#  } }}
</script>

<script>
    var n;
    layui.use('table', function(){
        var table = layui.table;
        //渲染
        table.render({
            elem: '#test'  //绑定table表格
            ,height: 450
            ,url: 'msg/msgList' //后台springmvc接收路径
            ,page:true    //true表示分页
            ,toolbar:'#toolbarDemo'
            /* page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
             layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                 //,curr: 5 //设定初始在第 5 页
                 ,groups: 3 //只显示 1 个连续页码
                 ,first: true //不显示首页
                 ,last: true //不显示尾页
              }*/
            ,where:{
                account:$("#curUser").html()
            } //传参数
            ,limit: 10
            ,id:'contenttable'
            ,toolbar: '#toolbarDemo'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'sendTime', align:'center',title:'时间', width:250, fixed: 'left', unresize: true, sort: true}
                ,{field:'send_id', align:'center',title:'发送人', width:220, edit: 'text'}
                ,{field:'content', title:'内容', width:300, edit: 'text'}
                ,{field:'isRead', title:'状态', width:170,templet:'#Readstate'}
                ,{fixed: 'right', align:'center', toolbar: '#barDemo'}
            ]]
        });




       /* //监听表格行点击
        table.on('tr', function(obj){
            console.log(obj)
        });

        //监听表格复选框选择
        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });

        //监听表格单选框选择
        table.on('radio(test2)', function(obj){
            console.log(obj)
        });

        //监听单元格编辑
        table.on('edit(test2)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段

        });*/

        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            n=data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        type:"post",
                        url:"msg/delMsg",
                        resultType:"json",
                        data:{
                            "id":data.id
                        },
                        success:function(data){
                            if(data!=""&&data!=null){
                                if(data.success=true){
                                    layer.msg("删除成功！");
                                    obj.del();
                                }else{
                                    layer.msg("删除失败！");
                                }
                            }
                        },
                        error:function(){
                            alert("删除异常！");
                        }
                    })

                    layer.close(index);
                });
            } else if(obj.event === 'edit'){

                layer.prompt({
                    formType: 2
                    ,value: ""
                }, function(value, index){
                    var msg={
                        "send_id":$("#curUser").html(),
                        "receive_id":data.send_id,
                        "content":value,
                        "type":"消息"
                    }
                    $.ajax({
                        type:"post",
                        url:"msg/addMsg",
                        resultType:'json',
                        dataType:"json",
                        contentType: "application/json;charset=utf-8",
                        data:JSON.stringify(msg),
                        success:function(data){
                            if(data!=""){
                                if(data.success==true){
                                    layer.msg("发送成功！");
                                }else{
                                    layer.msg("发送失败");
                                }
                            }
                        },
                        error:function(){
                            alert("失败！");
                        }
                    })
                    layer.close(index);
                });
            }else if(obj.event === 'detail'){
                var data = obj.data;
                var temp=" <form class=\"layui-form\" action=\"\" >\n" +
                    "        <br/> <br/> <br/><div class=\"layui-form-item\">\n" +
                    "            <label class=\"layui-form-label\">发送者</label>\n" +
                    "            <div class=\"layui-input-block\" style=\"width: 500px;\">\n" +
                    "                <input type=\"text\" name=\"send_id\" id=\"send_id\" readonly value="+data.send_id+"\n" +
                    "                        class=\"layui-input\">\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "        <div class=\"layui-form-item\">\n" +
                    "            <label class=\"layui-form-label\">发送时间</label>\n" +
                    "            <div class=\"layui-input-block\" style=\"width: 500px;\">\n" +
                    "                <input type=\"date\" name=\"sendTime\" id=\"sendTime\" readonly value="+data.sendTime+"\n" +
                    "                        class=\"layui-input\">\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "        <div class=\"layui-form-item layui-form-text\">\n" +
                    "            <label class=\"layui-form-label\">内容</label>\n" +
                    "            <div class=\"layui-input-block\" name=\"\" style=\"width:800px;\">\n" +
                    "                <textarea id=\"content\" name=\"content\" readonly  class=\"layui-textarea\">"+data.content+"</textarea>\n" +
                    "            </div>\n" +
                    "        </div>\n" ;
                if(data.isRead==0){
                    temp+= "        <div class=\"layui-form-item\">\n" +
                        "            <div class=\"layui-input-block\">\n" +
                        "                <button  class=\"layui-btn\" lay-submit lay-filter=\"SubForm\">已读</button>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <br/>\n" +
                        "        <br/>\n" +
                        "    </form>";
                }else{
                    temp+=
                        "        <div class=\"layui-form-item\">\n" +
                        "            <div class=\"layui-input-block\">\n" +
                        "                <button  class=\"layui-btn layui-btn-disabled\" lay-submit lay-filter=\"SubForm\">已读</button>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <br/>\n" +
                        "        <br/>\n" +
                        "    </form>";
                }

                var index=layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['1000px', '700px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: temp//打开的内容
                });
                form.on('submit(SubForm)', function(data) {
                    var param = JSON.stringify(data.field);//定义临时变量获取表单提交过来的数据，非json格式
                    //测试是否获取到表单数据，调试模式下在页面控制台查看
                    $.ajax({
                        url: "msg/updateToRead",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data: {
                            "id":n.id
                        },
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(layer.index);
                            if (res.success == true) {
                                layer.alert('成功', {icon: 1});
                                //$("#res").click();//调用重置按钮将表单数据清空
                                setTimeout(function () {
                                    $("#main").load("msg/unreadMsg");
                                },200)

                            } else {
                                layer.alert(data.msg, {icon: 2});
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
        $('i').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $('.layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

</script>
</body>

