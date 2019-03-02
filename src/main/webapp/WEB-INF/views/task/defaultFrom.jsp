<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/2/28
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>费用报销单</title>

</head>
<body>
    <div style="background: #ffffff;height:130px;">
        <br/>
        <hr/>
        <br/>
        <p style="color:#696969;margin-left:15px;">新建事项&nbsp;/&nbsp;<span style="font-size:22px;">填写表单</span></p>

    </div>
    <div class="form " style="background: #ffffff;">
        <form class=" col-md-offset-3" id="form">

            <div class="row">
                <div class="col-lg-6">
                    <label>申请人：</label>
                    <input type="text" class="form-control" placeholder="输入你的姓名"/>
                </div>
                <div class="col-lg-6">
                    <label>申请时间:</label>
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <label>报销金额：</label>
                    <input type="text" class="form-control" placeholder="输入你向报销的金额"/>
                </div>
                <div class="col-lg-6">
                    <label>费用类型</label>
                    <input type="text" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <div classs="col-lg-9">
                    <label>报销单位：</label>
                    <input type="text" class="form-control"/>
                </div>
                <div class="col-lg-3">
                    <label>报销部门:</label>
                    <input type="text" class="form-control"/>
                </div>
            </div>
            <div clas="row">
                <div class="col-lg-5">
                    <label>出发时间:</label>
                    <input type="text" class="form-control"/>
                </div>
                <div class="col-lg-5 col-lg-offset-2">
                    <label>返回时间：</label>
                    <input type="text" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5">
                    <label>出发地点:</label>
                    <input type="text" class="form-control"/>
                </div>
                <div class="col-lg-5 col-lg-offset-2">
                    <label>返回地点：</label>
                    <input type="text" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <label>出差目的：</label>
                <input type="text" class="form-control"/>

            </div>

        </form>
    </div>
</body>
</html>
