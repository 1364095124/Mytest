<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/1/5
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单点登陆</title>
</head>
<body>
<p style="font-size:18px;">第三方集成&nbsp;--->&nbsp;<span style="font-size:13px;color:#696969;">单点登陆</span></p>
<hr/>
    <form id="thirdSsoForm">
        <br/>
        <div class="form-group">
            <label >应用编码</label>
            <div class="row">
                <div class="col-lg-12">
                    <div class="input-group">
                        <div class="input-group-btn ">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">

                                </i>请选择服务类型 <span class="caret"></span>
                            </button>
                            <ul id="selectNumber" class="dropdown-menu" >


                            </ul>
                        </div>
                        <input id="thirdAppNumber" name="thirdAppNumber" type="text"  class="form-control needClear"
                               placeholder="请选择应用编码" readonly>
                    </div>
                </div>
            </div>
        </div>
        <br/>

        <div class="form-group">
            <label for="thirdAppName">应用名称</label>
            <input type="text" class="form-control" name="thirdAppName" id="thirdAppName" readonly/>
        </div>
        <br/>

        <div class="form-group">
            <label for="sso_url">单点登陆地址</label>
            <input type="text" class="form-control" name="sso_url" id="sso_url" placeholder="登陆地址"/>
        </div>
        <br/>

        <div class="form-group">
            <label for="isDisabled">是否启用</label>
            <input type="checkbox"  name="isDisabled" id="isDisabled"/>
        </div>
        <br/>
        <hr/>
        <div class="form-group">
            <button type="reset" name="reset" class="btn btn-danger" data-loading-text="清空中...">清空</button>
            <button type="button" name="submit" class="btn btn-primary" >确认</button>
        </div>
    </form>
    <script>




            $('input[type=checkbox]').bootstrapSwitch({
                size: "large" ,
                onColor:"success",
                offColor:"default",
                onText:"启用",
                offText:"不启用",

            });

            $.ajax({
                type:'post',
                url:'thirdApplication/thirdAppSso/getAvaliNumber',
                data:'',
                success:function(data){


                    if(!(data==null||data=="")){

                        data=eval(data);
                        var str='';
                        for(var i=0;i<data.length;i++){
                            str+='<li>';
                            str+='<a class="selectFareType">'+data[i]+'</a>'
                            str+='</li>';
                        }
                        $("#selectNumber").append(str);
                    }else{
                        iziToast.error({
                            title: 'Error',
                            message: '查询应用编码失败，请重试！',
                            position: 'center',
                            transitionIn: 'bounceInLeft'
                        });
                    }
                },
                error:function(){
                    iziToast.error({
                        title: 'Error',
                        message: '查询应用编码异常，请重试！',
                        position: 'center',
                        transitionIn: 'bounceInLeft'
                    });
                }
            });

            $('#thirdSsoForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {/*验证*/
                    sso_url: {/*键名username和input name值对应*/
                        message: 'The url is not valid',
                        validators: {
                            notEmpty: {/*非空提示*/
                                message: '地址不能为空'
                            },
                            uri: {
                                message:'url地址不符合规范'
                            }

                        }
                    }

                }
            });

            $("ul#selectNumber").on("click","li",function(){
                var l=$(this).text();
                $("#thirdAppNumber").val($.trim(l));
                $.ajax({
                    type:'post',
                    url:'thirdApplication/thirdRegister/getThirdApp',
                    data:{
                        'number':l
                    },
                    success:function(data){
                        console.log(data);
                        if(!(data==null||data=='')){
                            data=JSON.parse(data);

                            $("#thirdAppName").val(data[0].name);
                        }else{
                            iziToast.error({
                                title: 'Error',
                                message: '查询应用名称失败，请重试！',
                                position: 'center',
                                transitionIn: 'bounceInLeft'
                            });
                        }
                    },
                    error:function(){
                        iziToast.error({
                            title: 'Error',
                            message: '查询应用名称异常，请重试！',
                            position: 'center',
                            transitionIn: 'bounceInLeft'
                        });
                    }

                })
            });


            $("button[name='submit']").on('click',function(){

                var bootstrapValidator = $("#thirdSsoForm").data('bootstrapValidator');
                bootstrapValidator.validate();
                if (bootstrapValidator.isValid()){

                    $(this).attr('disabled','disabled');
                    $(this).button('loading');
                    $.ajax({
                        type:'post',
                        url:'thirdApplication/thirdAppSso/insertSso',
                        data:{
                            "thirdAppNumber":$("#thirdAppNumber").val(),
                            "thirdAppName":$("#thirdAppName").val(),
                            "sso_url":$("#sso_url").val()
                        },
                        success:function(data){

                            data=eval(data);
                            if(data>0){
                                iziToast.success({
                                    title: 'Success',
                                    message: '注册成功！',
                                    position: 'bottomRight',
                                    transitionIn: 'bounceInLeft',
                                });
                                $("#main").load("thirdApplication/thirdAppSso");


                            }else if(data=-1){
                                iziToast.error({
                                    title: 'Error',
                                    message: '该应用编码已绑定地址，请刷新重试！',
                                    position: 'center',
                                    transitionIn: 'bounceInLeft'
                                });
                            }else{
                                iziToast.error({
                                    title: 'Error',
                                    message: '新增失败，请刷新后重试！',
                                    position: 'center',
                                    transitionIn: 'bounceInLeft'
                                });
                            }
                        },
                        error:function(){
                            iziToast.error({
                                title: 'Error',
                                message: '新增异常！',
                                position: 'center',
                                transitionIn: 'bounceInLeft'
                            });

                        }
                    });
                    $("button[name='submit']").button('reset');
                    $("button[name='submit']").removeAttr('disabled');
                }

                else return;

            });
    </script>
</body>
</html>
