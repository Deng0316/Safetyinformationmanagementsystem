<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
		<meta charset="utf-8"/>
        <link rel="stylesheet" href="layui/css/layui.css"/>
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
		<table id="treeList"></table>


		<!-- 表格数据操作按钮 -->
        <script type="text/html" id="btns">

            {{# if(d.id%2==1){ }}
				<button onclick="toAddChild('{{d.id}}','{{d.name}}')" class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm">
					<i class="layui-icon">&#xe61f;</i>    新建子功能
				</button>
            {{# }else{ }}
            <a class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm layui-btn-disabled">
                <i class="layui-icon">&#xe61f;</i>    新建子功能
            </a>
            {{# }   }}
            <button onclick="" class="layui-btn layui-btn-primary layui-border-orange  layui-btn-sm">
                <i class="layui-icon">&#xe642;</i>    编辑
            </button>

            <button onclick="" class="layui-btn layui-btn-primary layui-border-red  layui-btn-sm">
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
        </div>
    </body>
	
	<script src="layui/layui.js"></script>
	<script src="json/treeData.js"></script>
	
    <script>
        layui.config({
			base: 'treetable-lay/'
		}).use(['treeTable'],function(){
            var treeTable = layui.treeTable ;
			var $ = layui.$ ;
		
            var tt = treeTable.render({
                elem:'#treeList',
                //url:'treeData',//请求远程数据
				data:treeData,
				toolbar:'#toolbarBtn',
                tree:{
                    iconIndex: 1, //指定展开合并图标出现在哪一列
                    idName:'id',
                    pidName:'pid',
                    isPidData:true //表示按照id和pid的关系，实现子父级别
                },
                cols:[
					{type:'checkbox',width:80},
                    {title:'编号',field:'id',width:100,edit:'text'},
                    {title:'名称',field:'name',width:150,edit:'text'},
                    {title:'字段1',field:'col1',width:150,edit:'text'},
                    {title:'字段2',field:'col2',width:150,edit:'text'},
                    {title:'字段3',field:'col3',width:150,edit:'text'},
                    {title:'字段4',field:'col4',width:150,edit:'text'},
                    {title:'父编号',field:'pid',width:100,edit:'text'},
                    {title:'操作',templet:'#btns'}
                ]
            });
			
			$('#expandBtn').click(function(){
				tt.expandAll();
			});
			
			$('#foldBtn').click(function(){
				tt.foldAll();
			});
        });

        function toAddRoot(){
            openAddView();
        }

        function toAddChild(pid,pname,pauth){
            openAddView(pid,pname,pauth);
        }

        function openAddView(pid,pname,pauth){
            //打开一个弹出层
            layui.use(['layer','jquery','form'], function(){
                var layer = layui.layer;
                var $ = layui.$ ;
                var form = layui.form ;

                var view = '' ;
                $.ajax({
                    async:false,
                    url:'funAdd.jsp',
                    success:function(data){
                        view = data ;
                    }
                });

                layer.open({
                    area:'400',
                    type:1,
                    title:'新建功能',
                    content:view
                });

                form.render();

                if(pid){
                    $('#pid').val(pid);
                    $('#pname').val(pname);
                    $('#fauth').val(pauth+".");
                }
            });
        }
    </script>
</html>