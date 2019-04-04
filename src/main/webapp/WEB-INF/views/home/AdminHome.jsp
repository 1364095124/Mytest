<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/3
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OA协同办公软件管理员端</title>
    <link rel="shortcut icon" href="images/logo.png">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="changeCSS3/css/normalize.css" />
    <link rel="stylesheet" href="changeCSS3/css/main.css">
    <link rel="stylesheet" href="changeCSS3/css/demo_styles.css">
    <link rel="stylesheet" href="changeCSS3/css/demo1.css">
    <link rel="stylesheet" type="text/css" href="changeCSS3/css/default.css">
    <script src="layui/layui.js" charset="utf-8"></script>
    <script src="changeCSS3/js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body class="dm-demo1">
<div class="htmleaf-container">
    <header class="htmleaf-header">
        <h1>OA协同办公软件 - 组织架构管理<span>OA show in Admin</span></h1>
        <div class="htmleaf-links">
            <a class="htmleaf-icon icon-htmleaf-home-outline" href="http://www.htmleaf.com/" title="主页" target="_blank"><span> 主页</span></a>
            <a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="logout" title="退出登陆" target="_blank"><span> 退出登陆</span></a>
        </div>
        <div class="htmleaf-demo center">
            <a href="index.html" class="current" style="font-size:14px;">组织管理</a>
            <a href="index2.html" style="font-size:14px;">集成管理</a>
            <a href="index3.html" style="font-size:14px;">日志监控</a>
            <a href="index4.html" style="font-size:14px;">账号管理</a>
        </div>
    </header>
    <!-- Demo Navigation -->
    <nav class="nav clearfix">
        <button class="nav-el" id="el-topleft" data-id="ov-topleft">
            <span class="icon-heart"></span>
            <span style="font-size:15px;">组织管理</span>
        </button>
        <button class="nav-el" id="el-topright" data-id="ov-topright">
            <span class="icon-cloud"></span>
            <span style="font-size:15px;">部门管理</span>
        </button>
        <button class="nav-el" id="el-btmleft" data-id="ov-btmleft">
            <span class="icon-location"></span>
            <span style="font-size:15px;">职位管理</span>
        </button>
        <button class="nav-el" id="el-btmright" data-id="ov-btmright">
            <span class="icon-search"></span>
            <span style="font-size:15px;">人员管理</span>
        </button>
    </nav>
    <!-- Overlay (hidden by default)-->
    <section class="overlay" id="ov-topleft">
        <div class="wrap">
            <h1>Section 1</h1>

            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br><br> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>

        <button class="close"><span class="mfg-cancel"></span></button>
    </section>

    <section class="overlay" id="ov-topright">
        <div class="wrap">
            <h1>Section 2</h1>

            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br><br> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>

        <button class="close"><span class="mfg-cancel"></span></button>
    </section>

    <section class="overlay" id="ov-btmleft">
        <div class="wrap">
            <h1>Section 3</h1>

            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br><br> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>

        <button class="close"><span class="mfg-cancel"></span></button>
    </section>

    <section class="overlay" id="ov-btmright">
        <div class="wrap">
            <h1>Section 4</h1>

            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br><br> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>

        <button class="close"><span class="mfg-cancel"></span></button>
    </section>

    <div class="browser_msg">
        <p>对不起，你的浏览器不支持CSS3特性！</p>
    </div>

</div>

<script src="changeCSS3/js/vendor/jquery-1.10.2.min.js"></script>
<script src="changeCSS3/js/plugins.js"></script>
<script src="changeCSS3/js/demo.js"></script>
</body>
</html>
