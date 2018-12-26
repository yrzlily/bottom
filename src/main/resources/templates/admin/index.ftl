<@override name="title">管理中心</@override>
<@override name="head">
<style>
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

</style>
</@override>
<@override name="body">
<#--<div class="layui-layout layui-layout-admin">-->
    <#--<div class="layui-header">-->
        <#--<div class="layui-logo">MOS</div>-->
        <#--<!-- 头部区域（可配合layui已有的水平导航） &ndash;&gt;-->
        <#--<ul class="layui-nav layui-layout-left">-->
            <#--<li class="layui-nav-item"><a class="to-iframe" href="/admin/cate/index">分类</a></li>-->
            <#--<li class="layui-nav-item"><a class="to-iframe" href="/admin/adminUser/index">用户</a></li>-->
            <#--<li class="layui-nav-item">-->
                <#--<a href="javascript:;">其它系统</a>-->
                <#--<dl class="layui-nav-child">-->
                    <#--<dd><a href="">邮件管理</a></dd>-->
                    <#--<dd><a href="">消息管理</a></dd>-->
                    <#--<dd><a href="">授权管理</a></dd>-->
                <#--</dl>-->
            <#--</li>-->
        <#--</ul>-->
        <#--<ul class="layui-nav layui-layout-right">-->
            <#--<li class="layui-nav-item">-->
                <#--<a href="javascript:;">-->
                    <#--<img src="http://t.cn/RCzsdCq" class="layui-nav-img">-->
                    <#--&lt;#&ndash;${Session["adminUser"].username}&ndash;&gt;-->
                <#--</a>-->
                <#--<dl class="layui-nav-child">-->
                    <#--<dd><a href="">基本资料</a></dd>-->
                    <#--<dd><a href="">安全设置</a></dd>-->
                <#--</dl>-->
            <#--</li>-->
            <#--<li class="layui-nav-item"><a href="/admin/logout">退了</a></li>-->
        <#--</ul>-->
    <#--</div>-->
    <#---->

    <#--<div class="layui-body">-->
        <#--<!-- 内容主体区域 &ndash;&gt;-->
        <#--<iframe id="body-iframe" data-src=""></iframe>-->
    <#--</div>-->

    <#--&lt;#&ndash;<div class="layui-footer">&ndash;&gt;-->
        <#--&lt;#&ndash;<!-- 底部固定区域 &ndash;&gt;&ndash;&gt;-->
        <#--&lt;#&ndash;© layui.com - 底部固定区域&ndash;&gt;-->
    <#--&lt;#&ndash;</div>&ndash;&gt;-->
<#--</div>-->

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="" target="_blank" title="前台">
                        <i class="layui-icon layui-icon-website"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <cite>${Session["admin_user"].username}</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd style="text-align: center;"><a href="/admin/logout">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="home/console.html">
                    <span>Mos</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                    <#list nav as ns>
                    <li data-name="adminUser" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="${ns.navName}" lay-direction="${ns.id}">
                            <i class="layui-icon ${ns.icon}"></i>
                            <cite>${ns.navName}</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <#list ns.nav as n>
                            <dd>
                                <a lay-href="${n.url}">${n.navName}</a>
                            </dd>
                            </#list>
                        </dl>
                    </li>
                    </#list>
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="" frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>

</@override>
<@override name="script">
<script src="/static/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>
</@override>
<@extends name="/common/base.ftl" />