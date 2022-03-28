<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div class="layui-upload" style="padding: 10px;">
        <button style="margin-bottom: 10px;" type="button" class="layui-btn layui-btn-normal" id="swich" >
            <i class="layui-icon layui-icon-upload-drag"></i>选择文件
        </button>
        <span id="file_path_msg" style="margin-left: 20px;"></span>
    </div>
    <div class="layui-upload" style="padding: 10px;">
        <a href="<%=request.getContextPath()%>/excel/roles.xlsx" style="margin-bottom: 10px;" type="button" class="layui-btn layui-btn-normal" >
            <i class="layui-icon layui-icon-upload-drag"></i>模板下载
        </a>
        <button type="button" style="display: none;" class="layui-btn" id="ListAction">开始上传</button>
    </div>

<script>
    layui.use(['upload','jquery'],function (){
        var upload = layui.upload;
        var $ = layui.$;
        var value = $('#swich').val();
        $('#file_path_msg').html(value);
        upload.render({
            elem:'#swich',
            url:'<%=request.getContextPath()%>/role/imports',
            auto:false,
            accept:'file',
            bindAction:'#ListAction',
            field:'excel'
        });
    });

</script>