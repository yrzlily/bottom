<@override name="title">权限管理</@override>
<@override name="head">
<style>

</style>
</@override>
<@override name="body">
<div class="layui-fluid">

</div>
</@override>
<@override name="script">
<script>
    layui.use(['table','jquery'], function() {
        var table = layui.table,
            $ = layui.jquery;

        table.render({
            elem: '#table'
            ,height: 'auto'
            ,url: 'index'
            ,method: 'post'
            ,id:'table'
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:80, sort: true}
                ,{field: 'username', title: '用户名', width:120}
                ,{ width:150, align:'center', toolbar: '#tool'}
            ]]
        });

    });
</script>
</@override>
<@extends name="/common/base.ftl" />