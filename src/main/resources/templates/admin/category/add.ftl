<@override name="title"></@override>
<@override name="head">
<style>

</style>
</@override>
<@override name="body">
<div class="layui-fluid">
    <form class="layui-form" action="" method="post">
        <input type="hidden" name="parentId" value="${parentId}">
        <div class="layui-form-item">
            <label class="layui-form-label">分类名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="required" placeholder="分类名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-block">
                <input type="text" name="sort" required  lay-verify="required" placeholder="排序" autocomplete="off" class="layui-input">
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

</script>
</@override>
<@extends name="/common/base.ftl" />