<@override name="title">导航管理</@override>
<@override name="head">
<style>

</style>
</@override>
<@override name="body">
<div class="layui-fluid">
    <div class="layui-col-sm4">
        <ul id="nav-tree"></ul>
    </div>
    <div class="layui-col-sm8">
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li class="layui-this">编辑</li>
                <li>添加</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <form class="layui-form" action="/admin/nav/edit" method="post" lay-filter="edit">
                        <input type="hidden" name="id">
                        <div class="layui-form-item">
                            <label class="layui-form-label">导航名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="navName" placeholder="请输入导航名称" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="url" placeholder="请输入地址" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">图标</label>
                            <div class="layui-input-block">
                                <input type="text" name="icon" placeholder="图标" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">排序</label>
                            <div class="layui-input-block">
                                <input type="text" name="sort" placeholder="排序" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="navEdit">编辑</button>
                                <button class="layui-btn layui-btn-danger" lay-submit lay-filter="navDel">删除</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-tab-item">
                    <form class="layui-form" action="/admin/nav/edit" method="post">
                        <input type="hidden" name="navParentId">
                        <div class="layui-form-item">
                            <label class="layui-form-label">导航名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="navName" placeholder="请输入导航名称" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="url" placeholder="请输入地址" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">图标</label>
                            <div class="layui-input-block">
                                <input type="text" name="icon" placeholder="图标" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">排序</label>
                            <div class="layui-input-block">
                                <input type="text" name="sort" placeholder="排序" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="navEdit">添加</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</@override>
<@override name="script">
<script>
    layui.use(['table','jquery','tree','element','form'], function(){
        var table = layui.table,
                form = layui.form,
                node,
                element = layui.element,
                $ = layui.jquery;

        $.ajax({
            url:'/admin/nav/list',
            type:'post',
            timeout: 2000,
            async:true,
            success:function (data) {
                node = setTree(data);
                var options = {
                    elem: '#nav-tree'
                    ,nodes:[{
                        name:'顶部',
                        id:0,
                        spread:true,
                        children:node
                    }]
                    ,click: function(node){
                        form.val("edit", node);
                        $('input[name="navParentId"]').val(node.id);
                    }
                };

                layui.tree(options);
            },
            complete: function (XMLHttpRequest, status) {
                if (status === 'timeout') {

                }
            }
        });

        form.on('submit(navDel)', function(data){
            console.log(data);

            layer.confirm('是否删除该导航?', {icon: 3, title:'提示'}, function(index){
                //do something
                $.post('/admin/nav/del',
                        {
                            id:data.field.id
                        },
                        function (data,status ,xhr ) {
                            if(status === 'success'){
                                if(data.code === "1"){
                                    location.reload();
                                }else{
                                    console.log(status);
                                    console.log(xhr);
                                }
                            }
                        }
                );

                layer.close(index);
            });



            return false;
        });

        function setTree(data) {
            var arr = [];
            for(var i = 0; i<data.length; i++){
                data[i].navName = data[i].name;

                if(data[i].children){
                    data[i].children = setTree(data[i].children);
                }

                arr.push(data[i]);
            }

            return arr;
        }
        
    });
    
    
</script>
</@override>
<@extends name="/common/base.ftl" />