<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/3/12
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<body>
    <div class="layui-row">
        <div class="layui-col-md6">
            <div  style="background-image:url('https://gw.alipayobjects.com/zos/rmsportal/wZcnGqRDyhPOEYFcZDnb.svg');"></div>
        </div>
        <div class="layui-col-md6">
            <p><h1>403</h1></p>
            <p>抱歉，你没有权限访问该页面</p>
            <p><button name="backhome" class="layui-btn layui-btn-normal">返回首页</button></p>
        </div>
    </div>
    <script>
        $("button[name='backhome']").on('click',function(){
           $.ajax({
              type:'post',
              url:'deploy',
               data:{
                  "name":"差旅费报销流程",
                   "bpmn":"process/ExpenseProcess.bpmn",
                   "png":"process/ExpenseProcess.png",
                   "key":"ExpenseProcess"
               },
               error:function(){
                  alert("异常！");
               }

           });
        });
    </script>
</body>

