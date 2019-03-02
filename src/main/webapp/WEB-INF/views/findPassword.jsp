<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/2/27
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>

    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/iziToast/iziToast.min.css">

    <script src="js/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/iziToast/iziToast.min.js"></script>
</head>
<style type="text/css">
    body{
        background-color:#f5f5f5
    }
     #g{
        height:2px;
        width:5px;
        background:#1890ff;
        position:absolute;
        transition: 1s;
        animation: mymove 4s ;
         animation-fill-mode:forwards;
    }
    @keyframes mymove
    {
        from {width:5px;}
        to {width:1870px;}
    }
</style>
<body>
<div style="background: #ffffff;height:130px;">
    <br/>
    <hr/>
    <br/>
    <p style="color:#696969;margin-left:15px;">忘记密码&nbsp;/&nbsp;<span style="font-size:22px;">找回密码</span></p>

</div>
<div id="g"></div>
<span style="float:right;margin-right:20px;"><i class="fa fa-spinner fa-pulse fa-2x"></i></span>
<div class="container">

    <br/>
    <br/>
    <br/>
    <div class="form " style="background: #ffffff;">
        <form class="form-horizontal col-md-offset-3" id="form">
            <br/>
            <div class="input-group">
            <label>账号</label>
            <input class="form-control required" id="account" type="text" placeholder="请输入需要找回密码的账号">
            </div>
            <br/>


            <label>验证码</label>
            <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">

                        <input type="text" id="code" class="form-control" placeholder="验证码三分钟有效">
                        <span class="input-group-btn">
                            <button class="btn btn-default" name="getCode" type="button">获取验证码</button>
                         </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div>

            <br/>
            <hr/>
            <button type="button" class="btn btn-danger" name="back">返回登陆</button>
            <button type="button" class="btn btn-primary" name="checkCode">提交</button>
            <br/>
            <br/>
            <br/>
            <br/>
        </form>
    </div>
</div>
<script>
    function setDisable(){
        $("button[name='getCode']").addClass("active");
        $("button[name='getCode']").addClass("disabled");
    }
    function setAble(){
        $("button[name='getCode']").removeClass("active");
        $("button[name='getCode']").removeClass("disabled");
    }
    $("button[name='back']").on('click',function(){
       window.location.href="login";

    });
    $("button[name='getCode']").on('click',function(){

       $.ajax({
           url:"getCode",
           type:"post",
           data:{
               "account":$("#account").val()
           },
            success:function(data){
               if(data!=null&&data!=""){
                   data=JSON.parse(data);

                   if(data.state=="200"){
                        console.log(data);
                       alert("验证码已发送到邮箱！");
                       setDisable();
                       setTimeout("setAble()",1000*60*3);
                   }else if(data.state=="500"){
                       alert("获取验证码失败，请重试");
                   }
               }
            },
            error:function(){
               alert("获取验证码失败，请重试");
            }
       });

    });
    $("button[name='checkCode']").on('click',function(){
       $.ajax({
          type:"post",
          url:"checkCode",
          data:{
              "account":$("#account").val(),
              "code":$("#code").val(),
          },
          success:function(data){
              if(data!=null&&data!=""){
                  data=JSON.parse(data);
                  console.log(data);
                  if(data.state=="200"){
                      alert("您的密码为："+data.message);
                  }else{
                      alert(data.message);
                  }
              }
          },
          error:function(){
              alert("获取密码异常，请重试");
          }
       });
    });
</script>
</body>
</html>
