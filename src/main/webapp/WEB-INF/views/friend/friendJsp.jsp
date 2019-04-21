<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/3
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

</head>
<style>
    .myli{
        list-style-type:none;
        margin-top:10px;
        width:70%;
        margin-left:15%;
        height:75px;

        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 8px;
        background: rgba(255,255,255,0.7);
        transition:0.3s;
    }
    .myli:hover{
        background: rgba(255,255,255,1);
    }
    .myli img{
        height:55px;
        margin-top:10px ;
        margin-left: 15px;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
    }
    .myli .account{
        font-size: 25px;
        font-weight: 100;
        position:relative;
        top:5px;
        left:25px;
    }
    .myli .title{
        font-size: 12px;

        top:30px;
        position: relative;

        color:rgba(105,105,105,0.8);
    }
    .myli .mytooler{
        float:right;
        margin-top:30px;
        margin-right:40px;
    }
    .myli .mytooler a{
        cursor:pointer;
    }
</style>
<body>
    <div>
        <input type="text" style="width:400px;" name="title" placeholder="请输入标题" autocomplete="off" class="layui-input">
        <button id="" style="folat:left" class="layui-btn layui-btn-normal">
            <span class="layui-icon layui-icon-search"></span>
        </button>
    </div>
    <ul id="plist">


    </ul>


    <script>

        //初始化列表
        $.ajax({
            type:'post',
            url:'person/getAllPerson',
            data:{},
            dataType:'json',
            success:function(rs){
                var data=rs.data;
                var str='';
                for(var i=0;i<data.length;i++){
                    str+='<li class="myli">\n' ;
                    if(data[i].photo_url==null||data[i].photo_url=='' ){
                        str+='<img src="//t.cn/RCzsdCq"/>\n' ;
                    }else{
                        str+='<img src="'+data[i].photo_url+'"/>';
                    }
                     str+='<span class="account">'+data[i].account+'</span>\n' +
                        '   <span class="title">'+data[i].name+'</span>\n' +
                        '   <span class="mytooler">\n' +
                        '   <a name="sendMsg" value="'+data[i].account+'" whichType="Msg">' +
                         '<span class="fa fa-commenting"></span>消息&nbsp;&nbsp;</a>\n' +
                        '   <a name="sendMsg" value="'+data[i].account+'" whichType="Msg">' +
                         '<span class="fa fa-envelope-open"></span>邮件</a>\n' +
                        '  </span>\n' +
                        '</li>';
                }
                $("#plist").append(str);
            },
            error:function(){
                alert("部门列表初始化失败！");
            }
        })
        layui.use(['layer','form'],function(){
            var layer=layui.layer;
            var form=layui.form;

            $(document).on('click','a[name="sendMsg"]',function(){
                var w=$(this).attr("whichType");
                var v=$(this).attr("value");
                var temp=" <form class=\"layui-form\" action=\"\" >\n" +
                    "        <br/> <br/> <br/><div class=\"layui-form-item\">\n" +
                    "            <label class=\"layui-form-label\">发送方式</label>\n" +
                    "            <div class=\"layui-input-block\" style=\"width: 500px;\">\n" +
                    "                <input type=\"text\" name=\"type\" id=\"type\" value='"+w+"'  readonly \n"  +
                    "                        class=\"layui-input\">\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "        <div class=\"layui-form-item\">\n" +
                    "            <label class=\"layui-form-label\">接收人</label>\n" +
                    "            <div class=\"layui-input-block\" style=\"width: 500px;\">\n" +
                    "                <input type=\"text\" name=\"recevier\" id=\"recevier\" value='"+v+"'  readonly \n"  +
                    "                        class=\"layui-input\">\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "        <div class=\"layui-form-item layui-form-text\">\n" +
                    "            <label class=\"layui-form-label\">内容</label>\n" +
                    "            <div class=\"layui-input-block\" name=\"\" style=\"width:700px;\">\n" +
                    "                <textarea id=\"content\" placeholder='请输入内容' name=\"content\" lay-verify=\"required\"  " +
                    "                   class=\"layui-textarea\"></textarea>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "        <div class=\"layui-form-item\">\n" +
                    "            <div class=\"layui-input-block\">\n" +
                    "                <button  class=\"layui-btn \" lay-submit lay-filter=\"SubForm\">发送</button>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "        <br/>\n" +
                    "        <br/>\n" +
                    "    </form>";


                var index=layer.open({
                    type: 1,//类型
                    offset: '150px',
                    area: ['900px', '500px'],//定义宽和高
                    title: '请输入内容',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: temp//打开的内容
                });
                form.on('submit(SubForm)', function(data) {
                    var param = JSON.stringify(data.field);//定义临时变量获取表单提交过来的数据，非json格式
                    //测试是否获取到表单数据，调试模式下在页面控制台查看
                    $.ajax({
                        url: "msg/send",
                        type: 'post',//method请求方式，get或者post
                        dataType: 'json',//预期服务器返回的数据类型
                        data: {
                            "type":$("#type").val(),
                            "recevier":$("#recevier").val(),
                            "content":$("#content").val()
                        },
                        //表格数据序列化
                        success: function (res) {//res为相应体,function为回调函数
                            layer.close(layer.index);
                            if (res.success == true) {
                                layer.alert('成功', {icon: 1});
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
                })
            });
        });



    </script>
</body>

