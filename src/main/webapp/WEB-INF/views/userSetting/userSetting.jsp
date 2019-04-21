<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/1
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    a{
        text-decoration:none !important;
    }

</style>
<body>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li lay-id="11" class="layui-this">基本设置</li>
        <li lay-id="22">安全设置</li>



    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show" style="background-color:#ffffff;">
            <br/>
            <br/>
            <br/>
            <div style="width: 650px; position: relative; left:25%;">
                <form class="layui-form"  >
                    <h1>基本设置</h1>
                    <hr/>
                    <br/>
                    <div class="layui-form-item">
                        <label class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input type="text" id="personAccount" readonly  required  lay-verify="required"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" readonly id="personName" required  lay-verify="required"
                                   placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="1" title="男">
                            <input type="radio" name="sex" value="0" title="女">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label" >个人介绍</label>
                        <div class="layui-input-block">
                            <textarea id="note" readonly placeholder="请输入内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <hr/>
                    <br/>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" name="update" class="layui-btn layui-btn-radius " >修改</button>
                            <button type="button" name="save" class="layui-btn layui-btn-radius layui-btn-normal">提交</button>
                        </div>
                    </div>
                    <br/>
                    <br/>
                </form>
            </div>

        </div>

        <div class="layui-tab-item" style="background-color:#ffffff;padding-left:15px;padding-right:15px;">
            <br/>
            <br/>
            <h1>安全设置</h1>
            <hr/>
            <br/>
            <p><strong>账户密码</strong></p>
            <br/>
            <p>当前密码强度：<span style="color:#1E9FFF;">弱</span>
                <a href="javascript:;" name="updatePwd" data-toggle="modal" data-target="#myModal"
                   style="float:right;color:#1E9FFF;">修改</a>
            </p>
            <hr/>
            <p><strong>绑定手机</strong></p>
            <br/>
            <p>已绑定手机：<span name="personPhone" style="color:#1E9FFF;">183****7369</span>
                <a href="javascript:;" name="updatePhone" data-toggle="modal" data-target="#myModal"
                   style="float:right;color:#1E9FFF;">修改</a>
            </p>
            <hr/>
            <p><strong>绑定邮箱</strong></p>
            <br/>
            <p>已绑定邮箱：<span name="personEmail" style="color:#1E9FFF;">13****@qq.com</span>
                <a href="javascript:;" name="updateEmail" data-toggle="modal" data-target="#myModal"
                   style="float:right;color:#1E9FFF;">修改</a>
            </p>
            <hr/>
            <br/>
            <br/>
        </div>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label>账号：</label>
                                <input id="curAccount" class="form-control" readonly/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <label>业务：</label>
                                <input id="item" class="form-control" readonly/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <label>更新：</label>
                                <input id="newValue" class="form-control" placeholder="输入要更改的值" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" name="commit" class="btn btn-primary" data-dismiss="modal">提交更改</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </div>
