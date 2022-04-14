<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="distribution-box" style="padding: 10px">
    <script type="text/html" id="ftypeColumn">
        {{# if(d.ftype==1){ }}
        <span class="layui-badge layui-bg-green">菜单</span>
        {{#}else{           }}
        <span class="layui-badge ">按钮</span>
        {{#}                }}
    </script>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">角色编号：</label>
            <div class="layui-input-inline" style="width: 120px;">
                <input type="text" id="distribution_rno" name="distribution_rno" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">角色名称：</label>
            <div class="layui-input-inline" style="width: 120px;">
                <input type="text" id="distribution_rname" name="distribution_rname" class="layui-input">
            </div>
        </div>
    </div>


    <table id="funGrid" lay-filter="funGrid"></table>
</div>
