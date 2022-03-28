<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    .layui-input{
        padding-left:38px;
        border-color: #eee;
        border-radius: 2px;
    }
    label.layui-icon{
        position:relative ;
        width:38px;
        height:38px;
        top:28px;
        left:10px;
    }
    .abe{
        padding: 20px;
    }
</style>
<div class="addWin" >
    <form id="roleAddForm" method="post" >
        <div class="addBox" style="background:#fff;opacity:0.9">
            <div class="layui-form" lay-filter="roleAddForm">
                <input type="hidden" name="rid"/>
                <div class="layui-form-item abe">
                    <label class=" layui-icon layui-icon-username" for="role-add-rname"></label>
                    <input type="text" name="rname" id="role-add-rname" lay-verify="required" placeholder="角色名称" class="layui-input">
                </div>
                <div class="layui-form-item abe">
                    <label class=" layui-icon layui-icon-survey" for="role-add-description"></label>
                    <input type="text" name="description" id="role-add-description" lay-verify="required" placeholder="角色描述" class="layui-input">
                </div>
                <div class="layui-form-item abe">
                    <input  type="checkbox" name="yl1" id="role-add-yl1" lay-skin="switch" value="1" lay-text="启用|禁用" >
                </div>
                <button id="roleSubmitBtn" style="display: none;" lay-submit lay-filter="*">
                    提交
                </button>
            </div>
        </div>
    </form>
</div>
