<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/8 0008
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CyberShake</title>
    <link rel="stylesheet" type="text/css" href="/css/DrawWorkflow/cyberShake.css">
    <%--<link rel="stylesheet" href="/layui/css/layui.css">--%>
</head>
<body>
<%--cybershake workflow--%>
<div class="top_bar">
    <div class="sameline">
        <div id='exts' class="operate_node ExtractSGT" ></div>
        <div>ExtractSGT</div>
    </div>
    <div class="sameline">
        <div id='seis' class="operate_node SeismogramSynthesis" ></div>
        <div>SeismogramSynthesis</div>
    </div>
    <div class="sameline">
        <div id='zips' class="operate_node ZipSeis" ></div>
        <div>ZipSeis</div>
    </div>
    <div class="sameline">
        <div id='peak' class="operate_node PeakValCalcOkaya" ></div>
        <div>PeakValCalcOkaya</div>
    </div>
    <div class="sameline">
        <div id='zipp' class="operate_node ZipPSA" ></div>
        <div>ZipPSA</div>
    </div>
    <div class="sameline">
        <div id="del" title="移到这里删除"><img src="/images/del.png"></div>
    </div>
    <div class="buttons">
        <div class="layui-btn-group">
            <button id="cybershake_save" type="button" class="layui-btn">保存</button>
            <button id="cybershake_reset" type="button" class="layui-btn">重置</button>
        </div>
    </div>
</div>
<div id="panel" class="panel">
    <div id="item_left" class="item"></div>
    <div id="item_right" class="item" style="left:150px;"></div>
</div>
</body>
<script type="text/javascript" src="/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
<%--<script type="text/javascript" src="/jquery/jsplumb.min.js"></script>--%>
<script type="text/javascript" src="/js/DrawWorkflow/cyberShake.js"></script>
</html>