</div>
<link rel="stylesheet" href="css/bootstrap/bootstrap.css"/>
<script src="js/bootstrap/bootstrap.js"></script>
<script>
    var form;

    layui.use('form',function(){
        form = layui.form;
        //刷新界面 所有元素
        form.render();

    });


    $("#curAccount").val($("#curUser").html());
    $("#personAccount").val($("#curUser").html());
    //Hash地址的定位
    var layid = location.hash.replace(/^#test=/, '');
    element.tabChange('test', layid);

    element.on('tab(test)', function(elem){
        location.hash = 'test='+ $(this).attr('lay-id');
    });


    $('#myModal').on('hide.bs.modal',
        function() {
            $("#newValue").val("");
        });

    //获取当前用户的个人信息
    $.ajax({
        type:"post",
        url:"user/userSetting/getInfo",
        data:{
            "account":$("#curUser").html()
        },
        success:function(data){
            if(data!=null&&data!=""){
                data=JSON.parse(data);
                $("#personName").val(data.name);
                $("input[name=sex][value=1]").attr("checked", data.sex == "1" ? true : false);
                $("input[name=sex][value=2]").attr("checked", data.sex == "2" ? true : false);
                $("#note").val(data.note);
                form.render(); //更新全部
                $("span[name='personPhone']").html(data.phone.substring(0,3)+"****"+data.phone.substring(7))
                $("span[name='personEmail']").html(data.email.substring(0,2)+"****"+data.email.substring(8));
            }
        }
    });

    $("button[name='update']").on('click',function(){
       $("#personName").attr("readonly",false);
       $("#note").attr("readonly",false);
    });

    //修改基本资料
    $("button[name='save']").on('click',function(){
        //加载层-默认风格

        layer.load();
        //此处关闭加载层
        setTimeout(function(){
            layer.closeAll('loading');
        }, 500);
        console.log($("input[name='sex'][checked]").val() );
        $.ajax({
           type:"post",
           url:"user/userSetting/updatePerson",
           data:{
               "account":$("#curUser").html(),
               "name":$("#personName").val(),
               "sex":$("input[name='sex'][checked]").val(),
               "note":$("#note").val()
           },
           success:function(data){
                if(data!=null&&data!=""){
                    data=JSON.parse(data);
                    if(data.state=="500"){
                        iziToast.error({
                            title: data.state,
                            message: data.message,
                            position: 'bottomRight',
                            transitionIn: 'bounceInLeft'
                        });
                    }else if(data.state=="200"){
                        iziToast.success({
                            title: data.state,
                            message: data.message,
                            position: 'bottomRight',
                            transitionIn: 'bounceInLeft'
                        });
                    }
                }
           },
           error:function(){
               alert("更新个人基本资料异常！");
           }
        });
    });


    $("a[name='updatePwd']").on('click',function(){
       $("#item").val("修改密码");
    });
    $("a[name='updatePhone']").on('click',function(){
       $("#item").val("修改手机号");
    });
    $("#a[name='updateEmail']").on('click',function(){
       $("#item").val("修改邮箱");
    });
    $("button[name='commit']").on('click',function(){
       var s=$("#item").val();
       if(s=="修改密码"){
           $.ajax({
              type:"post",
              url:"user/userSetting/updatePwd",
               data:{
                  "account":$("#curUser").html(),
                  "password":$("#newValue").val()
               },
               success:function(data){
                  if(data!=null&&data!=""){

                      data=JSON.parse(data);
                      if(data.state=="500"){
                          iziToast.error({
                              title: data.state,
                              message: data.message,
                              position: 'bottomRight',
                              transitionIn: 'bounceInLeft'
                          });
                      }else if(data.state=="200"){
                          iziToast.success({
                              title: data.state,
                              message: data.message,
                              position: 'bottomRight',
                              transitionIn: 'bounceInLeft'
                          });
                      }
                  }
               },
               error:function(){
                  alert("更新密码异常");
               }
           });
       }else if(s=="修改邮箱"){
           $.ajax({
               type:"post",
               url:"user/userSetting/updatePerson",
               data:{
                   "account":$("#curUser").html(),
                   "email":$("#newValue").val()
               },
               success:function(data){
                   if(data!=null&&data!=""){

                       data=JSON.parse(data);
                       if(data.state=="500"){
                           iziToast.error({
                               title: data.state,
                               message: data.message,
                               position: 'bottomRight',
                               transitionIn: 'bounceInLeft'
                           });
                       }else if(data.state=="200"){
                           iziToast.success({
                               title: data.state,
                               message: data.message,
                               position: 'bottomRight',
                               transitionIn: 'bounceInLeft'
                           });
                       }
                   }
               },
               error:function(){
                   alert("更新邮箱号异常！");
               }
           });
       }else if(s=="修改手机号"){
           console.log($("#newValue").val().length);
           $.ajax({
               type:"post",
               url:"user/userSetting/updatePerson",
               data:{
                   "account":$("#curUser").html(),
                   "phone":$("#newValue").val()
               },
               success:function(data){
                   if(data!=null&&data!=""){

                       data=JSON.parse(data);
                       if(data.state=="500"){
                           iziToast.error({
                               title: data.state,
                               message: data.message,
                               position: 'bottomRight',
                               transitionIn: 'bounceInLeft'
                           });
                       }else if(data.state=="200"){
                           iziToast.success({
                               title: data.state,
                               message: data.message,
                               position: 'bottomRight',
                               transitionIn: 'bounceInLeft'
                           });
                       }

                   }
               },
               error:function(){
                   alert("更新手机号异常！");
               }
           });
       }
    });



</script>
</body>
