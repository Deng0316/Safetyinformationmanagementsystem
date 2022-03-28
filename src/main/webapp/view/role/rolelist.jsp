<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css"/>
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <style>
        .layui-table{margin:0;}
        .layui-form-checkbox[lay-skin=primary] i{top:6px;}
        fieldset{padding:10px;border:0;border-top:1px solid #ddd;margin:10px;}
        fieldset legend{font-size:14px;}
    </style>
</head>
<body style="padding: 20px;" class="layui-fluid">
<fieldset>
    <legend>角色管理 </legend>
</fieldset>

<!-- =====================表格===================== -->
<table id="roleList" class="layui-table" lay-filter="roleList"></table>


<!-- 表格数据行中的按钮 -->
<script type="text/html" id="dataBtns">
    <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs" lay-event="toEdit">
        <i class="layui-icon">&#xe642;</i>    编辑
    </button>
</script>

<!-- ===============表格头部过滤组件+按钮组件===================== -->
<script type="text/html" id="titleBtns">
    <div class="layui-inline">
        <label class="layui-form-label" style="width: 200px; left: -100px;">用户名：</label>
        <div class="layui-input-inline" style="width: 200px; left: -100px;">
            <input type="text" id="rname" class="layui-input">
        </div>
    </div>

    <div class="layui-inline" style="left: -100px;" >
        <button class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm" lay-event="toQuery">
            <i class="layui-icon">&#xe615;</i>    查询
        </button>

        <button class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm" lay-event="toClearQuery">
            <i class="layui-icon">&#xe615;</i>    清空查询
        </button>

        <a class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm" id="addBtn" lay-event="toAdd">
            <i class="layui-icon">&#xe61f;</i>    新建
        </a>

        <button class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm" lay-event="toDeletes">
            <i class="layui-icon">&#xe615;</i>    批量删除
        </button>

        <a  class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm" lay-event="toImport">
            <i class="layui-icon">&#xe681;</i>    导入
        </a>

    </div>

</script>


</body>


<script src="<%=request.getContextPath()%>/layui/layui.js"></script>
<%--<script src="<%=request.getContextPath()%>/json/data2.js"></script>--%>

<script>
    // var data2;
    // var rname = document.getElementById("rname");
    // var phone = document.getElementById("phone");
    layui.use(['table','jquery','form','layer'],function(){
        var table = layui.table;
        var $ = layui.$ ;
        var form = layui.form;
        var layer = layui.layer;
        <%--$.ajax({--%>
        <%--    type:"post",--%>
        <%--    url:"${pageContext.request.contextPath}/role/list",--%>
        <%--    async:false,--%>
        <%--    dataType:"json",--%>
        <%--    data:{--%>
        <%--        rname:rname,--%>
        <%--        phone:phone--%>
        <%--    },--%>
        <%--    contentType: 'application/json;charset=utf-8',--%>
        <%--    success:function(data){--%>
        <%--        console.log(data)--%>
        <%--        data2:data--%>

        <%--    }--%>
        <%--})--%>

        //执行渲染
        table.render({
            elem: '#roleList' //指定原始表格元素选择器（推荐id选择器）
            ,height:'full-120'
            ,cols: [[
                {type:'checkbox',width:'4%'},
                {title:'序号',width:'4%',type: 'numbers'},
                {title:'角色名称',width:'10%',field:'rname'},
                {title:'角色描述',width:'12%',field:'description'},
                {title:'创建时间',width:'12%',field:'create_time',templet: function (d){return layui.util.toDateString(d.create_time,'yyyy-MM-dd');}},
                {title:'创建人',width:'12%',field:'create_uname'},
                {title:'修改时间',width:'12%',field:'update_time',templet: function (d){return layui.util.toDateString(d.create_time,'yyyy-MM-dd');}},
                {title:'修改人',width:'12%',field:'update_uname'},
                {title:'角色状态',width:'11%',field:'yl1',templet: '#yl1',align:'center'},
                {width:'10%',templet:'#dataBtns',title:'操作',align:'center'}
            ]] //设置表头
            ,url:'${pageContext.request.contextPath}/role/list'
            ,page:{
                limit:10
            }
            ,toolbar:'#titleBtns'
            // ,where:{limit:1}
        });
        table.on('toolbar(roleList)',function (obj){
            switch (obj.event){
                case "toQuery" : toQuery();break;
                case "toClearQuery":toClearQuery();break;
                case "toAdd":toAdd();break;
                case "toDeletes":toDelete();break;
                case "toImport":toImport();break;
            }
        })

        function toQuery(){
            layui.use(['jquery','table'],function (){
                var rname = $('#rname').val();
                table.reload('roleList',{
                    where:{rname:rname},
                    done:function (){
                        $('#rname').val(rname);
                    }
                });
            });
        }

        function toClearQuery(){
            $('#rname').val('');
            toQuery();
        }

        function toAdd(){
            $.post('add.jsp',null,function(data){
                layer.open({
                    title:'角色创建',
                    type:'1',
                    content:data,
                    area:[500,400],
                    success:function (){
                        form.render();
                    },
                    btn:['确定','取消'],
                    yes:function (){
                        $('#roleSubmitBtn').click();
                    },
                    btn2:function (){
                        alert('取消');
                    }
                });
            });
        }

        form.on('submit(*)',function(data){
            //data.field装载了表单中的组件数据，可以参考文档
            if(!data.field.yl1){
                //没有这个yl1
                data.field.yl1=2
            }
            //自定义ajax异步请求
            if(data.field.rid){
                url='<%=request.getContextPath()%>/role/update';
            }else {
                url='<%=request.getContextPath()%>/role/save';
            }
            $.post(url,data.field,function(responseVO){
                var code = responseVO.code ;
                var msg = responseVO.msg ;
                if(code == 0){
                    //操作成功，给出提示，带有图标，确定后关闭窗口，刷新表格
                    layer.alert(msg,{icon:6},function(){
                        //点击提示框的确定按钮
                        layer.closeAll();
                        table.reload('roleList');
                    })
                }else{
                    //操作失败，给出提示，带有图标
                    layer.alert(msg,{icon:5});
                }
            },'json');
            //终止表单提交 （默认是同步的）
            return false ;
        });

        table.on('tool(roleList)',function (obj){
            switch (obj.event){
                case "toEdit":toEdit(obj.data.rid);break;
            }
        })

        function toEdit(rid) {
            $.post('<%=request.getContextPath()%>/role/edit',{rid:rid},function (role){
                $.post('add.jsp', null, function (data) {
                    layer.open({
                        title: '信息修改',
                        type: '1',
                        content: data,
                        area: [500, 400],
                        success: function () {
                            form.val('roleAddForm',role);
                            if(role.yl1==2){
                                $('#yl1').prop('checked',false);
                            }
                            form.render();
                        },
                        btn: ['确定', '取消'],
                        yes: function () {
                            $('#roleSubmitBtn').click();
                        },
                        btn2: function () {
                            alert('取消');
                        }
                    });
                });
            },'json')
        }

        function toDelete(){
            var result = table.checkStatus('roleList');
            if(result == 0 ){
                layer.alert('请选择想要删除的记录',{icon:2});
                return;
            }
            layer.confirm('是否确认删除',{icon:3},function (){
                var rows = result.data;
                $.ajax({
                    type:'post',
                    data: JSON.stringify(rows),
                    contentType: "application/json",
                    traditional:true,
                    url:"<%=request.getContextPath()%>/role/delete",
                    success:function (responseVO){
                        var code = responseVO.code ;
                        var msg = responseVO.msg ;
                        if(code == 1){
                            layer.alert(msg,{icon:6},function(){
                                //点击提示框的确定按钮
                                layer.closeAll();
                                table.reload('roleList');
                            })
                        }
                    }
                })
            })
        }

        function toImport(){
            $.post('import.jsp', null, function (data) {
                layer.open({
                    title:'角色导入',
                    type: 1,
                    area:[300,250],
                    content:data,
                    btn: ['确定', '取消'],
                    yes: function () {
                        $('#ListAction').click();
                    },
                    btn2: function () {
                    }
                })
            })
        }
    });
</script>
<script type="text/html" id="yl1"style="">
    {{# if(d.yl1==1){}}
    <span class="layui-badge layui-bg-green" style="margin-top: 5px" >启用</span>
    {{# }else{}}
    <span class="layui-badge" style="margin-top: 5px">禁用</span>
    {{# }}}
</script>

</html>