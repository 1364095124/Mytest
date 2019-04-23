<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/1
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
    <div class="animated" style="background-color:#ffffff";>
        <p>
            <span class="layui-breadcrumb" >
              <a href="/home">首页</a>
              <a href="#">个人页</a>
              <a><cite>个人中心</cite></a>
            </span>
        </p>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>个人中心</legend>
    </fieldset>

        <br/>
    <br/>
    <div style="background-color:#ffffff;" class="animated">
        <p style="width: 100%;height: 45px;display: block;line-height: 45px;text-align: center;padding-top:25px;">
            <img src="upload/images/2019-03-31-09-36-30_t.png"  id="myPhoto" class="layui-circle"/>
        </p>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <p style="width: 100%;height: 45px;display: block;line-height: 45px;text-align: center;">
            <button class="layui-btn layui-btn-radius layui-btn-normal" id="changeImg">
                <i class="layui-icon layui-icon-upload"></i>切换头像</button>
        </p>



        <p  style="width: 100%;height: 45px;display: block;line-height: 45px;font-size:25px;text-align: center;"><strong>Liu Hai</strong></p>
        <p style="width: 100%;height: 35px;display: block;line-height: 45px;text-align: center;">这个人很懒，什么也没留下</p>
        <hr/>
        <br/>
        <p style="margin-left:400px;"><i class="fa fa-bank"></i>java开发工程师</p>
        <br/>
        <p style="margin-left:400px;"><i class="fa fa-drivers-license"></i>蚂蚁金服－某某某事业群－某某平台部－某某技术部－UED</p>
        <br/>
        <p style="margin-left:400px;"><i class="fa fa-map-marker"></i>&nbsp;浙江省杭州市</p>
        <br/>
        <br/>
    </div>

    <script>

        var url=$("img[name='curUser']").attr('src');
        $("#myPhoto").attr('src',url);
        layui.use('upload', function(){
            var upload = layui.upload;

            //执行实例
            var uploadInst = upload.render({
                elem: '#changeImg' //绑定元素
                ,url: '/file/changeAvatar' //上传接口
                ,auto:true
                ,accept:'images'
                ,drag:false
                ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                    layer.load(); //上传loading
                }
                ,done: function(res){
                    //上传完毕回调
                    layer.closeAll('loading');
                    console.log(res);
                    if(res.success){
                        $("img[name='curUser']").attr('src',res.msg);
                        $("#myPhoto").attr('src',res.msg);
                    }else{
                        layer.alert(data.msg, {icon: 2});

                    }

                }
                ,error: function(){
                    //请求异常回调
                    layer.closeAll('loading');
                }
            });
        });
    </script>
</body>

