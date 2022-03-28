<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>导入   </title>
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
    <form action="<%=request.getContextPath()%>/user/import" method="post" enctype="multipart/form-data">
        <div class="addBox" style="background:#fff;opacity:0.9">
            <div class="layui-header">
                <h2>导入用户</h2>
            </div>
            <div class="layui-form">
                <div class="layui-form-item">
                    <input id="excel" onchange="toShowPath()" type="file" name="excel" style="width: 100px;height: 31px;position: absolute;opacity: 0" />
                    <button type="button" class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm">
                        <i class="layui-icon layui-icon-upload-drag"></i>    选择文件
                    </button>
                    <span id="file_path_msg" style="margin-left: 20px;"></span>
                </div>
                <div class="layui-form-item">
                    <a href="<%=request.getContextPath()%>/excel/users.xlsx" class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm">
                        <i class="layui-icon layui-icon-download-circle"></i>    模板下载
                    </a>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="user-add-submit">上  传</button>
                </div>
            </div>
        </div>
    </form>
    <%--    <div class="layui-trans copy-footer">--%>
    <%--      <p>&copy; 版权所有：</p>--%>
    <%--    </div>--%>

</div>
<script>
    function toShowPath(){
        layui.use('jquery',function (){
            var $ = layui.$;
            var value = $('#excel').val();
            $('#file_path_msg').html(value);
        })
    }

</script>
</body>
</html>