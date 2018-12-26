<@override name="title">编辑用户</@override>
<@override name="head">
<style>

</style>
</@override>
<@override name="body">
<div class="layui-fluid">
    <form class="layui-form" action="/admin/user/edit" method="post">
        <input type="hidden" name="id" value="${adminUser.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" required value="${adminUser.username}" lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" placeholder="如不修改请留空" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">头像</label>
            <div class="layui-input-block">
                <input type="text" name="avatar" value="${adminUser.avatar!''}" placeholder="头像" class="layui-input">
                <div class="input-toolbar">
                    <i class="layui-icon upload" lay-data="{accept:'avatar',data:{type:'avatar'}}" data-bind="[name='avatar']" title="头像">&#xe62f;</i>
                    <i class="layui-icon preview" data-bind="[name='avatar']" title="点击查看图片">&#xe64a;</i>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
            </div>
        </div>
    </form>
</div>

</@override>
<@override name="script">
<script>
    layui.use(['form','upload'], function(){
        var upload = layui.upload,
                $ = layui.jquery,
                form = layui.form;

        // 封面上传
        upload.render({
            elem: '.upload'
            ,url: '/file/upload'
            ,method: 'post'
            ,accept: 'file'
            ,field: 'file'
            ,multiple: false
            ,before: function (obj) {
                // 显示加载动画
                layer.load();
            }
            ,done: function (res, index, upload) {
                // 关闭加载动画
                layer.closeAll();
                if (res.code !== 0) {
                    layer.msg(res.msg);
                    return ;
                }

                // 显示成功信息
                layer.msg('上传成功');

                $(this.item.data('bind')).val(res.data.src);
            }
            ,error: function (index, upload) {
                console.log(index, upload);
                layer.closeAll();
                layer.msg('上传失败');
            }
        });

        $('.preview').click(function () {
            var bind = $(this).data('bind');
            if (!bind) {
                layer.msg('缺少属性: data-bind');
                return ;
            }

            var src = $(bind).val();
            if (!src) {
                layer.msg('图片地址为空');
                return ;
            }

            layer.open({
                type: 1
                ,title: '图片预览'
                ,btn: ''
                ,shadeClose: true
                ,resize: false
                ,area: '500px'
                ,content: '<div style="text-align: center;margin: 0px;"><img src="'+ src +'" style="max-width: 200px;max-height: 200px;"></div>'
            });
        });

        form.on('submit(table)', function(data){

        });
    });
</script>
</@override>
<@extends name="/common/base.ftl" />