<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>注册</title>
  <link rel="stylesheet" href="layui/css/layui.css"/>
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
    .copy-footer{
      position: absolute;
      text-align: center;
      width:100%;
      bottom:0;
      padding-bottom:20px;
    }
  </style>
</head>
<body>


  <div class="loginWin">
    <div class="loginBox" style="background:#fff;opacity:0.9">
      <div class="layui-header">
        <h2>欢迎注册</h2>
        <p> </p>
      </div>
      <div class="layui-form">
        <div class="layui-form-item">
          <label class="layui-icon layui-icon-cellphone" for="user-login-cellphone"></label>
          <input type="text" name="cellphone" id="user-login-cellphone" lay-verify="phone" placeholder="手机" class="layui-input">
        </div>
        <div class="layui-form-item">
          <div class="layui-row">
            <div class="layui-col-xs7">
              <label class="layui-icon layui-icon-vercode" for="user-login-vercode"></label>
              <input type="text" name="vercode" id="user-login-vercode" lay-verify="required" placeholder="验证码" class="layui-input">
            </div>
            <div class="layui-col-xs5">
              <div class="vercode-box" style="margin-left: 10px;">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-fluid" id="user-getsmscode">获取验证码</button>
              </div>
            </div>
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-icon layui-icon-password" for="user-login-password"></label>
          <input type="password" name="password" id="user-login-password" lay-verify="pass" placeholder="密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="user-login-repass"></label>
          <input type="password" name="repass" id="user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layui-icon layui-icon-username" for="user-login-nickname"></label>
          <input type="text" name="nickname" id="user-login-nickname" lay-verify="nickname" placeholder="昵称" class="layui-input">
        </div>
        <div class="layui-form-item">
          <input type="checkbox" name="agreement" lay-skin="primary" title="同意用户协议" checked>
        </div>
        <div class="layui-form-item">
          <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="user-reg-submit">注 册</button>
        </div>
        <div class="layui-trans layui-form-item">
          <label>社交账号注册</label>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-qq" style="font-size:26px;color:#3492ED"></i></a>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat" style="font-size:26px;color:#4DAF29"></i></a>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo" style="font-size:26px;color:#CF1900"></i></a>

          <a href="login.html" class="right-link layui-hide-xs">用已有帐号登入</a>
          <a href="login.html" class="right-link layui-hide-sm layui-show-xs-inline-block">登入</a>
        </div>
      </div>
    </div>
    
    <div class="layui-trans copy-footer">
      
      <p>&copy; 版权所有：</p>

    </div>

  </div>

  <script src="layui/layui.js"></script>


</body>
</html>