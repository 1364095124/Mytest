<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2018/12/31
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrap-step/style.css"/>
    <link rel="stylesheet" href="css/fakeLoader/fakeLoader.css"/>
    <link rel="stylesheet" href="css/iziToast/iziToast.css"/>
    <%--<link rel="stylesheet" href="css/messenger/messenger.css"/>--%>
    <%--<link rel="stylesheet" href="css/messenger/messenger-theme-ice.css"/>--%>
    <script src="js/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/iziToast/iziToast.min.js"></script>
    <script src="js/fakeLoader/fakeLoader.js"></script>
    <script src="js/moment/moment-with-locales.js"></script>
    <script src="js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="js/bootstrap-loading/PerfectLoad.js"></script>
    <script src="js/bootstrap-step/bootstrap-step.js"></script>
    <script src="js/messenger/messenger.js"></script>
</head>
<body>
    <div class="row">
            <button class="btn btn-success" id="tip" data-toggle='modal' data-target='#myModalNext'>模态框</button>
            <button class="btn btn-primary" id="btn_submit">获取过渡</button>

            <button class="btn btn-danger" id="btn_next">消息1</button>


            <button class="btn btn-default" id="btn_last">消息2</button>




    </div>
    <div class="row">
        <div id="st" class="col-lg-12">
            <p>你好</p>
            <br/>
            <br/>
            <br/>
            <br/>
        </div>
    </div>

    <ul class="nav nav-pills nav-justified step step-arrow">
        <li class="active">
            <a>step1</a>
        </li>
        <li class="active">
            <a>step2</a>
        </li>
        <li>
            <a>step3</a>
        </li>
    </ul>
    <div class="alert alert-block alert-success">
        <button type="button" class="close" data-dismiss="alert">
            <span aria-hidden="true">&times;</span>
        </button>

        Welcome to
        <strong class="green">
            Ace
            <small>(v1.4)</small>
        </strong>
        你好
    </div>
    <label class="control-label col-xs-3">日期：</label>
    <div class='input-group date' id='datetimepicker1'>
        <input type='text' class="form-control" />
        <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
    </div>

    <div id="fakeLoader"></div>
    <div class="modal fade" id="myModalNext">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">选项配置</h4><ul class="nav nav-pills nav-justified step step-progress">
                    <li class="active">
                        <a>步骤一<span class="caret"></span></a>
                    </li>
                    <li>
                        <a>步骤二<span class="caret"></span></a>
                    </li>
                    <li>
                        <a>步骤三<span class="caret"></span></a>
                    </li>
                    <li>
                        <a>步骤四<span class="caret"></span></a>
                    </li>
                    <li>
                        <a>步骤五<span class="caret"></span></a>
                    </li>
                    <li>
                        <a>步骤六<span class="caret"></span></a>
                    </li>
                </ul>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="carousel slide" data-ride="carousel" data-interval="false" data-wrap="false">
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <p>步骤一</p>
                                    <div class="col-xs-2">
                                        配置角色
                                    </div>
                                    <div class="col-xs-4">
                                        <input type="text" class="form-control" />
                                    </div>
                                    <div class=" col-xs-4">
                                        <button type="button" class=" btn btn-primary">保存</button>
                                    </div>
                                </div>
                                <div class="item">
                                    <p>步骤二</p>
                                    <div class="col-xs-2">
                                        配置用户
                                    </div>
                                    <div class="col-xs-4">
                                        <input type="text" class="form-control" />
                                    </div>
                                    <div class=" col-xs-4">
                                        <button type="button" class=" btn btn-primary">保存</button>
                                    </div>
                                </div>
                                <div class="item">
                                    <p>步骤三</p>
                                </div>
                                <div class="item">
                                    <p>步骤四</p>
                                </div>
                                <div class="item">
                                    <p>步骤五</p>
                                </div>
                                <div class="item">
                                    <p>步骤六</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default MN-pre">上一步</button>
                    <button type="button" class="btn btn-primary MN-next">下一步</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">


        $('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            locale: 'zh-CN'
        });

        $("#myModalNext .modal-footer button").each(function () {
            $(this).click(function () {
                if ($(this).hasClass("MN-next")) {
                    $("#myModalNext .carousel").carousel('next');
                    $("#myModalNext .step li.active").next().addClass("active");
                } else {
                    $("#myModalNext .carousel").carousel('prev');
                    if ($("#myModalNext .step li").length > 1) {
                        $($($("#myModalNext .step li.active"))[$("#myModalNext .step li.active").length - 1]).removeClass("active")
                    }
                }
            })
        })

        $("#btn_submit").on('click',function(){
            $("#fakeLoader").fakeLoader({
                timeToHide:1000*100,
                bgColor:"rgba(190,190,190,0.6)",
                spinner:"spinner6"
            });
            $.ajax({
                type:"post",
                url:"getTest",
                data:"",
                success:function (data) {
                    data=eval(data);
                    $("#fakeLoader").fakeLoader({
                        timeToHide:1,
                        bgColor:"rgba(190,190,190,0.6)",
                        spinner:"spinner6"
                    });
                },error:function(){
                    alert("异常");
                }

            });



                // $.bootstrapLoading.start({ loadingTips: "正在处理数据，请稍候...",target:"#st" });

                //$.bootstrapLoading.end();



        })


        $("#btn_next").on('click',function(){
            iziToast.show({

                color: '#fff',
                icon: 'icon-contacts',
                title: 'Hello!',
                message: 'Do you like it?',
                position: 'bottomRight',
                transitionIn: 'flipInX',
                transitionOut: 'flipOutX',
                progressBarColor: 'rgb(0, 255, 184)',
                image: 'images/person.png',
                imageWidth: 70,
                layout:2,
                onClose: function(){
                    console.info('onClose');
                },
                iconColor: 'rgb(0, 255, 184)'
            });


        })


    </script>
</body>
</html>
