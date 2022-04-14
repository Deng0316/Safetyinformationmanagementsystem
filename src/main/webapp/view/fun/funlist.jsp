<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="<%=request.getContextPath()%>/">
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <script src="layui/layui.js"></script>
    <script src="json/treeData.js"></script>
    <style>
        fieldset{padding:10px;border:0;border-top:1px solid #ddd;margin:10px;}
        fieldset legend{font-size:14px;}
    </style>
</head>
<body style="padding: 20px;">

<fieldset>
    <legend>树形表格</legend>
</fieldset>

<!-- 数据表格 -->
<table id="treeList" lay-filter="treeList"></table>


<!-- 表格数据操作按钮 -->
<script type="text/html" id="btns" >

    {{# if(d.ftype==1){ }}
    <button class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm" lay-event="toAddChild">
        <i class="layui-icon">&#xe61f;</i>    新建子功能
    </button>
    {{# }else{ }}
    <a  class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm layui-btn-disabled">
        <i class="layui-icon">&#xe61f;</i>    新建子功能
    </a>
    {{# }   }}
    <button class="layui-btn layui-btn-primary layui-border-orange  layui-btn-sm" lay-event="toEdit">
        <i class="layui-icon">&#xe642;</i>    编辑
    </button>

    <button class="layui-btn layui-btn-primary layui-border-red  layui-btn-sm" lay-event="toDelete">
        <i class="layui-icon">&#xe640;</i>    删除
    </button>

</script>

<!-- 表格头部按钮 -->
<div id="toolbarBtn" style="display: none">
    <button id="expandBtn"  class="layui-btn layui-btn-primary layui-border-blue  layui-btn-sm">
        <i class="layui-icon">&#xe625;</i>    展开所有
    </button>
    <button id="foldBtn"  class="layui-btn layui-btn-primary layui-border-blue  layui-btn-sm">
        <i class="layui-icon">&#xe623;</i>    合并所有
    </button>
    <button id="addBtn"  class="layui-btn layui-btn-primary layui-border-blue  layui-btn-sm" lay-event="toAddRoot">
        <i class="layui-icon">&#xe61f;</i>    新建根功能
    </button>
</div>
</body>



<script>
    layui.config({
        base: 'treetable-lay/'
    }).use(['treeTable','form'],function(){
        var treeTable = layui.treeTable ;
        var $ = layui.$ ;
        var form = layui.form;

        var tt = treeTable.render({
            elem:'#treeList',
            url:'fun/list',//请求远程数据
            // data:treeData,
            toolbar:'#toolbarBtn',
            tree:{
                iconIndex: 2, //指定展开合并图标出现在哪一列
                idName:'fid',
                pidName:'pid',
                isPidData:true //表示按照id和pid的关系，实现子父级别
            },
            cols:[
                {type:'checkbox',width:'4%'},
                {title:'编号',field:'fid',width:'6%'},
                {title:'功能名称',field:'fname',width:'20%'},
                {title:'功能类别',field:'ftype',width:'8%',templet:'#ftypeBox'},
                {title:'功能链接',field:'furl',width:'15%'},
                {title:'权限标识',field:'auth_flag',width:'15%'},
                {title:'父级编号',field:'pid',width:'8%'},
                {title:'父级名称',field:'pname',width:'10%'},
                {title:'操作',templet:'#btns',width:'30%'}
            ]
        });

        $('#expandBtn').click(function(){
            tt.expandAll();
        });

        $('#foldBtn').click(function(){
            tt.foldAll();
        });
    });
    layui.use(['treeTable'],function (){
        var treeTable = layui.treeTable;
        treeTable.on('tool(treeList)',function (obj){
            switch (obj.event){
                case "toAddChild":openAddView(obj.data.fid,obj.data.fname,obj.data.pauth);break;
                case "toEdit":toEdit(obj.data.fid);break;
                case "toDelete":toDelete(obj.data);break;
            }
        })
        treeTable.on('toolbar(treeList)',function (obj){
            switch (obj.event){
                case "toAddRoot":openAddView(-1,"主菜单","");break;
            }
        })
    })

    function toEdit(fid){
        layui.use(['layer','jquery','form','treeTable'],function (){
            var layer = layui.layer;
            var $ = layui.$ ;
            var form = layui.form ;
            $.post('fun/edit',{fid:fid},function (funs){
                $.post('view/fun/funadd.jsp', null, function (data) {
                    layer.open({
                        area: [400, 450],
                        type: 1,
                        title: '功能编辑',
                        content: data,
                        success:function (){
                            form.val('funAddForm',funs);
                            form.render();
                        },
                        btn: ['保存', '取消'],
                        yes: function () {
                            $('#ListAction').click();
                        },
                        btn2:function (){
                            form.render();
                        }
                    })
                });
            },'json')
            // $.ajax({
            //     async: true,
            //     url:'fun/edit',
            //     type:'post',
            //     data:{
            //         'fid':fid
            //     },
            //     dataType:'json',
            //     success:function(funs){
            //         $.ajax({
            //             async:true,
            //             url:'view/fun/funadd.jsp',
            //             success:function (data){
            //                 layer.open({
            //                     area: [400, 450],
            //                     type: 1,
            //                     title: '功能编辑',
            //                     content: data,
            //                     success:function (){
            //                         form.val('funAddForm',funs);
            //                         form.render();
            //                     },
            //                     btn: ['保存', '取消'],
            //                     yes: function () {
            //                         $('#ListAction').click();
            //                     },
            //                     btn2:function (){
            //                         form.render();
            //                     }
            //                 })
            //
            //             }
            //         })
            //     }
            // })
            form.on('submit(1)',function(data){
                //data.field装载了表单中的组件数据，可以参考文档
                //自定义ajax异步请求
                $.post('fun/update',data,function(responseVO){
                    var code = responseVO.code ;
                    var msg = responseVO.msg ;
                    if(code == 0){
                        layer.alert(msg,{icon:6},function(){
                            //点击提示框的确定按钮
                            layer.closeAll();
                            treeTable.reload('treeList');
                        })
                    }else{
                        layer.alert(msg,{icon:5});
                        treeTable.reload('treeList');
                    }
                },'json');
                //终止表单提交 （默认是同步的）
                return false ;
            });
        })
    }

    function toDelete(data){
        layui.use(['layer','jquery','form', 'treeTable'],function (){
            var layer = layui.layer;
            var $ = layui.$ ;
            var treeTable = layui.treeTable ;
            layer.confirm('是否确认删除',{icon:3},function (){
                if(data.children){
                    layer.alert('不能直接删除含有子事项的父级事项',{icon:2});
                    return
                }
                data = {
                    fid: data.fid
                }
                console.log(data)
                $.ajax({
                    type:'post',
                    async: true,
                    data: data,
                    url:"fun/delete",
                    success:function (responseVO){
                        var code = responseVO.code ;
                        var msg = responseVO.msg ;
                        if(code == 1){
                            layer.alert(msg,{icon:6},function(){
                                //点击提示框的确定按钮
                                layer.closeAll();
                                treeTable.reload('treeList');
                            })
                        }
                    }
                })
            })
        })

    }

    function openAddView(pid,pname,pauth){
        //打开一个弹出层
        layui.use(['layer','jquery','form','treeTable'], function(){
            var layer = layui.layer;
            var $ = layui.$ ;
            var form = layui.form ;
            var treeTable = layui.treeTable;
            $.ajax({
                async:false,
                url:'view/fun/funadd.jsp',
                success:function(data){
                    layer.open({
                        area:[400,450],
                        type:1,
                        title:'新建功能',
                        content:data,
                        btn:['保存','取消'],
                        yes:function (){
                            $('#ListAction').click();
                        },
                        success:function (){
                            form.render();
                            $('#fun-add-pid').val(pid);
                            $('#fun-add-pname').val(pname);
                            if(pauth){
                                $('#fun-add-auth').val(pauth);
                            }
                        }
                    });
                    form.on('submit(1)',function(data){
                        //data.field装载了表单中的组件数据，可以参考文档
                        //自定义ajax异步请求
                        $.post('fun/save',data.field,function(responseVO){
                            var code = responseVO.code ;
                            var msg = responseVO.msg ;
                            if(code == 0){
                                layer.alert(msg,{icon:6},function(){
                                    //点击提示框的确定按钮
                                    layer.closeAll();
                                    treeTable.reload('treeList');
                                })
                            }else{
                                layer.alert(msg,{icon:5});
                                treeTable.reload('treeList');
                            }
                        },'json');
                        //终止表单提交 （默认是同步的）
                        return false ;
                    });
                }
            });





            if(pid){
                $('#pid').val(pid);
                $('#pname').val(pname);
                $('#fauth').val(pauth+".");
            }
        });
    }

</script>

<script type="text/html" id="ftypeBox">
    {{# if(d.ftype==2){ }}
        <span class="layui-badge">按钮</span>
    {{#}else{           }}
        <span class="layui-badge layui-bg-green">菜单</span>
    {{#}                }}
</script>

</html>