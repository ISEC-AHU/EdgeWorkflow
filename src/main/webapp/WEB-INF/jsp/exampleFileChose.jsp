<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/2 0002
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>System Information</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/jquery-ui-1.10.4.min.css">
</head>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">Developer Information</li>
        <li>System Version</li>

    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <%@ include file="developerInformation.jsp"%>
        </div>
        <div class="layui-tab-item">
            <%@include file="systemVersions.jsp"%>
        </div>
    </div>
</div>


</body>
<script type="text/javascript" src="/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    /*layui.use('element', function(){
        var element = layui.element;

        //…
    });*/
</script>
</html>
