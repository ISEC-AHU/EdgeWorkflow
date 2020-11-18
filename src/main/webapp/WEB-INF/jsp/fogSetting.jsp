<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FogWorkflowSim</title>
    <meta charset="utf-8">
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <script type="text/javascript" src="/js/fogSetting.js"></script>
    <link rel="stylesheet" href="/css/fog.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<%--<button id="import-btn" class="import-btn layui-btn layui-btn-radius layui-btn-primary">Import</button>--%>
<button id="import-btn" class="import-btn layui-btn layui-btn-radius layui-btn-normal">Import</button>
<div class="line-div">
    <div class="title-div">Cloud Servers</div>
    <div id="cloudServers" class="cloud-container-div">
        <div class="container-div" id="cloud0"></div>
        <div class="container-div" id="cloud1"></div>
        <div class="container-div" id="cloud2"></div>
        <div class="container-div" id="cloud3"></div>
        <div class="container-div" id="cloud4"></div>
    </div>
</div>
<div class="line-div">
    <div class="title-div">Fog Nodes</div>
    <div id="fogNodes" class="fog-container-div">
        <div class="container-div" id="fog0"></div>
        <div class="container-div" id="fog1"></div>
        <div class="container-div" id="fog2"></div>
        <div class="container-div" id="fog3"></div>
        <div class="container-div" id="fog4"></div>
    </div>
</div>
<div class="line-div">
    <div class="title-div">End Devices</div>
    <div id="endDevices" class="mobile-container-div">
        <div class="container-div" id="mobile0"></div>
        <div class="container-div" id="mobile1"></div>
        <div class="container-div" id="mobile2"></div>
        <div class="container-div" id="mobile3"></div>
        <div class="container-div" id="mobile4"></div>
    </div>
</div>
</body>
</html>
