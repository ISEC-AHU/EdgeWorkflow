<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/29 0029
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginPage</title>
</head>
<body>
login page
</body>
</html>--%>




<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html <%--xmlns="http://www.w3.org/1999/xhtml"--%>>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link href="/layui/css/demo.css" rel="stylesheet" media="all">
    <!--[if IE]>

    <style type="text/css">
        li.remove_frame a {
            padding-top: 5px;
            background-position: 0px -3px;
        }
    </style>

    <![endif]-->

    <%--<script src="https://hm.baidu.com/hm.js?382f81c966395258f239157654081890"></script>--%>
    <script type="text/javascript" src="/jquery/jquery-1.9.1.min.js"></script>
    <%--<script type="text/javascript" src="/jquery/jquery.min.js"></script>--%>
    <script type="text/javascript" src="/jquery/jquery.qrcode.min.js"></script>
    <%--<script type="text/javascript" src="/layui/layui.all.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            function fixHeight() {
                var headerHeight = $("#switcher").height();
                $("#iframe").attr("height", $(window).height()-54+ "px");
            }
            $(window).resize(function () {
                fixHeight();
            }).resize();

            $('.icon-monitor').addClass('active');

            $(".icon-mobile-3").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width-3');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-mobile-2").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width-2');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-mobile-1").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width');
                $('.icon-tablet,.icon-mobile,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-tablet").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('tablet-width');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-monitor").click(function () {
                $("#by").css("overflow-y", "hidden");
                $('#iframe-wrap').removeClass().addClass('full-width');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });
        });
    </script>

    <script type="text/javascript">
        function Responsive($a) {
            if ($a == true) $("#Device").css("opacity", "100");
            if ($a == false) $("#Device").css("opacity", "0");
            $('#iframe-wrap').removeClass().addClass('full-width');
            $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
            $(this).addClass('active');
            return false;
        };
    </script>

    <%--<script type="text/javascript" src="/static/js/protect.js"></script>--%>

</head>
<body id="by">

<div id="switcher">
    <div class="center">
        <ul>
            <%--<div id="Device">
                <li class="device-monitor"><a href="javascript:"><div class="icon-monitor active"></div></a></li>
                <li class="device-mobile"><a href="javascript:"><div class="icon-tablet"></div></a></li>
                <li class="device-mobile"><a href="javascript:"><div class="icon-mobile-1"></div></a></li>
                <li class="device-mobile-2"><a href="javascript:"><div class="icon-mobile-2"></div></a></li>
                <li class="device-mobile-3"><a href="javascript:"><div class="icon-mobile-3"></div></a></li>
            </div>--%>
            <%--<li class="top2">
                <a href="#">手机二维码预览</a>
                <div class="vm">
                    <div id="output"><canvas width="150" height="150"></canvas></div>
                    <p style="color:#808080;margin:10px 0 0 0;">扫一扫，直接在手机上打开</p>
                </div>
            </li>--%>
            <li class="logoTop">
                <%--<a href="https://www.17sucai.com/pins/34125.html">基于Layui简约登录界面</a>            <script type="text/javascript">--%>
                <span>FogWorkflowSim登录</span>
                <script type="text/javascript">
                    jQuery('#output').qrcode({width:150,height: 150,text: window.location.href});
                </script>
            </li><li class="remove_frame"><a href="https://www.17sucai.com/preview/814545/2019-07-12/Mr.Rainbow_Login/index.html" title="移除框架"></a></li>
        </ul>
    </div>
</div>

<div id="iframe-wrap">
    <%@ include file="login_main.jsp"%>
</div>




</body></html>



