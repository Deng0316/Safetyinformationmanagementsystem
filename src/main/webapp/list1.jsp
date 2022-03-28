<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
		<meta charset="utf-8" />
        <link rel="stylesheet" href="/layui/css/layui.css"/>
		<style>
			.layui-table{margin:0;}
            fieldset{padding:10px;border:0;border-top:1px solid #ddd;margin:10px;}
            fieldset legend{font-size:14px;}
		</style>
    </head>
    <body style="padding: 20px;">
		<fieldset>
			<legend>数据列表</legend>
		</fieldset>

        <!-- ===============表格头部过滤组件+按钮组件===================== -->
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">字段1：</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">字段2：</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <button  class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm">
                    <i class="layui-icon">&#xe615;</i>    查询
                </button>

                <button  class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm">
                    <i class="layui-icon">&#xe615;</i>    清空查询
                </button>
				
				<a href="reg.html" class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm">
					<i class="layui-icon">&#xe61f;</i>    新建
				</a>

                <a href="" class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm">
                    <i class="layui-icon">&#xe681;</i>    导入
                </a>

                <a href="" class="layui-btn layui-btn-primary layui-border-blue layui-btn-sm">
                    <i class="layui-icon">&#xe67d;</i>    导出
                </a>
            </div>
        </div>

        <!-- =====================表格===================== -->
        <div style="top:140px;position:absolute;right:20px;left:20px;border:1px solid #ddd;border-bottom:0;padding-right:18px;">
        <table class="layui-table" >
            <colgroup>
                <col width="4%">
                <col width="10%">
                <col width="10%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="16%">
            </colgroup>
            <thead>
            <tr>
                <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                <th>字段1</th>
                <th>字段2</th>
                <th>字段3</th>
                <th>字段4</th>
                <th>字段5</th>
                <th>字段6</th>
                <th>字段7</th>
                <th>操作</th>
            </tr>
            </thead>
        </table>
        </div>
        <div style="top:180px;bottom:65px;position:absolute;right:20px;left:20px;border:1px solid #ddd;overflow-y:scroll;border-top:0;padding-right:0px;">
        <table class="layui-table" >
            <colgroup>
                <col width="4%">
                <col width="10%">
                <col width="10%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="12%">
                <col width="16%">
            </colgroup>
            <tbody>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange    layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red    layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange    layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red    layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange    layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red    layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange    layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red    layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange  layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red  layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <th class="layui-form"><input type="checkbox" lay-skin="primary" /></th>
                    <td>数据1</td>
                    <td>数据2</td>
                    <td>数据3</td>
                    <td>数据4</td>
                    <td>数据5</td>
                    <td>数据6</td>
                    <td>数据7</td>
                    <td>
                        <button  class="layui-btn layui-btn-primary layui-border-orange    layui-btn-xs">
                            <i class="layui-icon">&#xe642;</i>    编辑
                        </button>
                        <button  class="layui-btn layui-btn-primary layui-border-red    layui-btn-xs">
                            <i class="layui-icon">&#xe640;</i>    删除
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
		</div>
        <!-- ===============展示分页栏目===================== -->
		<div style="position:absolute;bottom:10px;">
			<div id="pagebar" ></div>
		</div>
    </body>
	
	
	<script src="layui/layui.js"></script>

	
    <script>
        layui.use('laypage',function(){
            var laypage = layui.laypage;

            laypage.render({
                elem:'pagebar',
                count:150,
				limit:15,
				layout:['prev','page','next','count','limit'],
                jump:function(obj,first){
                    if(first){
                        //首次触发，啥也不做
                        return ;
                    }
					alert('翻页');
                }
            });
        });
    </script>
</html>