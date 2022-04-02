<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="distribution-box" style="">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户编号：</label>
            <div class="layui-input-inline" style="width: 120px;">
                <input type="text" id="distribution_uno" name="distribution_uno" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-inline" style="width: 120px;">
                <input type="text" id="distribution_uname" name="distribution_uname" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">真实姓名：</label>
            <div class="layui-input-inline" style="width: 120px;">
                <input type="text" id="distribution_truename" name="distribution_truename" class="layui-input">
            </div>
        </div>
    </div>

    <table id="roleGrid"></table>
</div>