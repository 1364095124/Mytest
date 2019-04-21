<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/3
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="css/soulTable.css">
    <script src="js/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/jquery/jquery.cookie.min.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
    <script src="js/iziToast/iziToast.min.js"></script>
</head>
<style type="text/css">
    .list-unstyled{
        float: left;
    }
    .shortcut-key{
        background: rgba(249,249,249,0.8);
        border:1px solid #fff;
        margin-top:40px;
        margin-right:10px;
        width:300px;
        height:260px;
        border-radius: 15%;
        font-size: 18px;
        font-family: 'Glyphicons Halflings';
        transition: 0.3s;
    }
    .shortcut-key:hover{
        background-color: rgb(245,245,245);
        box-shadow: 6px 6px 6px #888888;
        margin-top:30px;
        cursor: pointer;
    }
</style>
<body style="background-color:#f0f2f5">

<ul class="layui-nav " style="background:#ffffff;">

    <li style="position:relative;left:200px;" class="layui-nav-item kit-side-fold" >
        <span title="菜单缩放" style="color:#000000;"><i class="fa fa-navicon fa-lg" aria-hidden="true"></i></span></li>

    <li  class="layui-nav-item" style="margin-left:1700px;">
        <a style="color:rgba(0,0,0,.65);" href="javascript:;">
            <img name="curUser" src="//t.cn/RCzsdCq"  id="curPhoto" class="layui-nav-img"/><span id="curUser"></span>
            <i class="fa fa-sort-desc"></i>
        </a>
        <dl class="layui-nav-child" style="z-index:999;">


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
        <ul class="layui-nav  layui-nav-tree"  lay-filter="test" >
            <li class="layui-nav-item myleftnav" style="height:60px;background-color:rgba(255,255,255,0.1);"><span style="margin-left:16px;font-size:35px;"><i style="color:#1890ff !important;" class="fa fa-twitter"></i>&nbsp;<strong>OA协同办公系统</strong></span></li>
            <li class="layui-nav-item layui-nav-itemed myleftnav">
                <a class="" href="javascript:;"><i class="fa fa-user-circle-o fa-lg"></i> <span >&nbsp;&nbsp;组织架构管理</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="org/orgList" href="javascript:;">
                        <i class="fa fa-pencil fa-lg"></i> <span >&nbsp;&nbsp;组织管理</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="org/depList" href="javascript:;">
                        <i class="fa fa-clipboard fa-lg"></i> <span >&nbsp;&nbsp;部门管理</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="org/jobList" href="javascript:;">
                        <i class="fa fa-file-text fa-lg"></i> <span >&nbsp;&nbsp;职位管理</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="org/personJobList" href="javascript:;">
                        <i class="fa fa-trash fa-lg"></i> <span >&nbsp;&nbsp;职员管理</span>
                    </a></dd>

                </dl>
            </li>
            <li class="layui-nav-item myleftnav">
                <a href="javascript:;"><i class="fa fa-hourglass-1 fa-lg"></i> <span >&nbsp;&nbsp;账号管理</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="person/personList" href="javascript:;">
                        <i class="fa fa-book fa-lg"></i> <span >&nbsp;&nbsp;账号管理</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="user/errUserList"  href="javascript:;">
                        <i class="fa fa-comments-o fa-lg"></i> <span >&nbsp;&nbsp;异常账号</span>
                    </a></dd>
                </dl>
            </li>
            <li class="layui-nav-item myleftnav">
                <a href="javascript:;"><i class="fa fa-tv fa-lg"></i> <span >&nbsp;&nbsp;集成管理</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="thirdApplication/thirdRegister" href="javascript:;">
                        <i class="fa fa-user-o fa-lg"></i> <span >&nbsp;&nbsp;应用接入</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="thirdApplication/thirdAppSso" href="javascript:;">
                        <i class="fa fa-university fa-lg"></i> <span >&nbsp;&nbsp;单点登陆</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="thirdApplication/thirdAppMessage" href="javascript:;">
                        <i class="fa fa-university fa-lg"></i> <span >&nbsp;&nbsp;消息集成</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="thirdApplication/thirdAppPending" href="javascript:;">
                        <i class="fa fa-university fa-lg"></i> <span >&nbsp;&nbsp;代办集成</span>
                    </a></dd>
                   <%-- <dd><a class="loadPage" whichPage="thirdApplication/thirdManager" href="javascript:;">
                        <i class="fa fa-university fa-lg"></i> <span >&nbsp;&nbsp;应用管理</span>
                    </a></dd>--%>
                </dl>
            </li>
            <li class="layui-nav-item myleftnav">
                <a href="javascript:;"><i class="fa fa-diamond fa-lg"></i> <span >&nbsp;&nbsp;授权管理</span></a>
                <dl class="layui-nav-child">
                    <dd><a class="loadPage" whichPage="aut/noticeAutList" href="javascript:;">
                        <i class="fa fa-bell fa-lg"></i> <span >&nbsp;&nbsp;公告授权</span>
                    </a></dd>
                    <dd><a class="loadPage" whichPage="aut/mettingAutList" href="javascript:;">
                        <i class="fa fa-check-square fa-lg"></i> <span >&nbsp;&nbsp;会议授权</span>
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

    <div class="layui-fluid">
        <div id="main">
            <div class="row" >
                <div  class="layui-col-lg12">
                    <div class="layui-carousel" style="margin-left:200px;" id="myCarousel">
                        <div  carousel-item>
                            <div>
                                <img src="images/adminPlay01.jpg" alt="协同办公软件">
                            </div>
                            <div>
                                <img src="images/adminPlay02.jpg" alt="协同办公软件">
                            </div>
                            <div>
                                <img src="images/adminPlay03.jpg" alt="协同办公软件">
                            </div>
                            <div>
                                <img src="images/adminPlay04.jpg" alt="协同办公软件">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-left:180px;">

                <div class="layui-col-lg3  shortcut-key">
                    <br/>
                    <br/>
                    <br/>
                    <p style="text-align: center;"><i class="fa fa-send"></i></p>
                    <p style="text-align: center;">单点登陆</p>

                    <br/>
                    <br/>
                    <br/>
                </div>

                <div class="layui-col-lg3  shortcut-key">
                    <br/>
                    <br/>
                    <br/>
                    <p style="text-align: center;"><i class="fa fa-commenting-o"></i></p>
                    <p style="text-align: center;">消息集成</p>

                    <br/>
                    <br/>
                    <br/>
                </div>

                <div class="layui-col-lg3  shortcut-key">
                    <br/>
                    <br/>
                    <br/>
                    <p style="text-align: center;"><i class="fa fa-file"></i></p>
                    <p style="text-align: center;">代办集成</p>

                    <br/>
                    <br/>
                    <br/>
                </div>

                <div class="layui-col-lg3  shortcut-key">
                    <br/>
                    <br/>
                    <br/>
                    <p style="text-align: center;"><i class="fa fa-user-circle-o"></i></p>
                    <p style="text-align: center;">人员管理</p>

                    <br/>
                    <br/>
                    <br/>
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
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#myCarousel'
            ,width: '1200px' //设置容器宽度
            ,height:'450px'
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
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
            $('.layui-body').css('transition', 0.2+'s');
            $('.layui-footer').css('transition',0.2+'s');
            $('.layui-fluid').css('transition', 0.2+'s');
            $('.layui-body').css('left', 50+'px');
            $('.layui-footer').css('left', 50+'px');
            $('.layui-fluid').css('padding-left',100+'px');

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
            $('.layui-fluid').css('padding-left',250+'px');
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
            data=JSON.parse(data);
            $("#curUser").html(data.account);
            if(data.url!=""&&data!=null){
                $("img[name='curUser']").attr('src',data.url);
            }

        },
        error:function(){
            alert("身份信息已过期，请重新登陆");
            window.location.href="/login";
        }
    });

    /*跳转到未读消息界面*/
    $("a[name='unreadMsg']").on('click',function(){
        $("#main").load("msg/unreadMsg");
    });
    $("a[name='messageList']").on('click',function(){
        $("#main").load("msg/unreadMsg");
    });




</script>




</body>
</html>