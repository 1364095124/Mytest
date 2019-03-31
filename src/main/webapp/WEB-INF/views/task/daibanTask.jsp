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
            , toolbar: '#toolbarDemo'
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

                var index=layer.open({
                    type: 1,//类型
                    offset: '50px',
                    area: ['1000px', '800px'],//定义宽和高
                    title: '查看详细信息',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: temp//打开的内容
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
    });
</script>
</body>

