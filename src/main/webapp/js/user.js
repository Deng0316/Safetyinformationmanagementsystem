function toDistributionRoles(uid){
    var rids = [];
    layui.use(['layer','table','jquery'],function (){
        var layer = layui.layer;
        var table = layui.table;
        var $ = layui.$;

        $.ajax({
            url:'view/user/distributionRoles.jsp',
            tpye:'post',
            success:function (view){
                layer.open({
                    title:'角色分配',
                    type:1,
                    area:[800,520],
                    content:view,
                    btn:['确定分配','取消'],
                    yes:function (){
                        distributionSubmit();
                    },
                    success:function (){
                        roleTableInit();
                    }
                })
            }
        })

        function roleTableInit(){
            var user;
            var roles;
            $.ajax({
                async:false,
                url:'auth/distributionInfoForRole',
                tpye:'post',
                data:{'uid':uid},
                dataType:'json',
                success:function (obj){
                    user = obj.user;
                    roles = obj.roles;

                }
            });
            for(var i=0;i<roles.length;i++){
                var role = roles[i];
                if(role.LAY_CHECKED){
                    rids[rids.rid]=role.rid;
                }else{
                   break;
                }
            }

            $('#distribution_uno').val(user.uid);
            $('#distribution_uname').val(user.uname);
            $('#distribution_truename').val(user.truename);
            table.render({
                elem:'#roleGrid',
                height:300,
                cols: [[
                    {type:'checkbox',width:'4%'},
                    {title:'角色编号',width:'16%',field:'rid'},
                    {title:'角色名称',width:'26%',field:'rname'},
                    {title:'角色描述',width:'26%',field:'description'},
                    {title:'角色状态',width:'26%',field:'yl1',templet: '#yl1',align:'center'},
                ]],
                data:roles,
                page:true
            })

            table.on('checkbox(roleGrid)',function (obj){
                if(obj.type=='one'){
                    var rid = obj.data.rid;
                    if(obj.checked){
                        rids[rid]=rid;
                    }else {
                        delete rids[rid];
                    }
                }else {
                    var rows = table.getData('roleGrid');
                    if(obj.checked){
                        for(var i=0;i<rows.length;i++){
                            var row= rows[i];
                            rids[row.rid]=row.rid;
                        }
                    }else{
                        for(var i=0;i<rows.length;i++){
                            var row = rows[i];
                            delete rids[row.rid];
                        }
                    }
                }
            })
        }

        function distributionSubmit(){
            var obj = table.checkStatus('roleGrid');

            var ridStr = '';

            for(p in rids){
                ridStr += p+',';
            }
            $.ajax({
                async: true,
                url:'auth/distributionRole',

                data:{
                    'uid':uid,
                    'ridStr':ridStr
                },
                dataType:'json',
                success:function (responseVo){
                    var code = responseVo.code;
                    var msg = responseVo.msg;
                    if(code==0){
                        layer.alert(msg,{icon:6},function (){
                            layer.closeAll();
                        });
                    }else {
                        layer.alert(msg,{icon:5});
                    }
                }
            })
        }
    })
}
