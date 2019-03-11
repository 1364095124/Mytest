<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2018/12/29
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OA协同办公系统</title>
    <link rel="shortcut icon" href="images/logo.png">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="css/iziToast/iziToast.css">
    <script src="js/jquery/jquery-3.2.1.min.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>

    <script src="js/iziToast/iziToast.min.js"></script>
</head>
<style type="text/css">
    .list-unstyled{
        float: left;
    }

</style>
<body class="layui-bg-gray">

<ul class="layui-nav" style="background:#ffffff;">

    <li style="position:relative;left:200px;" class="layui-nav-item kit-side-fold" >
        <span title="菜单缩放" style="color:#000000;"><i class="fa fa-navicon fa-lg" aria-hidden="true"></i></span></li>
    <li style="margin-left:1580px;"   class="layui-nav-item">
        <a style="color:rgba(0,0,0,.65);" href="home"><i class="fa fa-institution"></i></a>
    </li>
    <li class="layui-nav-item loadPage" whichPage="msg/unreadMsg">
        <a style="color:rgba(0,0,0,.65);" href="javascript:;" ><i class="fa fa-bell-o"></i><span class="layui-badge-dot"></span></a>
    </li>
    <li  class="layui-nav-item" >
        <a style="color:rgba(0,0,0,.65);" href="javascript:;">
            <img name="curUser" src="//t.cn/RCzsdCq"  id="curPhoto" class="layui-nav-img"/><span id="curUser"></span>
            <i class="fa fa-sort-desc"></i>
        </a>
        <dl class="layui-nav-child">

            <dd><a class="loadPage" whichPage="user/userIntroduce"  href="javascript:;">
                <i class="layui-icon layui-icon-username"></i>&nbsp;我的名片</a>
            </dd>
            <dd><a class="loadPage" whichPage="user/userSetting"  href="javascript:;">
                <i class="layui-icon layui-icon-set"></i>&nbsp;个人设置</a>
            </dd>
            <hr class="layui-bg-gray">
            <dd><a href="logout"><i class="fa fa-sign-out"></i>&nbsp;退出登陆</a>
            </dd>
        </dl>
    </li>

</ul>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">

        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item myleftnav" style="height:60px;background-color:rgba(255,255,255,0.1);"><span style="margin-left:16px;font-size:35px;"><i style="color:#1890ff !important;" class="fa fa-twitter"></i>&nbsp;<strong>OA协同办公系统</strong></span></li>
            <li class="layui-nav-item layui-nav-itemed myleftnav">
                <a class="" href="javascript:;"><i class="fa fa-user-circle-o fa-lg"></i> <span >&nbsp;&nbsp;事项管理</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="task/newTask" href="javascript:;">
                        <i class="fa fa-pencil fa-lg"></i> <span >&nbsp;&nbsp;新建事项</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="" href="javascript:;">
                        <i class="fa fa-clipboard fa-lg"></i> <span >&nbsp;&nbsp;已发事项</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="" href="javascript:;">
                        <i class="fa fa-file-text fa-lg"></i> <span >&nbsp;&nbsp;已办事项</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="" href="javascript:;">
                        <i class="fa fa-trash fa-lg"></i> <span >&nbsp;&nbsp;草稿箱</span>
                    </a></dd>
                </dl>
            </li>
            <li class="layui-nav-item myleftnav">
                <a href="javascript:;"><i class="fa fa-hourglass-1 fa-lg"></i> <span >&nbsp;&nbsp;代办消息</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="" href="javascript:;">
                        <i class="fa fa-book fa-lg"></i> <span >&nbsp;&nbsp;我的代办</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="msg/unreadMsg"  href="javascript:;">
                        <i class="fa fa-comments-o fa-lg"></i> <span >&nbsp;&nbsp;我的消息</span>
                    </a></dd>
                </dl>
            </li>
            <li class="layui-nav-item myleftnav">
                <a href="javascript:;"><i class="fa fa-tv fa-lg"></i> <span >&nbsp;&nbsp;文化建设</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="fileManager/personFile" href="javascript:;">
                        <i class="fa fa-user-o fa-lg"></i> <span >&nbsp;&nbsp;私人空间</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="" href="javascript:;">
                        <i class="fa fa-university fa-lg"></i> <span >&nbsp;&nbsp;集团空间</span>
                    </a></dd>
                </dl>
            </li>
            <li class="layui-nav-item myleftnav">
                <a href="javascript:;"><i class="fa fa-diamond fa-lg"></i> <span >&nbsp;&nbsp;实用工具</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="" href="javascript:;">
                        <i class="fa fa-bell fa-lg"></i> <span >&nbsp;&nbsp;提醒事项</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="" href="javascript:;">
                        <i class="fa fa-check-square fa-lg"></i> <span >&nbsp;&nbsp;打卡签到</span>
                    </a></dd>
                </dl>
            </li>

            <li class="layui-nav-item myleftnav">
                <a  href="javascript:;"><i class="fa fa-line-chart fa-lg"></i> <span >&nbsp;&nbsp;统计分析</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="" href="javascript:;"><i class="fa fa-database fa-lg"></i> <span >&nbsp;&nbsp;工作效率统计</span>
                    </a></dd>
                </dl>
            </li>
            <li class="layui-nav-item myleftnav">
                <a href="javascript:;"><i class="fa fa-user-o fa-lg"></i> <span >&nbsp;&nbsp;个人页</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="user/userIntroduce" href="javascript:;">
                        <i class="fa fa-street-view fa-lg"></i><span >&nbsp;&nbsp;个人中心</span>
                    </a></dd>
                    <dd><a  class="loadPage" whichPage="user/userSetting" href="javascript:;">
                        <i class="fa fa-gear fa-lg"></i> <span >&nbsp;&nbsp;个人设置</span>
                    </a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
