<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>登入</title>
  <link rel="stylesheet" href="layui/css/layui.css" media="all">
  <script src="layui/layui.js"></script>
  <style>
    html{
      background:#f2f2f2;
      height:100%;
      position: relative;
    }
    .loginBox{
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
    .vercode-box{
      position: relative;
      top:12px;
      border:1px solid #ccc;
    }
    .right-link{
      float:right;
      color:#029789;
      position: relative;
      top:5px;
    }
  </style>
</head>
<body>

  <div class="loginWin" >
	<form action="login" method="post">
    <div class="loginBox" style="background:#fff;opacity:0.9">
      <div class="layui-header">
        <h2>欢迎登录</h2>
        <p style="padding-top:10px;color:red;font-size: 14px;height: 14px;">
          ${param.f==9?'验证码错误':''}
          ${param.f==8?'账号或密码错误':''}
          ${param.f==7?'账号或密码错误':''}
        </p>
      </div>
      <div class="layui-form">
        <div class="layui-form-item">
          <label class="layui-icon-user layui-icon layui-icon-username" for="user-login-username"></label>
          <input type="text" name="username" id="user-login-username" lay-verify="required" placeholder="姓名/用户名/手机号/邮箱" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layui-icon layui-icon-password" for="user-login-password"></label>
          <input type="password" name="password" id="user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <div class="layui-row">
            <div class="layui-col-xs7">
              <label class="layui-icon-vercode layui-icon" for="user-login-vercode"></label>
              <input type="text" name="vercode" id="user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
            </div>
            <div class="layui-col-xs5">
              <div class="vercode-box" style="margin-left: 10px;">
                <img src="verifyCode" class="" id="user-get-vercode" onclick="changeCode()">
              </div>
            </div>
          </div>
        </div>

        <div class="layui-form-item" style="margin-bottom: 20px;">
          <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
          <a href="forget.html" class="right-link" style="margin-top: 7px;">忘记密码？</a>
        </div>

        <div class="layui-form-item">
          <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="user-login-submit">登 入</button>
        </div>

        <div class="layui-trans layui-form-item" style="padding-top:20px;">
<%--          <label>社交账号登入</label>--%>
<%--          <a href="javascript:;"><i class="layui-icon layui-icon-login-qq" style="font-size:26px;color:#3492ED"></i></a>--%>
<%--          <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat" style="font-size:26px;color:#4DAF29"></i></a>--%>
<%--          <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo" style="font-size:26px;color:#CF1900"></i></a>--%>
          
          <a href="<%=request.getContextPath()%>/view/user/add.jsp" class="right-link">注册帐号</a>
        </div>
      </div>
    </div>
    </form>
<%--    <div class="layui-trans copy-footer">--%>
<%--      <p>&copy; 版权所有：</p>--%>
<%--    </div>--%>
    
  </div>

  
  <script>
    var v=0;
    var f=true;
    function changeCode(){
      layui.use('jquery',function (){
        var $ = layui.$;
        if(f==true){
          $('#user-get-vercode').attr('src','verifyCode?v='+v++);
          f=false;
          setTimeout(function (){
            f=true;
          },1000)
        }
      });
    }
    var user = document.getElementById('user-login-username');
    user = user.value;

    <%--function Encoding(){--%>
    <%--  $.ajax({--%>
    <%--    type: "post",--%>
    <%--    url: "${pageContext.request.contextPath}/list",--%>
    <%--    data: {aab001:'1'},--%>
    <%--    dataType: "json",--%>
    <%--    async:false,--%>
    <%--    success: function (data) {--%>
    <%--      console.log(data)--%>
    <%--    }--%>
    <%--  });--%>
    <%--}--%>

  </script>

  
</body>
</html>