<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/12
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/mycss/ant.css">
<link rel="stylesheet" href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/moment/moment-with-locales.js"></script>
<script src="js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<style type="text/css">

    a{
        text-decoration:none !important;
    }
</style>
<body>

    <div class="antd-pro-components-page-header-wrapper-grid-content-main">
        <div class="antd-pro-pages-list-basic-list-standardList animated">
            <div class="ant-card ant-card-wider-padding ant-card-padding-transition">
                <div class="ant-card-body">
                    <div class="layui-row">
                        <div class="layui-col-xs12 layui-col-sm4">
                            <div class="antd-pro-pages-list-basic-list-headerInfo"><span>我的待办</span>
                                <p>8个任务</p><em></em></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm4">
                            <div class="antd-pro-pages-list-basic-list-headerInfo"><span>本周任务平均处理时间</span>
                                <p>32分钟</p><em></em></div>
                        </div>
                        <div class="layui-col-xs12 layui-col-sm4">
                            <div class="antd-pro-pages-list-basic-list-headerInfo"><span>本周完成任务数</span>
                                <p>24个任务</p></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=" ant-card antd-pro-pages-list-basic-list-listCard ant-card-wider-padding ant-card-padding-transition"
                 style="margin-top: 24px;">
                <div class="ant-card-head">
                    <div class="ant-card-head-wrapper">
                        <div class="ant-card-head-title" >标准列表</div>
                        <div class="ant-card-extra" style="height:35px !important;">
                            <div>
                                <div class="ant-radio-group ant-radio-group-outline">
                                    <label class="ant-radio-button-wrapper ant-radio-button-wrapper-checked">
                                        <span class="ant-radio-button ant-radio-button-checked">
                                            <input type="radio" class="ant-radio-button-input" value="all" checked="">
                                            <span class="ant-radio-button-inner"></span>
                                        </span>
                                        <span>全部</span>
                                    </label>
                                    <label class="ant-radio-button-wrapper">
                                        <span class="ant-radio-button">
                                            <input type="radio" class="ant-radio-button-input" value="progress">
                                            <span class="ant-radio-button-inner"></span>
                                        </span>
                                        <span>进行中</span>
                                    </label>

                                </div>
                                <span class="ant-input-search antd-pro-pages-list-basic-list-extraContentSearch ant-input-affix-wrapper"><input
                                        placeholder="请输入" class="ant-input" type="text" value=""><span
                                        class="ant-input-suffix"><i aria-label="图标: search" tabindex="-1"
                                                                    class="anticon anticon-search ant-input-search-icon"><svg
                                        viewBox="64 64 896 896" class="" data-icon="search" width="1em" height="1em"
                                        fill="currentColor" aria-hidden="true"><path
                                        d="M909.6 854.5L649.9 594.8C690.2 542.7 712 479 712 412c0-80.2-31.3-155.4-87.9-212.1-56.6-56.7-132-87.9-212.1-87.9s-155.5 31.3-212.1 87.9C143.2 256.5 112 331.8 112 412c0 80.1 31.3 155.5 87.9 212.1C256.5 680.8 331.8 712 412 712c67 0 130.6-21.8 182.7-62l259.7 259.6a8.2 8.2 0 0 0 11.6 0l43.6-43.5a8.2 8.2 0 0 0 0-11.6zM570.4 570.4C528 612.7 471.8 636 412 636s-116-23.3-158.4-65.6C211.3 528 188 471.8 188 412s23.3-116.1 65.6-158.4C296 211.3 352.2 188 412 188s116.1 23.2 158.4 65.6S636 352.2 636 412s-23.3 116.1-65.6 158.4z"></path></svg></i></span></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-card-body" style="padding: 0px 32px 40px;">
                    <button type="button" onclick="openModak()" class="ant-btn ant-btn-dashed" style="width: 100%; margin-bottom: 8px;"
                            ant-click-animating-without-extra-node="false"><i aria-label="图标: plus"
                                                                              class="anticon anticon-plus">
                        <svg viewBox="64 64 896 896" class="" data-icon="plus" width="1em" height="1em"
                             fill="currentColor" aria-hidden="true">
                            <path d="M848 474H550V152h-76v322H176c-4.4 0-8 3.6-8 8v60c0 4.4 3.6 8 8
                            8h298v322h76V550h298c4.4 0 8-3.6 8-8v-60c0-4.4-3.6-8-8-8z"></path>
                        </svg>
                    </i><span>添加</span></button>
                    <div class="ant-list ant-list-lg ant-list-split ant-list-something-after-last-item">
                        <div class="ant-spin-nested-loading">
                            <div id="disp" class="ant-spin-container">




                            </div>
                        </div>
                        <div class="ant-list-pagination">
                            <div id="demo5"></div>
                        </div>
                    </div>
                    <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe>
                </div>
            </div>
        </div>
    </div>