<br/>
<br/>
<div class="layui-layout layui-layout-admin">

    <div class="layui-container">
        <div id="main">
            <div class="row" >
                <div  class="layui-col-lg12">

                    <div id="AppSso" style="background-color:rgba(255,255,255,0.5);border-radius:10px;height:80px;">

                    </div>
                </div>
            </div>
            <br/>

        </div>


    </div>
    <div class="layui-footer footer footer-demo">
        <div class="layui-main">
            <p style="margin-left:250px;">© 2019 联系我们:<a href="/">1364095124.com</a> lh develop</p>
        </div>
    </div>
</div>

<script>
    //JavaScript代码区域
    var element;
    var form;
    var layer;
    layui.use('element', function(){
         element = layui.element;
    });
    layui.use('form', function() {
         form = layui.form;
    });
    layui.use('layer',function(){
        layer=layui.layer;
    });
    $(".loadPage").on('click',function(){
        $("#main").html("");
        layer.load(2,{time:1000*5});
        var whichPage=$(this).attr('whichPage');
        setTimeout(function(){
            if(whichPage==null||whichPage==""){
                iziToast.error({
                    title: "Tips",
                    message: "当前功能正在开发中",
                    position: 'bottomRight',
                    transitionIn: 'bounceInLeft'
                });
                layer.closeAll('loading');
                window.location.href="home";
            }else{
                layer.closeAll('loading');
                $("#main").load(whichPage);
            }
        },200)

    });
    /*设置单点登陆工具栏浮动特效 ----start---*/
    $(document).on("mouseover","#myin",function(){
        $(this).css("position","relative");

        $(this).css("top","-10px");
    });
    $(document).on("mouseout","#myin",function(){
        $(this).css("top","0px");
    });
    /*设置单点登陆工具栏浮动特效 ----end---*/

    //跳转到个人名片页面
    $("a[name='userIntroduce']").on('click',function(){
       $("#main").load("user/userIntroduce");
    });

    //跳转到个人设置页面
    $("a[name='userSetting']").on('click',function(){
        $("#main").load("user/userSetting");
        form.render();
    });

    var isShow = true;  //定义一个标志位
    $('.kit-side-fold').click(function(){
        //选择出所有的span，并判断是不是hidden
        $('.layui-nav-item .myleftnav span').each(function(){
            if($(this).is(':hidden')){
                $(this).show();
            }else{
                $(this).hide();
            }
        });
        //判断isshow的状态
        if(isShow){
            $('.layui-side.layui-bg-black').width(50); //设置宽度
            $('.kit-side-fold ').css('left', '50px');//修改图标的位置
            //将footer和body的宽度修改
            $('.layui-body').css('left', 50+'px');
            $('.layui-footer').css('left', 50+'px');
            //将二级导航栏隐藏
            $('dd span').each(function(){
                $(this).hide();
            });
            //修改标志位
            isShow =false;
        }else{
            $('.layui-side.layui-bg-black').width(200);
            $('.kit-side-fold ').css('left', '200px');
            $('.layui-body').css('left', 200+'px');
            $('.layui-footer').css('left', 200+'px');
            $('dd span').each(function(){
                $(this).show();
            });
            isShow =true;
        }
    });


    /*获取当前登陆人信息 */
    $.ajax({
        type:"post",
        url:"getCurrentUser",
        data:"",
        success:function(data){

            $("#curUser").html(data);
        },
        error:function(){
            alert("获取当前登陆人信息异常！");
        }
    });

    /*跳转到未读消息界面*/
    $("a[name='unreadMsg']").on('click',function(){
        $("#main").load("msg/unreadMsg");
    });
    $("a[name='messageList']").on('click',function(){
        $("#main").load("msg/unreadMsg");
    });



    /*查找所有注册的单点登陆应用*/
    $.ajax({
        type:'post',
        url:'thirdApplication/thirdAppSso/selectSso',
        data:'',
        success:function(data){
            if(!(data==null||data=='')){
                var str='<ul >';
                data=JSON.parse(data);
                $.each(data, function(i, obj) {
                    str+='<li class="list-unstyled" style="padding-left:30px;margin-top:10px;">';


                    str+='<a  href="'+obj.sso_url+'" target="_blank">';
                    str+='<img id="myin" alt="链接" class="img-circle" href='+obj.sso_url+' src="images/sso.png" ' +
                        'width="45px" height="45px" /><br/>';
                    str+='&nbsp;&nbsp;'+obj.thirdAppName+'</a>';
                    str+='</li>';
                });
                str+='</ul>';
                $("#AppSso").append(str);

            }
        },
        error:function(){
            iziToast.error({
                title: 'Error',
                message: '查找单点登陆异常，请刷新重试！',
                position: 'center',
                transitionIn: 'bounceInLeft'
            });
        }
    })
