<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<style type="text/css">
	body{
		background: url("images/login1.jpg");
	   /*  animation-name:myfirst;
	    animation-duration:20s;
	    animation-delay:2s;
	    animation-iteration-count:infinite;
	    animation-play-state:running;
	    transition:  0.5s ; */
	}

	.container{
			background: rgba(255,255,255,0.2);
			width:400px;
			margin:240px auto;
			}
	.fa{
		display: inline-block;
		top: 27px;
		left: 6px;
		position: relative;
		color: #ccc;
	}
	input[type="text"],input[type="password"]{
		padding-left:26px;
	
		}
	</style>


<head>
	<meta charset="utf-8">
    <link rel="shortcut icon" href="images/logo.png">
	<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/iziToast/iziToast.min.css">
	<script src="js/jquery/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/iziToast/iziToast.min.js"></script> 
	<title>登陆页面</title>
</head>

<body>

<div class="container">
        <div class="form row" >
            <form class="form-horizontal col-md-offset-3" id="form" >
                <h3 class="form-title">LOGIN</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Account" id="account"
                               name="account" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="password"
                                   id="password" name="password" maxlength="8"/>
                    </div>
                    <a style="float:right;" href="findPassword">忘记密码？</a>
                    <br/>
                    <br/>
                    <div class="form-group col-md-offset-7">
                        <button type="button" class="btn btn-success pull-right"
                                onclick="check()" name="submit">登录</button>

                    </div>
                </div>
            </form>
        </div>
    </div>
<script>
	function check(){
	    var uname=$("#account").val();
	    var pwd=$("#password").val();
	    if(uname==""||uname==null){
            iziToast.error({
                title: 'Error',
                message: '账号不能为空',
                position: 'center',
                transitionIn: 'bounceInLeft'
            });
        }else if(pwd==""||pwd==null){
            iziToast.error({
                title: 'Error',
                message: '密码不能为空',
                position: 'center',
                transitionIn: 'bounceInLeft'
            });
        }else{
            $.ajax({
                url:"checkPwd",
                type:"post",
                data:$('#form').serialize(),
                success:function(result){
                    console.log(result);
                    result=JSON.parse(result);
                    if(result.state==200){
                        if(result.message=="admin"){
                            window.location.href="adminHome";
                        }else if(result.message=="user"){
                            window.location.href="home";
                        }

                    }else{
                        alert(result.message);
                    }
                },
                error:function(){
                    alert("异常");
                }
            });
        }


	}
</script>
	

  
  
   
   
</body>
</html>