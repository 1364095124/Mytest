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
    <div class="form animated" style="background: #ffffff;">
        <h2 style="text-align: center">付款单</h2>
        <br/>
        <form class="layui-form" action="" id="test">
            <div class="layui-row"></div>
            <div class="layui-form-item">
                <label class="layui-form-label">收款人</label>
                <div class="layui-input-block">
                    <input type="text" name="account" id="account" required style="width:390px;"
                           lay-verify="required" placeholder="请输入收款人" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width:500px;">
                <label class="layui-form-label">收款方式</label>
                <div class="layui-input-block">
                    <select name="applyStyle" id="applyStyle" lay-verify="required">
                        <option value="cash">现金转账</option>
                        <option value="bank">银行转账</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">收款账号</label>
                <div class="layui-input-block">
                    <input type="text" name="PersonAccount" id="PersonAccount" style="width:390px;"
                            placeholder="现金转账无需填写"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">申请日期</label>
                <div class="layui-input-block">
                    <input type="text" name="applyTime" id="applyTime" style="width:300px;" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">金额</label>
                <div class="layui-input-block">
                    <input type="text" name="amount" id="amount" required lay-verify="required|number" style="width:350px;"
                           placeholder="请输入金额"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">具体事项</label>
                <div class="layui-input-block" style="width:1200px;">
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
        //初始化部门列表
        $.ajax({
            type:'post',
            url:'org/getAllDep',
            data:{},
            dataType:'json',
            success:function(rs){
                var data=rs.data;
                var str='';
                for(var i=0;i<data.length;i++){
                    str+='<option value="'+data[i].name+'">'+data[i].name+'</option>'
                }

                $("select[name='department_Name']").append(str);
            }
        });
        layui.use(['form', 'layedit', 'laydate','layer'], function() {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;

            //日期
            laydate.render({
                elem: '#applyTime'
            });
            layedit.build('note');
            form.render();
        });
    </script>
</body>