</script>
<!--webSocket的配置-->
<script >
    $(function(){
        var layer;
        layui.use('layer',function(){
           layer=layui.layer;
        });

        var wsPath=wsPath();
        function wsPath(){
            var local=window.location;
            var contextPath=local.pathname.split("/")[1];
            return "ws://"+local.host+"/";

        };

        //建立socket连接
        var sock;
        var lockReconnect = false,count=0;
        createWebSocket();


        function createWebSocket(){
            try {
                if ('WebSocket' in window) {
                    sock = new WebSocket(wsPath+"socketServer");
                } else if ('MozWebSocket' in window) {
                    sock = new MozWebSocket(wsPath+"socketServer");
                } else {
                    sock = new SockJS(wsPath+"sockjs/socketServer");
                }
                init();
            } catch (e) {
                console.log('Ceate WebSocket Error ! Tring To RestConnection !'+e);
                restConnect();
            }

        }

        function init(){

            sock.onopen = function (e) {
                heartCheck.start();
                console.debug(" 成功建立连接 ! ");
            };
            sock.onmessage = function (e) {
                heartCheck.reset();
                if(e.data==""){
                    return false;
                }
                console.log("----data"+e.data);
                var socketMSG=JSON.parse(e.data);

                //socketMSG.MSG 我这里后端传的是个json 所以这么写的
                if(socketMSG.MSG!=undefined){

                    var msg=socketMSG.MSG;
                    console.log("msg"+msg);
                    if(msg.type=="消息"){
                        layer.open({
                            type:0,
                            title:msg.sendName,
                            content:msg.content,
                            offset:'rb'
                        });
                    }else if(msg.type=="代办"){
                        layer.open({
                            type:0,
                            title:msg.sendName,
                            content:msg.content,
                            offset:'rb'
                        });
                    }else if(msg.type=="公告"){
                        layer.open({
                            type: 1
                            ,title: '备忘录提醒' //不显示标题栏
                            ,closeBtn: false
                            ,area: '300px;'
                            ,shade: 0.8
                            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                            ,resize: false
                            ,anim:6
                            ,btn: ['火速围观', '残忍拒绝']
                            ,btnAlign: 'c'
                            ,moveType: 1 //拖拽模式，0或者1
                            ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">内容<br>内容</div>'
                            ,success: function(layero){
                                var btn = layero.find('.layui-layer-btn');
                                btn.find('.layui-layer-btn0').attr({
                                    href: 'http://www.layui.com/'
                                    ,target: '_blank'
                                });
                            }
                        });
                    }

                }
            };
            sock.onerror = function (e) {
                console.error(" websocket连接发生异常"+e);
                restConnect();
            };
            sock.onclose = function (e) {
                console.warn(" webscoket连接关闭"+e);
                restConnect();
            }
        }


        function restConnect(){
            if(lockReconnect){
                return;
            }
            if(count<=3){
                createWebSocket();
                lockReconnect=true;
            }else{
                console.error('WebSocket连接超时!');
            }
        }

        var heartCheck = {//心跳连接
            timeout: 300000,//60ms
            timeoutObj:null ,
            serverTimeoutObj:null ,
            reset: function(){
                clearTimeout(this.timeoutObj);
                clearTimeout(this.serverTimeoutObj);
                this.start();
            },
            start: function(){
                var _this = this;
                this.timeoutObj = setTimeout(function(){
                    sock.send("");
                    _this.serverTimeoutObj = setTimeout(function(){
                        sock.close();
                    }, _this.timeout)
                }, this.timeout)
            }
        };


        //窗口关闭前,主动关闭websocket连接
        window.onbeforeunload = function () {
            sock.close();
        };

    });

</script>
</body>
</html>