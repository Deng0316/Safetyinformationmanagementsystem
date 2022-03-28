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
    <form id="funAddForm" method="post" lay-filter="funAddForm">
        <div class="addBox" style="background:#fff;opacity:0.9">
            <div class="layui-form" lay-filter="funAddForm">
                <input type="hidden" name="fid"/>
                <div class="layui-form-item abe">
                    <label class=" layui-icon layui-icon-username" for="fun-add-fname"></label>
                    <input type="text" name="fname" id="fun-add-fname" lay-verify="required" placeholder="角色名称" class="layui-input">
<%--                </div>--%>
<%--                <div class="layui-form-item abe">--%>
                    <label class=" layui-icon layui-icon-app" for="fun-add-ftype" style="z-index: 9999"></label>
                    <select  type="text" name="ftype" id="fun-add-ftype" lay-verify="required" placeholder="功能类别" class="layui-select" >
                        <option value="">功能类别</option>
                        <option value="1">菜单</option>
                        <option value="2">按钮</option>
                    </select>
<%--                </div>--%>
<%--                <div class="layui-form-item abe">--%>
                    <label class=" layui-icon layui-icon-link" for="fun-add-furl"></label>
                    <input type="text" name="furl" id="fun-add-furl" placeholder="功能链接" class="layui-input">
<%--                </div>--%>
<%--                <div class="layui-form-item abe">--%>
                    <label class=" layui-icon layui-icon-auz" for="fun-add-auth"></label>
                    <input type="text" name="auth_flag" id="fun-add-auth" lay-verify="required" placeholder="功能权限" class="layui-input">
<%--                </div>--%>
<%--                <div class="layui-form-item abe">--%>
                    <label class=" layui-icon layui-icon-template-1" for="fun-add-pname"></label>
                    <input type="hidden" name="pid" id="fun-add-pid"/>
                    <input type="text" name="pname" id="fun-add-pname" lay-verify="required" placeholder="父级功能" class="layui-input">
                </div>
                <button id="ListAction" style="display: none" lay-submit lay-filter="1">
                    提交
                </button>
            </div>
        </div>
    </form>
</div>
