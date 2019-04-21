<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/2
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
<div class="layui-form layui-card-header layuiadmin-card-header-auto">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" name="id" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="email" placeholder="请输入" autocomplete="off" class="layui-input">
                <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <select name="sex">
                    <option value="0">不限</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="请选择" value="不限" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="0" class="layui-this">不限</dd><dd lay-value="1" class="">男</dd><dd lay-value="2" class="">女</dd></dl></div>
            </div>
        </div>
        <div class="layui-inline">
            <button class="layui-btn layuiadmin-btn-useradmin" lay-submit="" lay-filter="LAY-user-front-search">
                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
            </button>
        </div>
    </div>
</div>
    <table id="test" lay-filter="test"></table>

        <script>
        layui.use('table', function(){
            var table = layui.table;

            //渲染
            table.render({
                elem: '#test'  //绑定table表格
                ,height: 450
                ,url: 'message/messageList' //后台springmvc接收路径
                ,page:true    //true表示分页
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
                    ,{field:'sendTime', title:'时间', width:80, fixed: 'left', unresize: true, sort: true}
                    ,{field:'send_id', title:'发送人', width:80, edit: 'text'}
                    ,{field:'content', title:'内容', width:120, edit: 'text'}
                    ,{field:'isRead', title:'状态', width:80}
                    ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
                ]]
            });



            //监听表格行点击
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

            });

            //监听工具条
            table.on('tool(test)', function(obj){
                var data = obj.data;
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        obj.del();
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    layer.prompt({
                        formType: 2
                        ,value: data.username
                    }, function(value, index){
                        obj.update({
                            username: value
                        });
                        layer.close(index);
                    });
                }
            });

            var $ = layui.jquery, active = {
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

