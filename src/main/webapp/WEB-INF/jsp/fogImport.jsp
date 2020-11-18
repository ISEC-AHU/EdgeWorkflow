<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FogWorkflowSim</title>
    <meta charset="utf-8">
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <script type="text/javascript" src="/js/fogImport.js"></script>
    <link rel="stylesheet" href="/css/fogImport.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<div class="line1">
    <div class="chosen-file">Select File:</div>
    <input id="chooseInput" class="chooseInput" readonly="readonly" type="text">
    <%--<button id="submit" class="submit layui-btn-radius layui-btn-primary">Submit</button>--%>
    <button id="submit" class="submit layui-btn layui-btn-radius layui-btn-normal">Submit</button>
</div>
<div class="line2">
    <ul>
        <li><img class="li-img" src="/images/file.ico">EnvironmentSetting.xml</li>
        <li><img class="li-img" src="/images/file.ico">大EnvironmentSetting.xml</li>
    </ul>
</div>
</body>
</html>
