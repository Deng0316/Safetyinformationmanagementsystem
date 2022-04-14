<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
		<meta charset="utf-8" />
        <title>主页</title>
        <link rel="stylesheet" href="layui/css/layui.css"/>
        <script src="<%=request.getContextPath()%>/echarts/dist/echarts.js"/>
        <script></script>
        <style>
            .layui-tree-txt , .layui-tree-txt a{
                color:#eee;
            }
        </style>
    </head>
    <body>
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo layui-hide-xs layui-bg-black">信息管理系统</div>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item layui-hide layui-show-md-inline-block" style="margin-right:10px;">
                    <a href="javascript:;">
                        <img src="http://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
                        欢迎：${sessionScope.loginUser.uname}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="view/user/updatePwd.jsp" target="content">修改密码</a></dd>
                        <dd><a href="<%=request.getContextPath()%>/user/editSelect?uid=${loginUser.uid}" target="content">修改信息</a></dd>
                        <dd><a href="javascript:toExit()">退出</a></dd>
                    </dl>
                </li>
                
            </ul>
        </div>

        <div class="layui-side layui-bg-black  layui-side-menu">
            <!-- <div id="test1" class="demo-tree demo-tree-box"></div> -->
			<!-- 侧边菜单 -->
     
     
          <div class="layui-side-scroll">
          <ul id="menuBox" class="layui-nav layui-nav-tree"   lay-shrink="all" lay-filter="layadmin-system-side-menu" >
            <li class="layui-nav-item">
              <a href="home.jsp" target="content" class="layui-this">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
            </li>

            <li class="layui-nav-item">
              <a href="javascript:;" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>权限管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd >
                  <a href="<%=request.getContextPath()%>/user/list?page=1&rows=10" target="content">用户管理</a>
                </dd>
                <dd >
                  <a href="<%=request.getContextPath()%>/view/role/rolelist.jsp" target="content">角色管理</a>
                </dd>
                <dd >
                  <a href="<%=request.getContextPath()%>/view/fun/funlist.jsp" target="content">功能管理</a>
                </dd>
              </dl>
            </li>

			<li  class="layui-nav-item">
              <a href="javascript:;" >
                <i class="layui-icon layui-icon-list"></i>
                <cite>数据中心</cite>
              </a>
            </li>

			<li class="layui-nav-item">
              <a href="javascript:;">
                <i class="layui-icon layui-icon-template-1"></i>
                <cite>课程管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd >
                  <a lay-href="home/console.jsp">课程信息管理</a>
                </dd>
                <dd >
                  <a lay-href="home/homepage1.jsp">选课信息管理</a>
                </dd>
              </dl>
            </li>

            <li class="layui-nav-item">
              <a href="javascript:;">
                <i class="layui-icon layui-icon-app"></i>
                <cite>后勤管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd >
                  <a lay-href="home/console.jsp">考勤信息管理</a>
                </dd>
                <dd >
                  <a lay-href="home/homepage1.jsp">请假信息管理</a>
                </dd>
              </dl>
            </li>

			<li class="layui-nav-item">
              <a href="javascript:;">
                <i class="layui-icon layui-icon-template"></i>
                <cite>考试管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd >
                  <a lay-href="home/console.jsp">考试信息管理</a>
                </dd>
                <dd >
                  <a lay-href="home/homepage1.jsp">成绩信息管理</a>
                </dd>
              </dl>
            </li>



          </ul>
		  </div>

      
        </div>

        <div class="layui-body">
            <!-- 内容主体区域 -->
            <iframe width="100%" height="100%" frameborder="0" name="content" src="home.jsp" ></iframe>
		
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
           <p align="center">&copy; 版权所有：</p>
        </div>
    </div>

	<script src="layui/layui.js"></script>
    <script>
        function toExit(){
            var f = confirm('是否确认退出');
            if(f){
                location.href='exit';
            }
        }

        <%--layui.use(['jquery','element'],function (){--%>
        <%--    var $ = layui.$--%>
        <%--    var element = layui.element;--%>
        <%--    $.ajax({--%>
        <%--        url:'<%=request.getContextPath()%>/auth/authMenus',--%>
        <%--        dataType:'json',--%>
        <%--        true:'post',--%>
        <%--        success:function (menus){--%>
        <%--            showRootMenu(menus);--%>
        <%--            element.init();--%>
        <%--        }--%>
        <%--    })--%>
        <%--    function showRootMenu(menus){--%>
        <%--        var $ul = $('#menuBox');--%>
        <%--        for(var i=0;i<menus.length;i++){--%>
        <%--            var rootMenu = menus[i];--%>
        <%--            //每一个根菜单都是一个li,这是li标签的处理--%>
        <%--            var $li = $('<li class="layui-nav-item"></li>');--%>
        <%--            //然后是a标签的处理--%>
        <%--            var hrefStr=''--%>
        <%--            if(rootMenu.furl && rootMenu.furl!=''){--%>
        <%--                hrefStr = 'href="<%=request.getContextPath()%>/'+rootMenu.furl+'"';--%>
        <%--            }--%>
        <%--            var $a = $('<a '+hrefStr+' target="content" ><i class="layui-icon layui-icon-home"></i><cite>'+rootMenu.fname+'</cite></a>')--%>

        <%--            $li.append($a);--%>
        <%--            $ul.append($li);--%>
        <%--            var children = rootMenu.children;--%>
        <%--            if(children && children.length>0){--%>
        <%--                //有子菜单--%>
        <%--                showChildMenu(children,$a)--%>
        <%--            }--%>
        <%--        }--%>
        <%--    }--%>
        <%--    //将子菜单展示在指定的目标下面--%>
        <%--    function showChildMenu(children,$target){--%>
        <%--        var $dl = $('<dl class="layui-nav-child"></dl>')--%>
        <%--        $target.after($dl);--%>
        <%--        for(var i=0;i<children.length;i++) {--%>
        <%--            var menu = children[i]--%>
        <%--            var $dd = $('<dd></dd>');--%>
        <%--            var hrefStr = '';--%>
        <%--            if (menu.furl && menu.furl != '') {--%>
        <%--                hrefStr = 'href="<%=request.getContextPath()%>/' + menu.furl + '"';--%>
        <%--            }--%>
        <%--            var $a = $('<a ' + hrefStr + ' target="content" ><i class="layui-icon layui-icon-home"></i><cite>' + menu.fname + '</cite></a>')--%>
        <%--            $dd.append($a);--%>
        <%--            $dl.append($dd);--%>
        <%--            var Children = menu.children;--%>
        <%--            if (Children && Children.length > 0) {--%>
        <%--                showChildMenu(Children, $a)--%>
        <%--            }--%>
        <%--        }--%>
        <%--    }--%>
        <%--});--%>
    </script>
	<script>
		layui.use('element', function(){
			var element = layui.element;
			element.on('nav(layadmin-system-side-menu)', function(elem){
			  console.log(elem[0].getAttribute('lay-href')); //得到当前点击的DOM对象，可以在js中发请求处理
			});
		});
	</script>

    
    </body>
</html>