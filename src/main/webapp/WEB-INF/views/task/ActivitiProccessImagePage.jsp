<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/11
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<body>
<div>
    <div  class="layui-row">
        <div class="layui-col-md6 layui-col-md-offset3" style="background:#ffffff;">
            <div class="layui-row">
                <div class="layui-col-md6">
                    <img src="task/getActivitiProccessImage?pProcessInstanceId=${processInstanceId}" style="margin-top:40px;margin-left:120px;">
                </div>
                <div class="layui-col-md6">
                    <br/>
                    <br/>
                    <br/>
                    <p>
                    <hr style="border:1px solid #32CD32" width="15%" size="1">绿色表示已完成
                    </p>
                    <p>
                    <hr style="border:1px solid #ff0033" width="15%" size="1">红色表示未完成
                    </p>
                </div>
            </div>


        </div>
    </div>

</div>
</body>