<script>
    //获取列表信息
    $.ajax({
        type:"post",
        url:"oaTools/memoMannger/queryMemo",
        dataType:'json',
        data:{
            "account":$("#curUser").html(),
            "keyWord":"",
            "isNew":"1"
        },
        success:function(data){
            var str='';
            $.each(data, function(i, obj) {
                str+=' <div class="ant-list-item">\n' +
                    '   <div class="ant-list-item-meta">\n' ;
                        if(i==0){
                          str+= '      <div class="ant-list-item-meta-avatar"><span\n' +
                            '         class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img\n' +
                            '          src="https://gw.alipayobjects.com/zos/rmsportal/WdGqmHpayyMjiEhcKoVE.png"></span>\n' +
                            '       </div>\n' ;
                        }else if(i==1){
                            str+= '      <div class="ant-list-item-meta-avatar"><span\n' +
                                '         class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img\n' +
                                '          src="https://gw.alipayobjects.com/zos/rmsportal/zOsKZmFRdUtvpqCImOVY.png"></span>\n' +
                                '       </div>\n' ;
                        }
                        else if(i==2){
                            str+= '      <div class="ant-list-item-meta-avatar"><span\n' +
                                '         class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img\n' +
                                '          src="https://gw.alipayobjects.com/zos/rmsportal/siCrBXXhmvTQGWPNLBow.png"></span>\n' +
                                '       </div>\n' ;
                        }
                        else if(i==3){
                            str+= '      <div class="ant-list-item-meta-avatar"><span\n' +
                                '         class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img\n' +
                                '          src="https://gw.alipayobjects.com/zos/rmsportal/sfjbOqnsXXJgNCjCzDBL.png"></span>\n' +
                                '       </div>\n' ;
                        }
                        else if(i==4){
                            str+= '      <div class="ant-list-item-meta-avatar"><span\n' +
                                '         class="ant-avatar ant-avatar-lg ant-avatar-square ant-avatar-image"><img\n' +
                                '          src="https://gw.alipayobjects.com/zos/rmsportal/dURIMkkrRFpPgTuzkwnB.png"></span>\n' +
                                '       </div>\n' ;
                        }

                    str+='       <div class="ant-list-item-meta-content"><h4 class="ant-list-item-meta-title"><a\n' +
                    '         href="https://ant.design">'+obj.title+'</a></h4>\n' +
                    '           <div class="ant-list-item-meta-description">'+obj.content+'</div>\n' +
                    '           </div>\n' +
                    '       </div>\n' +
                    '       <div class="ant-list-item-content animated">\n' +
                    '          <div class="antd-pro-pages-list-basic-list-listContent">\n' +
                    '              <div class="antd-pro-pages-list-basic-list-listContentItem">\n' +
                    '                   <span>Owner</span>\n' +
                    '              <p>'+obj.account+'</p></div>\n' +
                    '              <div class="antd-pro-pages-list-basic-list-listContentItem">\n' +
                    '                  <span>开始时间</span>\n' +
                    '                  <p>'+obj.tigger_Time+'</p></div>\n' +
                    '              <div class="antd-pro-pages-list-basic-list-listContentItem">\n' +
                    '                   <div class="ant-progress ant-progress-line ant-progress-status-active ant-progress-show-info ant-progress-default"\n' +
                    '                     style="width: 180px;">\n' +
                    '                   <div>\n' +
                    '                   <div class="ant-progress-outer">\n' +
                    '                       <div class="ant-progress-inner">\n' +
                    '                           <div class="ant-progress-bg"\n' +
                    '                            style="width: 85%; height: 6px; border-radius: 100px;"></div>\n' +
                    '                       </div>\n' +
                    '                   </div>\n' +
                    '                   <span class="ant-progress-text" title="85%">85%</span></div>\n' +
                    '               </div>\n' +
                    '           </div>\n' +
                    '       </div>\n' +
                    '    </div>\n' +
                    '     <ul class="ant-list-item-action">\n' +
                    '         <li><a>编辑</a><em class="ant-list-item-action-split"></em></li>\n' +
                    '         <li><a class="ant-dropdown-trigger">更多 <i aria-label="图标: down"\n' +
                    '                class="anticon anticon-down">\n' +
                    '         <svg viewBox="64 64 896 896" class="" data-icon="down" width="1em"\n' +
                    '              height="1em" fill="currentColor" aria-hidden="true">\n' +
                    '           <path d="M884 256h-75c-5.1 0-9.9 2.5-12.9 6.6L512 654.2 227.9 262.6c-3-4.1-7.8-6.6-12.9-6.6h-75c-6.5 0-10.3 7.4-6.5 12.7l352.6 486.1c12.8 17.6 39 17.6 51.7 0l352.6-486.1c3.9-5.3.1-12.7-6.4-12.7z"></path>\n' +
                    '         </svg>\n' +
                    '        </i></a></li>\n' +
                    '     </ul>\n' +
                    '</div>';
            });
            $("#disp").html(str);
        },
        error:function(){

        }
    })



    function openModak(){

        layui.use(['layer','form','laydate'],function () {
            var layer = layui.layer,
                laydate = layui.laydate;

            var temp=" <form class=\"layui-form\" action=\"\" >\n" +
                "        <br/> <br/> <br/><div class=\"layui-form-item\">\n" +
                "            <label class=\"layui-form-label\">标题</label>\n" +
                "            <div class=\"layui-input-block\" style=\"width: 500px;\">\n" +
                "                <input type=\"text\" name=\"title\" id=\"title\" lay-verify=\"required\" placeholder=\"请输入标题\"\n" +
                "                       autocomplete=\"off\" class=\"layui-input\">\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <div class=\"layui-form-item\">\n" +
                "            <label class=\"layui-form-label\">提醒时间</label>\n" +
                "            <div class=\"layui-input-block\" style=\"width: 500px;\">\n" +
                    ' <div class=\'input-group date\' id=\'datetimepicker1\' >\n' +
                '                <input type=\'text\' id="tigger_Time" name="tigger_Time" class="form-control" />\n' +
                '                <span class="input-group-addon">\n' +
                '                    <span class="glyphicon glyphicon-calendar"></span>\n' +
                '                </span></div>\n' +
                "            </div>\n" +
                "        </div>\n" +
                "        <div class=\"layui-form-item layui-form-text\">\n" +
                "            <label class=\"layui-form-label\">具体事项</label>\n" +
                "            <div class=\"layui-input-block\" name=\"\" style=\"width:800px;\">\n" +
                "                <textarea id=\"content\" name=\"content\" placeholder=\"请输入内容\" class=\"layui-textarea\"></textarea>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <div class=\"layui-form-item\">\n" +
                "            <div class=\"layui-input-block\">\n" +
                "                <button  class=\"layui-btn\" lay-submit lay-filter=\"SubForm\">立即提交</button>\n" +
                "                <button  type=\"reset\" class=\"layui-btn layui-btn-primary\">重置</button>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <br/>\n" +
                "        <br/>\n" +
                "    </form>";
            var index=layer.open({
                type: 1,//类型
                offset: '150px',
                area: ['1000px', '700px'],//定义宽和高
                title: '查看详细信息',//题目
                shadeClose: false,//点击遮罩层关闭
                content: temp//打开的内容
            });
            $('#datetimepicker1').datetimepicker({
                format: 'YYYY-MM-DD HH:mm',
                locale: moment.locale('zh-cn')
            });
            form.render();
            form.on('submit(SubForm)', function(data) {
                var param = JSON.stringify(data.field);//定义临时变量获取表单提交过来的数据，非json格式
                console.log(param);//测试是否获取到表单数据，调试模式下在页面控制台查看
                $.ajax({
                    url: "oaTools/memoMannger/addMemo",
                    type: 'post',//method请求方式，get或者post
                    dataType: 'json',//预期服务器返回的数据类型
                    data: {
                        "account":$("#curUser").html(),
                        "title":$("#title").val(),
                        "content":$("#content").val(),
                        "tigger_Time":$("#tigger_Time").val()
                    },
                    //表格数据序列化
                    success: function (res) {//res为相应体,function为回调函数
                        layer.close(layer.index);
                        if (res.success == true) {
                            layer.alert('添加备忘录信息成功', {icon: 1});
                            //$("#res").click();//调用重置按钮将表单数据清空
                            setTimeout(function(){
                                $("#main").load("oaTools/memoManager");
                            },200);


                        } else {
                            layer.alert(data.msg, {icon: 2});
                        }
                    },
                    error: function () {
                        layer.close(layer.index);
                        layer.alert('操作失败！！！', {icon: 5});
                    }

                });
                return false;
            });
            laydate.render({
                elem: '#tigger_Time'
                , btns: ['confirm']
                , calendar: true
                , theme: '#0097e6'
                , position: 'static'
                , type: 'datetime'
                , value: new Date()
            });

        });

    }
    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
            , layer = layui.layer;
        //开启HASH

        laypage.render({
            elem: 'demo5'
            ,theme:'#1E9FFF'
            , count: 500
            , curr: location.hash.replace('#!fenye=', '') //获取hash值为fenye的当前页
            , hash: 'fenye' //自定义hash值
        });
    });


</script>
</body>
