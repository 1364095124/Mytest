<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/11
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .check-in {
        background-color: rgba(0, 5, 241, 0.46);
        border-radius:5px;
    }
    .mask {
        width:100%;
        height:100%;
        position:absolute;
        z-index:20;
        top:0;
        left:0;
        right:0;
        margin:auto;
    }
</style>
<body>
<div id="signin" style="width: 100%;"></div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>签到记录</legend>
</fieldset>

<div  style="padding: 10px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space5" id="record">
    </div>
</div>


<script>


    var datearr = '',
        like = '',
        signin = false;//是否签到

    //获取已签到的日期
    $.ajax({
        type:'post',
        url:'oaTools/signManager/querySign',
        data:{
            "account":$("#curUser").html()
        },
        success:function(data){
            if(data!=null&&data!=""){
                data=eval(data);
                datearr=data;
                var htm_='';
                for(var i=0;i<datearr.length;i++){
                    htm_+='<div class="layui-col-md12">'
                        +'<div class="layui-card">'
                        +'<div class="layui-card-header">'
                        +'<i class="layui-icon layui-icon-face-smile" style="font-size: 30px; color: #1E9FFF;"></i>     您于【'+datearr[i]+'】签到</div></div></div>';

                }
                if(htm_!==''){
                    $('#record').html(htm_);
                }
            }

        },
        error:function(){
            alert("获取已签到日期异常！");
        }
    });

    //查询今天是否已经签到
    $.ajax({
        type:'post',
        url:'oaTools/signManager/checkSign',
        data:{
            "account":$("#curUser").html()
        },
        success:function(data){
            data=eval(data);
            if(data==1){
                signin=true;
            }
        },
        error:function(){
            alert("获取是否签到异常！");
        }
    })

    layui.use(['layer', 'laydate'], function () {
        var layer = layui.layer,
            laydate = layui.laydate;

        var ins1 = laydate.render({
            elem: '#signin'
            , btns: ['confirm']
            , calendar: true
            , theme: '#0097e6'
            , position: 'static'
            , value: new Date()
            , ready: function (date) {
                $('.layui-laydate ,.layui-laydate-header, .layui-laydate-main,.laydate-main-list-0,.layui-laydate-content table').css('width', '100%');//手机端
                $('.laydate-btns-confirm').text('签到');
                $('.layui-laydate-content').append('<div class="mask"></div>');//给日期加个遮罩 屏蔽日期的选择事件
                $('.layui-this').attr('class','');//签到不需要选中状态
                like = date.year + '-' + date.month;
                if(signin){
                    CheckIn(like + '-' + date.date);
                    $('.layui-laydate-footer').hide();
                    signin = true;
                }

                findtd();
            }
            , change: function (value, date, endDate) {
                $('.layui-this').attr('class','');
                var yearMonth = date.year + '-' + date.month;
                if (like !== yearMonth) {
                    like = yearMonth;
                    findtd();
                }
            }
            , done: function (value, date) {
                if (signin)
                    return;
                //

                //在数据中插入一条签到记录
                $.ajax({
                    type:'post',
                    url:'oaTools/signManager/doSign',
                    data:{
                        "account":$("#curUser").html()
                    },
                    success:function(data){
                        if(data!=null&&data!=''){
                            data=JSON.parse(data);
                            console.log(data);
                            if(data.success){
                                layer.msg('签到成功');
                                CheckIn(value);
                            }else{
                                layer.msg('签到失败');
                            }
                        }
                    },
                    error:function(){
                        alert("执行签到异常！");
                    }
                })
                //$('.laydate-btns-confirm').text('已签');
                $('.layui-laydate-footer').hide();
                signin = true;

            }
        });
        function findtd() {

            for (var i = 0; i < datearr.length; i++) {
                CheckIn(datearr[i]);
            }

        }
        function CheckIn(ymd) {
            ymd=ymd.toString().replace(/-0/g,'-');//由于日期控件上的天数没有补零
            $('td[lay-ymd="' + ymd + '"]').attr("class", "check-in");//.append('<span class="laydate-day-mark"></span>');
        }

    });

</script>
</body>
