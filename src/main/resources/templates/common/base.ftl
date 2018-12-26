<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <#--<link rel="stylesheet" href="/static/layui/css/layui.css">-->

    <#--<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" ></script>-->
    <script src="/static/layuiadmin/layui/layui.js"></script>
    <link rel="icon" href="/static/images/mos.ico" type="image/x-icon" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, adminUser-scalable=0">
    <link rel="stylesheet" href="/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/static/layuiadmin/style/admin.css" media="all">
    <title><@block name="title"></@block>—管理中心</title>
    <@block name="head">

    </@block>
    <style>
        .layui-breadcrumb {
            border-bottom: 1px solid #1E9FFF;
            padding: 5px;
            background-color: #F0F0F0;
        }
        .input-toolbar {
            display: inline-block;
            position: absolute;
            top: 1px;
            right: 1px;
            height: 36px;
            line-height: 36px;
            border-radius: 0 2px 2px 0;
            border-left: 1px solid #e6e6e6;
            background-color: #eee;
            font-size: 0;
        }
        .input-toolbar .layui-icon {
            width: 36px;
            display: inline-block;
            text-align: center;
            border-right: 1px solid #e6e6e6;
            cursor: pointer;
        }
        .input-toolbar .layui-icon:hover {
            background-color: #e0e0e0;
        }
        .input-toolbar .layui-icon:last-child {
            border-right: 0;
        }
        #body-iframe {
            margin: 0;
            padding: 0;
            border: 0;
            width: 100%;
            height: 100%;
        }
        .layui-breadcrumb {
            visibility: visible;
        }
        .layui-quote-nm{color: #666; background: #fbfbfb;}
        .layui-fluid{margin-top: 10px;}
        #app{height: 100%; overflow: auto;}
        html,body{background: #FFFFFF;}
    </style>
</head>
<body  class="layui-layout-body">
<@block name="body">

</@block>
<@block name="script">

</@block>
</body>
</html>