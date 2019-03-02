
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2018/12/31
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css"/>
    <link rel="stylesheet" href="css/iziToast/iziToast.css"/>
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/fakeLoader/fakeLoader.css"/>
    <link rel="stylesheet" href="css/dataTables/css/dataTables.bootstrap.min.css"/>
    <script src="js/jquery/jquery-3.2.1.js"></script>
    <script src="js/bootstrap/bootstrap.js"></script>
    <script src="js/fakeLoader/fakeLoader.js"></script>
    <script src="js/iziToast/iziToast.min.js"></script>
    <script src="js/websocket/sockjs.min.js"></script>
    <script src="js/dataTables/jquery.dataTables.min.js"></script>
    <script src="js/dataTables/dataTables.bootstrap.min.js"></script>
    <style type="text/css">
        .grid:hover {
            background: rgba(239,239,239,0.7);
            border-radius: 15%;
            margin-top:-10px;
            transition:0.5s;
            cursor: pointer;
        }
        body{
            background-color: rgb(245,245,245);
        }
        .mycontent{
            background: rgba(248,248,248,0.8);
            border:1px solid #fff;
            border-radius: 5%;
            font-size: 18px;
            font-family: 'Glyphicons Halflings';
            transition: 0.3s;
        }
        .mycontent:hover{
            background-color: rgb(250,250,250);
            box-shadow: 6px 6px 6px #888888;


        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><p><img alt="点我" id="logo" src="images/logo.png">飞机订票系统</p></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav nav-pills">
                <li ><a name="home">首页 <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        注册账户管理
                        <span class="caret"></span>
                        <ul class="dropdown-menu">
                            <li>
                                <a data-toggle="tab" name="updateUserInfo"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="font-size:12px;"></span>修改账户信息</a>
                            </li>
                            <li>
                                <a data-toggle="tab"  name="updateUserPwd"><span class="glyphicon glyphicon-user" aria-hidden="true" style="font-size:12px;"></span>修改账户密码</a>
                            </li>

                        </ul>
                    </a>

                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        机票信息查询
                        <span class="caret"></span>
                        <ul class="dropdown-menu">
                            <li>

                                <a data-toggle="tab"  name="needPay"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" style="font-size:12px;"></span>待付款机票</a>
                            </li>
                            <li>
                                <a data-toggle="tab"  name="havePay"><span class="glyphicon glyphicon-search" aria-hidden="true" style="font-size:12px;"></span>已付款机票</a>
                            </li>
                            <li>
                                <a data-toggle="tab" name="chart1"><span class="glyphicon glyphicon-equalizer" aria-hidden="true" style="font-size:12px;"></span>统计分析表</a>
                            </li>

                        </ul>
                    </a>

                </li>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-success">提交</button>
            </form>
            <ul class="nav navbar-nav navbar-right ">
                <li class="dropdown">
                    <a id="head" href="#" class="dropdown-toggle"
                       data-toggle="dropdown"
                       style="height: 45px;">
                        <img alt="" class="img-circle" src="images/defaulthead0.png" width="32px" height="32px" />
                        <span style="color: #FFFFFF;font-size: 15px">
                                <i name="curUser">username</i><span id="msgnum" class="badge">4</span>
                            </span>
                    </a>
                    <div class="dropdown-menu pull-right"
                         style="background: #FFFFFF;width: 320px;overflow: hidden">
                        <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
                            <div style="text-align: center">
                                <img class="img-circle" src="images/defaulthead.png"
                                     style="width: 38px;height: 38px;"/>
                            </div>
                            <div style="color: #323534;text-align: center;line-height: 36px;font-size: 15px">
                                <span id="curUser">username</span>
                            </div>
                        </div>

                        <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-user" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    个人中心</p>
                            </div>
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-gear" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    账号管理</p>
                            </div>
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-key" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    密码修改</p>
                            </div>
                        </div>

                        <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-user-circle" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    修改头像</p>
                            </div>
                            <div class="col-md-4 text-center grid" name="unreadMsg">
                                <i  class="fa fa-comments" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    消息<span class="badge">4</span></p>
                            </div>
                            <div class="col-md-4 text-center grid">
                                <i class="fa fa-heart-o" style="font-size: 25px;line-height: 45px;"></i>
                                <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                    帮助中心</p>
                            </div>
                        </div>


                        <div class="row" style="margin-top: 20px">
                            <div class="text-center"
                                 style="padding: 15px;margin: 0px;background: #f6f5f5;color: #323534;">
                                <i class="fa fa-sign-out"></i> <a href="logout" style="cursor: pointer;" name="loginout">退出登入界面</a>
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container">
    <div id="main" style="background:#f5f5f5;">
        <div class="row">
            <div id="AppSso" class="col-lg-12">

            </div>
        </div>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong> Better check yourself, you're not looking too good.
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-sm-6 col-md-4 " style="background-color:red;">
                    <div>
                        <i class="fa fa-weixin" aria-hidden="true"></i><h3>新消息</h3>
                        <button name="t">测试</button>
                    </div>

                </div>
                <div class="col-sm-6 col-md-4" style="background-color:gold;">
                    <div>
                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i><h3>新消息</h3>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4" style="background-color:green;">
                    <div>
                        <i class="fa fa-weixin" aria-hidden="true"></i><h3>新消息</h3>
                    </div>
                </div>
            </div>


        </div>
    </div>

</div>
<script>
    /*获取当前登陆人信息 */
    $.ajax({
        type:"post",
        url:"getCurrentUser",
        data:"",
        success:function(data){
            $("#curUser").html(data);
            $("i[name='curUser']").html(data);
        },
        error:function(){
            alert("获取当前登陆人信息异常！");
        }
    });

    /*跳转到未读消息界面*/
    $(".grid[name='unreadMsg']").on('click',function(){
        $("#main").load("msg/unreadMsg");
    });


    $(".dropdown").mouseover(function () {
        $(this).addClass("open");
    });

    $(".dropdown").mouseleave(function(){
        $(this).removeClass("open");
    });

    /*/!*退出登陆*!/
    $("a[name='loginout']").on('click',function(){
       $.ajax({
           type:"post",
           data:{
               "account":$("#curUser").text()
           },
           url:"loginout",
           success:function(data){
                data=JSON.parse(data);
                if(data!=""){
                    window.location.href="login";
                }
           },
           error:function(){
               alert("异常！");
           }


       });
    });*/


    $("#logo").click(function(){
        if($(".navbar").hasClass("navbar-fixed-top")){
            $(".navbar").removeClass("navbar-fixed-top");
        }else{
            $(".navbar").addClass("navbar-fixed-top");
        }
    });

    $("button[name='sendMsg']").on('click',function(){
        var str={
            "send_id":"root",
            "receive_id":"liuhai",
            "content":"hello world!"
        }
        $.ajax({
            dataType: 'json',
            contentType: 'application/json',
            type:'post',

            url:'msg/addMsg',
            data: JSON.stringify(str),
            success:function(data){


                console.log(data.state);
            },
            error:function(){
                alert("异常");
            }

        });
    });
    $.ajax({
        type:'post',
        url:'thirdApplication/thirdAppSso/selectSso',
        data:'',
        success:function(data){
            if(!(data==null||data=='')){
                var str='<ul class="list-unstyled list-inline">';
                data=JSON.parse(data);
                $.each(data, function(i, obj) {
                    str+='<li>';


                    str+='<a href="'+obj.sso_url+'" target="_blank">';
                    str+='<img alt="链接" class="img-circle" href='+obj.sso_url+' src="images/sso.png" ' +
                        'width="45px" height="45px" /><br/>';
                    str+=obj.thirdAppName+'</a>';
                    str+='<li>';
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
                    var n=$("#msgnum").text();
                    console.log("----"+n);
                    var msg=socketMSG.MSG;
                    iziToast.error({
                        title: msg.sendName,
                        message: msg.content,
                        position: 'bottomRight',
                        transitionIn: 'bounceInLeft'
                    });
                    $("#msgnum").text(parseInt(n)+1);
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
        $("button[name='t']").on('click',function(){
            var j={};
            j.userId="liuhai";
            j.message="test";
            sock.send(JSON.stringify(j));
        });
    });

</script>
</body>

</html>
