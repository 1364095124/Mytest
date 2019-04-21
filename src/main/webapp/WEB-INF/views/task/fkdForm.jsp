<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/4/9
  Time: 22:32
  Desription:领款收据单
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
<div style="background: #ffffff;height:130px;">
    <br/>

    <br/>
    <p style="color:#696969;margin-left:15px;">新建事项&nbsp;/&nbsp;<span style="font-size:22px;">填写领款收据单</span></p>
    <hr/>
</div>
<div class="form " style="background: #ffffff;">
    <h2 style="text-align: center">付款单</h2>
    <form class="layui-form" action="" id="test">
        <div class="layui-row">
            <div class="layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">合同名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" id="name" required
                               lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">合同号</label>
                    <div class="layui-input-block">
                        <input type="text" name="number" id="number" required
                               lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">预算价</label>
                    <div class="layui-input-block">
                        <input type="text" name="planPrice" id="planPrice" required
                               lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">决算价</label>
                    <div class="layui-input-block">
                        <input type="text" name="Price" id="Price" required
                               lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">合同金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="amount" id="amount" required
                               lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">已付金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="payAmount" id="payAmount" required
                               lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">本次付款</label>
            <div class="layui-input-block">
                <input type="text" name="needPay" id="needPay" style="width:500px;"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">收款人名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="personName" id="personName" required
                               lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-col-md6">
                <div class="layui-form-item">
                    <label class="layui-form-label">开户银行及账号</label>
                    <div class="layui-input-block">
                        <input type="text" name="bankAccount" id="bankAccount" required
                               lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">具体事项</label>
            <div class="layui-input-block" >
                <textarea placeholder="请输入内容" name="note" id="note" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button  class="layui-btn" lay-submit lay-filter="SubForm">立即提交</button>
                <button  type="button" name="saveForm" class="layui-btn layui-btn-primary">存为草稿</button>
            </div>
        </div>
        <br/>
        <br/>
    </form>
</div>


<script>

    layui.use(['form', 'layedit', 'laydate','layer'], function() {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;


        layedit.build('note');
        form.render();
    });
</script>
</body>

