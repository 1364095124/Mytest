<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/1/3
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css"/>
    <link rel="stylesheet" href="css/iziToast/iziToast.css"/>
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-leftnav/custom.css"/>
    <link rel="stylesheet" href="css/bootstrap-leftnav/jquery.mCustomScrollbar.min.css"/>
    <link rel="stylesheet" href="css/bootstrapValidator/bootstrapValidator.min.css"/>
    <link rel="stylesheet" href="css/iziToast/iziToast.css"/>
    <link rel="stylesheet" href="css/fakeLoader/fakeLoader.css"/>
    <link rel="stylesheet" href="css/bootstrap-step/style.css"/>
    <link rel="stylesheet" href="css/bootstrap-switch-master/bootstrap-switch.min.css"/>

    <script src="js/jquery/jquery-3.2.1.js"></script>
    <script src="js/bootstrap/bootstrap.js"></script>
    <script src="js/bootstrap-leftnav/custom.js"></script>
    <script src="js/bootstrap-leftnav/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="js/fakeLoader/fakeLoader.js"></script>
    <script src="js/iziToast/iziToast.min.js"></script>
    <script src="js/bootstrap-step/bootstrap-step.js"></script>
    <script src="js/bootstrap-switch-master/bootstrap-switch.min.js"></script>

    <style type="text/css">
        #nav-main{
            position:absolute;
            top:20px;
        }
        .shortcut-key{
            background: rgba(249,249,249,0.8);
            border:1px solid #fff;
            border-radius: 15%;
            font-size: 18px;
            font-family: 'Glyphicons Halflings';
            transition: 0.3s;
        }
        .shortcut-key:hover{
            background-color: rgb(245,245,245);
            box-shadow: 6px 6px 6px #888888;
            margin-top:-10px;
            cursor: pointer;
        }
        a{
            cursor:pointer;
        }
        #main{
            font-family: '微软雅黑';
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><p><img alt="点我" id="logo" src="images/logo.png">OA后台管理系统</p></a>
        </div>
    </div>
