<@override name="title"></@override>
<@override name="head">
<style>

</style>
</@override>
<@override name="body">
<div class="layui-fluid">
    <form class="layui-form" action="" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            </div>
        </div>
    </form>
</div>
</@override>
<@override name="script">
<script>
    layui.use('form', function(){
        var form = layui.form;

        form.on('submit(table)', function(data){

        });
    });
</script>
</@override>
<@extends name="/common/base.ftl" />