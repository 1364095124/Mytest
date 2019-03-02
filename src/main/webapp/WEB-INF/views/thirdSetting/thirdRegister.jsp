<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/1/4
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>第三方应用介入注册</title>
</head>

<body>
    <div id="fakeLoader">
    </div>
    <form id="thirdAppForm">
        <br/>
        <br/>
        <br/>
        <div class="form-group">
            <lable for="number">应用编号</lable>
            <div class="row">
                <div class="col-lg-4">
                    <input type="text" class="form-control" id="number" name="number"  readonly="readonly"/>
                </div>
            </div>

        </div>
        <br/>
        <div class="form-group">
            <lable for="name">应用名称</lable>
            <div class="row">
                <div class="col-lg-6">
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name"/>
                </div>
            </div>

        </div>
        <br/>
        <div class="form-group">
            <lable for="images_url">应用图标</lable>
            <input type="text" class="form-control" id="images_url" name="images_url" placeholder="Icon"/>
        </div>
        <br/>
        <div class="form-group">
            <label for="description">应用说明</label>
            <textarea class="form-control" id="description" name="description" placeholder="不超过150字。。。" rows="3"></textarea>
        </div>
        <br/>
        <hr/>
        <div class="form-group">
            <button type="reset" name="reset" class="btn btn-danger" data-loading-text="清空中...">清空</button>
            <button type="button" name="submit" class="btn btn-primary" >确认</button>
        </div>
    </form>
    <script src="js/ownjs/thirdSetting/thirdRegister.js"></script>

</body>
</html>
