

$.ajax({
    type:'post',
    url:'thirdApplication/thirdRegister/getNewNumber',
    data:'',
    async:true,
    success:function(data){
        if(data!=null||data!=""){

            $("#number").val(data);

        }else{
            iziToast.error({
                title: 'Error',
                message: '获取应用编号失败！',
                position: 'center',
                transitionIn: 'bounceInLeft'
            });
        }



    },
    error:function(){
        iziToast.error({
            title: 'Error',
            message: '获取应用编号异常！',
            position: 'center',
            transitionIn: 'bounceInLeft'
        });
    }

});



$('#thirdAppForm').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {/*输入框不同状态，显示图片的样式*/
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {/*验证*/
        name: {/*键名username和input name值对应*/
            message: 'The username is not valid',
            validators: {
                notEmpty: {/*非空提示*/
                    message: '用户名不能为空'
                }

            }
        }

    }
});




$("button[name='submit']").on('click',function(){



    var bootstrapValidator = $("#thirdAppForm").data('bootstrapValidator');
    bootstrapValidator.validate();
    if (bootstrapValidator.isValid()){
        var n=$("#number").val();

        $(this).attr('disabled','disabled');
        $(this).button('loading');
        $.ajax({
            type:'post',
            url:'thirdApplication/thirdRegister/insertThirdApp',
            data:$('#thirdAppForm').serialize(),
            success:function(data){
                console.log(data);
                data=eval(data);
                if(data>0){
                    iziToast.success({
                        title: 'Success',
                        message: '注册成功！',
                        position: 'bottomRight',
                        transitionIn: 'bounceInLeft',
                    });
                    $("button[name='reset']").click();
                    $("#number").val(parseInt(n)+1);
                }else if(data=-1){
                    iziToast.error({
                        title: 'Error',
                        message: '该应用账号或比编码已重复，请刷新重试！',
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
                    message: '注册应用异常！',
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