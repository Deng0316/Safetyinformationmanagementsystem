<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <style>
        html{
            background:#f2f2f2;
            height:100%;
            position: relative;
        }
        .addBox{
            width:380px;
            margin:110px auto ;
        }
        .layui-header{
            text-align: center;
            padding:20px;
            padding-bottom:0;
            font-size:20px;
        }
        .layui-form{
            padding:20px;
        }
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
    </style>
</head>
<body>

<div class="addWin" >
    <form action="<%=request.getContextPath()%>/user/save" method="post">
        <div class="addBox" style="background:#fff;opacity:0.9">
            <div class="layui-header">
                <h2>新建用户</h2>
                <p style="padding-top:10px;color:red;font-size: 14px;height: 14px;">
                    <c:if test="${param.f=='uname'}">用户名重复</c:if>
                    <c:if test="${param.f=='zjm'}">助记码重复</c:if>
                    <c:if test="${param.f=='phone'}">电话号码重复</c:if>
                    <c:if test="${param.f=='mail'}">邮箱重复</c:if>
                </p>
            </div>
            <div class="layui-form">
                <div class="layui-form-item">
                    <label class=" layui-icon layui-icon-username" for="user-add-uname"></label>
                    <input type="text" name="uname" id="user-add-uname" lay-verify="required" placeholder="用户名" class="layui-input" value="${requestScope.user==null?'':requestScope.user.uname}">
                </div>
                <div class="layui-form-item">
                    <label class=" layui-icon layui-icon-user" for="user-add-truename"></label>
                    <input type="text" name="truename" id="user-add-truename" lay-verify="required" placeholder="真实姓名" class="layui-input" value="${requestScope.user==null?'':requestScope.user.truename}">
                </div>
                <div class="layui-form-item">
                    <label class=" layui-icon layui-icon-time" for="user-add-age"></label>
                    <input type="number" name="age" id="user-add-age" lay-verify="required" placeholder="年龄" class="layui-input" value="${requestScope.user==null?'':requestScope.user.age}">
                </div>
                <div class="layui-form-item">
                    <label class=" layui-icon layui-icon-male" for="user-add-sex" style="z-index: 9999"></label>
                    <select  type="text" name="sex" id="user-add-sex" lay-verify="required" placeholder="性别" class="layui-select">
                        <option value="">请选择性别</option>
                        <option value="女">女</option>
                        <option value="男">男</option>
                    </select>
                </div>
                <div class="layui-form-item">
                    <label class=" layui-icon layui-icon-cellphone-fine" for="user-add-phone"></label>
                    <input type="phone" name="phone" id="user-add-phone" lay-verify="required" placeholder="电话号码" class="layui-input" value="${requestScope.user==null?'':requestScope.user.phone}">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-email " for="user-add-mail"></label>
                    <input type="mail" name="mail" id="user-add-mail" lay-verify="required" placeholder="邮箱" class="layui-input" value="${requestScope.user==null?'':requestScope.user.mail}">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="user-add-submit">保  存</button>
                </div>
            </div>
        </div>
    </form>
    <%--    <div class="layui-trans copy-footer">--%>
    <%--      <p>&copy; 版权所有：</p>--%>
    <%--    </div>--%>

</div>
<script>

</script>
</body>
</html>