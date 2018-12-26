<@override name="title">系统登录</@override>
<@override name="head">
<style>
    .layui-main {
        width: 600px;
        margin-top: 10%;
    }
</style>
</@override>
<@override name="body">
<div class="layui-main">
    <form class="layui-form" method="post" action="/admin/login">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" required value="admin" lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" required value="123456" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">登陆</button>
            </div>
        </div>
    </form>
</div>
</@override>
<@override name="script">
<script>

</script>
</@override>
<@extends name="/common/base.ftl" />