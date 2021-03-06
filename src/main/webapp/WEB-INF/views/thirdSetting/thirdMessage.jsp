<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/1/6
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>消息集成</title>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css"/>
    <script src="js/bootstrap/bootstrap.js"></script>

</head>
<style type="text/css">
    a{
        text-decoration: none !important;
    }
</style>
<body>
<p style="font-size:18px;">第三方集成&nbsp;/&nbsp;<span style="font-size:13px;color:#696969;">消息</span>                                                                        集成</span></p>
<hr/>
    <form id="thirdMsg">
        <div class="form-group">
            <label for="">应用名称</label>
            <select class="form-control" name="thirdAppName" id="thirdAppName"></select>
        </div>
        <div class="form-group">
            <label for="">获取消息模式</label>
            <select class="form-control" name="type" id="type">
                <option value="0" selected = "selected">第三方推送消息</option>
                <option value="1">主动拉去消息</option>
            </select>
        </div>
        <div class="form-group" >
            <label class="control-label">是否启用</label>
            <select class="form-control " name="isDisabled" id="isDisabled">
                <option value="0" selected = "selected" >启用</option>
                <option value="1">禁用</option>
            </select>
        </div>

        <div id="ext">
        </div>

        <br/>
        <hr/>
        <div class="form-group">
            <button type="reset" name="reset" class="btn btn-danger" data-loading-text="清空中...">清空</button>
            <button type="button" name="submit" class="btn btn-primary" >保存</button>
        </div>

    </form>
    <script>
        $("button[name='submit']").on('click',function(){
           $.ajax({
              type:'post',
              url:'thirdApplication/thirdAppMessage/registerMsg',
               data:{
                  "thirdAppNumber":$("#thirdAppName option:selected").val(),
                   "type":$("#type option:selected").val(),
                   "isDisabled":$("#isDisabled option:selected").val(),
                   "msg_url":$("#msg_url").val(),
                   "requireTime":$("#requireTime option:selected").val()
               },
               success:function(data){
                  if(data!=null&&data!=""){
                      data=JSON.parse(data);
                      if(data.success=="true"){
                          iziToast.success({
                              title: 'Tips',
                              message: data.message,
                              position: 'bottomRight',
                              transitionIn: 'bounceInLeft'
                          });
                      }else if(data.success=="false"){
                          iziToast.error({
                              title: 'Tips',
                              message: data.message,
                              position: 'bottomRight',
                              transitionIn: 'bounceInLeft'
                          });
                      }

                  }
               },
               error:function(){
                    alert("新增消息集成信息异常，请联系管理员！");
               }
           });

        });

        $.ajax({
            type:"post",
            url:"thirdApplication/thirdAppMsg/selectUnRegisterMsg",
            data:"",
            success:function(data){
                if(data!=null&&data!=''){
                    data=JSON.parse(data);
                    console.log(data);
                    var s='';
                    $.each(data,function (i,obj) {
                        s+='<option value='+obj.number+'>'+obj.name+'</option>';
                    })
                    $("#thirdAppName").append(s);
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
        });

        $("#type").change(function(){
            var s=$("#type").val();
            if(s==1){
                var str=' <div class="form-group extcon"> ' +
                    '<lable class="control-label">获取地址</lable>' +
                    '<input type="text"  class="form-control" name="msg_url" id="msg_url"/>  </div> ' +
                    '<div class="form-group extcon" >' +
                    '<label class="control-label">获取间隔时间</label> ' +
                    '<select class="form-control" name="requireTime" id="requireTime">' +
                    '<option value="1000*30">半分钟</option>' +
                    ' <option value="1000*60">一分钟</option> ' +
                    '<option value="1000*60*3" selected = "selected" >三分钟</option>' +
                    '<option value="1000*60*5">五分钟</option></select> </div>';
                $("#ext").append(str);
                $('#thirdMsg').bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {/*验证*/
                        msg_url: {/*键名username和input name值对应*/
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
            }else{
                if($(".extcon").length>0){
                    $('.extcon').remove();
                }
            }
        });



    </script>
</body>
</html>