</nav>
<br/>
<br/>
<br/>
<div class="page-wrapper" id="nav-left">
    <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content" id="nav-main">
            <a  id="toggle-sidebar"><i class="fa fa-bars"></i></a>
            <div class="sidebar-brand">
                <a >pro sidebar</a>
            </div>
            <div class="sidebar-header">
                <div class="user-pic">
                    <img class="img-responsive img-rounded" src="images/defaulthead1.png" alt="">
                </div>
                <div class="user-info">
                    <span class="user-name">Jhon <strong>Smith</strong></span>
                    <span class="user-role">Administrator</span>
                    <div class="user-status">
                        <a ><span class="label label-success">Online</span></a>
                    </div>
                </div>
            </div><!-- sidebar-header  -->
            <div class="sidebar-search">
                <div>
                    <div class="input-group">
                        <input type="text" class="form-control search-menu" placeholder="Search for...">
                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    </div>
                </div>
            </div><!-- sidebar-search  -->
            <div class="sidebar-menu">
                <ul>
                    <li class="header-menu"><span>管理员工具栏</span></li>

                    <li class="sidebar-dropdown">
                        <a   ><i class="fa fa-tv"></i><span>第三方集成管理</span><span class="label label-danger">New</span></a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li><a name="thirdRegister" class="active">应用注册 <span class="label label-success">10</span></a> </li>
                                <li><a name="thirdSso" >单点登陆</a></li>
                                <li><a name="thirdMessage" >消息集成</a></li>
                                <li><a name="thirdPending" >代办集成</a></li>
                                <li><a name="thirdManagerthirdManager">应用管理</a> </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a ><i class="fa fa-photo"></i><span>Menu 2</span><span class="badge">3</span></a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li><a >submenu 1 <span class="badge">2</span></a></li>
                                <li><a >submenu 2</a></li>
                                <li><a >submenu 3</a></li>
                                <li><a href="#">submenu 4</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#"><i class="fa fa-bar-chart-o"></i><span>Menu 3</span></a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li><a href="#">submenu 1</a></li>
                                <li><a href="#">submenu 2</a></li>
                                <li><a href="#">submenu 3</a></li>
                                <li><a href="#">submenu 4</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#"><i class="fa fa-diamond"></i><span>Menu 4</span></a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li><a href="#">submenu 1</a></li>
                                <li><a href="#">submenu 2</a></li>
                                <li><a href="#">submenu 3</a></li>
                                <li><a href="#">submenu 4</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="header-menu"><span>Simple menu</span></li>
                    <li><a href="#"><i class="fa fa-tv"></i><span>Menu 1</span></a></li>
                    <li><a href="#"><i class="fa fa-photo"></i><span>Menu 2</span></a></li>
                    <li><a href="#"><i class="fa fa-bar-chart-o"></i><span>Menu 3</span></a></li>
                    <li><a href="#"><i class="fa fa-diamond"></i><span>Menu 4</span></a></li>
                </ul>
            </div><!-- sidebar-menu  -->
        </div><!-- sidebar-content  -->

        <div class="sidebar-footer">
            <a href="#"><i class="fa fa-bell"></i><span class="label label-warning notification">3</span></a>
            <a href="#"><i class="fa fa-envelope"></i><span class="label label-success notification">7</span></a>
            <a href="#"><i class="fa fa-gear"></i></a>
            <a href="#"><i class="fa fa-power-off"></i></a>
        </div>
    </nav><!-- sidebar-wrapper  -->
    <main class="page-content">
        <div class="container">

            <div id="main">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="images/lunbo3.jpg" alt="协同办公软件">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/lunbo4.jpg" alt="协同办公软件">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>

                        <div class="item">
                            <img src="images/lunbo5.jpg" alt="协同办公软件">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>


                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <br/>
                <div class="row">
                    <div class="col-lg-3 shortcut-key " name="toSso">
                        <br/>
                        <br/>
                        <br/>
                        <p style="text-align: center;"><i class="fa fa-send"></i></p>
                        <p style="text-align: center;">单点登陆</p>

                        <br/>
                        <br/>
                        <br/>

                    </div>
                    <div class="col-lg-3 shortcut-key " name="toMsg">
                        <br/>
                        <br/>
                        <br/>
                        <p style="text-align: center;"><i class="fa fa-commenting-o"></i></p>
                        <p style="text-align: center;">消息集成</p>
                        <br/>
                        <br/>
                        <br/>


                    </div>
                    <div class="col-lg-3 shortcut-key " name="toPending">
                        <br/>
                        <br/>

                        <br/>
                        <p style="text-align: center;"><i class="fa fa-file"></i></p>
                        <p style="text-align: center;">代办集成</p>
                        <br/>

                        <br/>
                        <br/>

                    </div>
                    <div class="col-lg-3 shortcut-key" name="toOrgSyn">
                        <br/>
                        <br/>
                        <br/>
                        <p style="text-align: center;"><i class="fa fa-user-circle-o"></i></p>
                        <p style="text-align: center;">组织架构同步</p>

                        <br/>
                        <br/>
                        <br/>

                    </div>
                </div>
            </div>



        </div>

    </main><!-- page-content" -->


</div><!-- page-wrapper -->


<script>
    $(".page-wrapper").toggleClass("toggled");

    $("a[name='thirdRegister']").on('click',function (){
       $("#main").load("thirdApplication/thirdRegister" );
    });

    $("a[name='thirdSso']").on('click',function(){
        $("#main").load("thirdApplication/thirdAppSso" );
    });

    $("a[name='thirdPending']").on('click',function(){
       $("#main").load("thirdApplication/thirdAppPending");
    });

    $("a[name='thirdManager']").on('click',function(){
        $("#main").load("thirdApplication/thirdManager" );
    });

    $(".shortcut-key[name='toSso']").on('click',function(){
       $("#main").load("thirdApplication/thirdAppSso");
    });
    $("a[name='thirdMessage']").on('click',function(){
       $("#main").load("thirdApplication/thirdAppMessage");
    });
    $(".shortcut-key[name='toMsg']").on('click',function(){
        $("#main").load("thirdApplication/thirdAppMessage");
    });

    $(".shortcut-key[name='toPending']").on('click',function(){
        $("#main").load("thirdApplication/thirdAppPending");
    });
</script>

</body>
</html>
