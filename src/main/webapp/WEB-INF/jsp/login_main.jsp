<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/30 0030
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Login main</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/css/login.css" media="all">
    <!-- Jquery Js -->
    <%--<script type="text/javascript" src="/jquery/jquery.min.js"></script>--%>
    <script type="text/javascript" src="/jquery/jquery-1.9.1.min.js"></script>
    <!-- Layui Js -->
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <!-- Jqarticle Js -->
    <script type="text/javascript" src="/jquery/jparticle.min.js"></script>
    <!-- ZylVerificationCode Js-->
    <script type="text/javascript" src="/jquery/zylVerificationCode.js"></script>
    <%--get ip and location--%>
    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <style>
        /* 覆盖原框架样式 */
        .layui-elem-quote{background-color: inherit!important;}
        .layui-input, .layui-select, .layui-textarea{background-color: inherit; padding-left: 30px;}
        .register{
            width: 425px;
            margin-top: 5px;
            margin-left: 13px;
            /*position: relative;*/
            /*left: -10px;*/
        }
    </style>
    <%--<link id="layuicss-layer" rel="stylesheet" href="/layui/css/layer_v3.1.1.css" media="all">--%>
</head>
<body>
<!-- Head -->
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-sm12 layui-col-md12 zyl_mar_01">
            <blockquote class="layui-elem-quote">登陆界面</blockquote>
        </div>
    </div>
</div>
<!-- Head End -->

<!-- Carousel -->
<div class="layui-row">
    <div class="layui-col-sm12 layui-col-md12">
        <div class="layui-carousel zyl_login_height" id="zyllogin" lay-filter="zyllogin" lay-anim="fade" lay-indicator="none" lay-arrow="hover" style="height: 720.769px !important; width: 100%;">
            <div carousel-item="">
                <div class="">
                    <div class="zyl_login_cont"><canvas style="display: block; background: rgba(0, 0, 0, 0);" width="1920" height="721"></canvas></div>
                </div>
                <div class="">
                    <img src="/images/login_01.jpg">
                </div>
                <div class="layui-this">
                    <div class="background">
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                    </div>
                </div>
                <div class="">
                    <img src="/images/login_02.jpg">
                </div>
            </div>
            <div class="layui-carousel-ind"><ul><li class=""></li><li class=""></li><li class="layui-this"></li><li class=""></li></ul></div><button class="layui-icon layui-carousel-arrow" lay-type="sub"></button><button class="layui-icon layui-carousel-arrow" lay-type="add"></button></div>
    </div>
</div>
<!-- Carousel End -->

<!-- Footer -->
<div class="layui-row">
    <div class="layui-col-sm12 layui-col-md12 zyl_center zyl_mar_01">
        © 2019 - Anhui University || Deakin University
    </div>
</div>
<!-- Footer End -->



<!-- LoginForm -->
<div class="zyl_lofo_main">
    <fieldset class="layui-elem-field layui-field-title zyl_mar_02">
        <legend>欢迎登陆 - FogWorkflowSim平台</legend>
    </fieldset>
    <div class="layui-row layui-col-space15">
        <div class="" action="">
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input id="username" type="text" name="userName" lay-verify="required|userName" autocomplete="off" placeholder="用户名" class="layui-input">
                    <i class="layui-icon layui-icon-username zyl_lofo_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input id="password" type="password" name="nuse" lay-verify="required|pass" autocomplete="off" placeholder="密码" class="layui-input">
                    <i class="layui-icon layui-icon-password zyl_lofo_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-row">
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div class="layui-form-item">
                            <input id="vercode" type="text" name="vercode" id="vercode" lay-verify="required|vercodes" autocomplete="off" placeholder="验证码" class="layui-input" maxlength="4">
                            <i class="layui-icon layui-icon-vercode zyl_lofo_icon"></i>
                        </div>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div id="vercodes_right" class="zyl_lofo_vercode zylVerCode" onclick="zylVerCode()">xMYb</div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <button id="login" class="register layui-btn layui-btn-fluid" lay-submit="" lay-filter="demo1">立即登录</button>
            </div>
        </div>
        <div>
            <button id="register" class="register layui-btn layui-btn-fluid" lay-submit="" lay-filter="demo2">新用户注册</button>
        </div>
    </div>
</div>
<!-- LoginForm End -->


<script>
    //获取当前时间
    function getFormatDate(){
        var nowDate = new Date();
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1) : nowDate.getMonth() + 1;
        var date = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();
        var hour = nowDate.getHours()< 10 ? "0" + nowDate.getHours() : nowDate.getHours();
        var minute = nowDate.getMinutes()< 10 ? "0" + nowDate.getMinutes() : nowDate.getMinutes();
        var second = nowDate.getSeconds()< 10 ? "0" + nowDate.getSeconds() : nowDate.getSeconds();
        return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
    }



        //获取IP
        // $("#loginip").val(returnCitySN["cip"]);
        // $('#logincity').val(returnCitySN["cname"]);
        var visitip = "";
        var visitaddress = "";
        var visitdate = "";
        $.ajax({
            url: 'http://api.map.baidu.com/location/ip?ak=ia6HfFL660Bvh43exmH9LrI6',
            type: 'POST',
            dataType: 'jsonp',
            success:function(data) {
                //获取城市
                // $('#logincity').val(data.content.address_detail.province + "," + data.content.address_detail.city);
                // console.log(returnCitySN["cip"]);
                // console.log(data.content.address_detail.province + "," + data.content.address_detail.city);
                visitip = returnCitySN["cip"];
                visitaddress = data.content.address_detail.province + "," + data.content.address_detail.city;
                visitdate = getFormatDate();
                // console.log("visitdate:"+visitdate);

            }
        });
        $("#login").click(function (){
            // console.log("login");
            var username = $("#username").val();
            var password = $("#password").val();
            var vercode = $("#vercode").val().toLowerCase();
            var vercode_right = $("#vercodes_right").text().toLowerCase();
            var text_reg = /^[\S]{4,12}$/;
            // console.log(vercode);
            // console.log(vercode_right);
            if(username ==""){
                layer.msg("用户名不能为空！",
                    {time:1000}
                );
                return false;
            }
            if(password ==""){
                layer.msg("密码不能为空！",
                    {time:1000}
                );
                return false;
            }
            if(vercode ==""){
                layer.msg("验证码不能为空！",
                    {time:1000}
                );
                return false;
            }
            if((!text_reg.test(username)) && (username != "")){
                layer.msg("账号必须4到12位，且不能出现空格！",
                    {time:1000}
                );
                return false;
            }
            if((!text_reg.test(password)) && (password != "")){
                layer.msg("密码必须4到12位，且不能出现空格！",
                    {time:1000}
                );
                return false;
            }
            if((vercode != vercode_right) && (vercode != "")){
                layer.msg("验证码不正确！",
                    {time:1000}
                );
                return false;
            }
            var data = JSON.stringify({'username':username,'password':password});
            $.ajax({
                url:"/login_check",
                data:data,
                type:"POST",
                dataType: "text",
                contentType: "application/json; charset=utf-8",
                async : false,
                success:function (res) {

                    // console.log(res);
                    if(res == "success"){

                        window.location.href = "/index?username=" + username +"&visitip=" + visitip
                            +"&visitaddress=" + visitaddress +"&visitdate=" + visitdate;

                    }
                    else if(res == "errorPsw"){
                        layer.alert("密码不正确！",{
                            title: '提示信息'
                        });
                    }
                    else{
                        layer.confirm('不存在该用户，是否注册？', {
                            btn: ['是','否'] //按钮
                        }, function(){
                            layer.open({
                                type: 2
                                , offset: "140px"
                                , title: "register"
                                , content: "/To_register"
                                , skin: 'title-style'
                                , area: ['600px', '580px']
                                ,cancel: function(){
                                    window.location.href = "/";
                                }
                            });
                        }, function(){
                            window.location.href = "/";
                        });
                    }
                },
                error:function (res) {
                    // console.log(res);
                    console.log("error");
                }
            })

        });
        $("#register").click(function(){
            // console.log("register");
            layer.open({
                type: 2
                , offset: "140px"
                , title: "Register"
                , content: "/To_register"
                , skin: 'title-style'
                , area: ['600px', '580px']
                ,cancel: function(){
                    // feedSetting();
                }
            });

        });

    // console.log(visitip +" "+visitaddress+" "+getFormatDate() );
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //自定义验证规则
        /*form.verify({
            userName: function(value){
                if(value.length <= 0 ){
                    return '账号至少得5个字符';
                }
            }
            ,pass: [/^[\S]{4,12}$/,'密码必须4到12位，且不能出现空格']
            ,vercodes: function(value){
                //获取验证码
                var zylVerCode = $(".zylVerCode").html();
                if(value!=zylVerCode){
                    return '验证码错误（区分大小写）';
                }
            }
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });*/

        //监听提交
        /*form.on('submit(demo1)', function(data){
            /!*var visitip = returnCitySN["cip"];
            var visitaddress = data.content.address_detail.province + "," + data.content.address_detail.city;
            var visitdate = getFormatDate();*!/
           /!* layer.alert(JSON.stringify(data.field),{
                title: '最终的提交信息'
            })*!/
            //获取表单数据
            var formData = JSON.stringify(data.field);
            formData = eval("("+formData+")");
            //重新生成json数据
            var username = formData['userName'];
            var password = formData['nuse'];
            var data = JSON.stringify({'username':username,'password':password});
            $.ajax({
                url:"/login_check",
                data:data,
                type:"POST",
                dataType: "text",
                contentType: "application/json; charset=utf-8",
                async : false,
                success:function (res) {

                    // console.log(res);
                    if(res == "success"){

                        window.location.href = "/index?username=" + username +"&visitip=" + visitip
                            +"&visitaddress=" + visitaddress +"&visitdate=" + visitdate;

                    }
                    else if(res == "errorPsw"){
                        layer.alert("密码不正确！",{
                            title: '提示信息'
                        });
                    }
                    else{
                        layer.confirm('不存在该用户，是否注册？', {
                            btn: ['是','否'] //按钮
                        }, function(){
                            layer.open({
                                type: 2
                                , offset: "140px"
                                , title: "register"
                                , content: "/To_register"
                                , skin: 'title-style'
                                , area: ['600px', '580px']
                                ,cancel: function(){
                                    window.location.href = "/";
                                }
                            });
                        }, function(){
                           window.location.href = "/";
                        });
                    }
                },
                error:function (res) {
                    // console.log(res);
                    console.log("error");
                }
            })
            return false;
        });*/

        /*form.on('submit(demo2)', function(){
            layer.open({
                type: 2
                , offset: "140px"
                , title: "Register"
                , content: "/To_register"
                , skin: 'title-style'
                , area: ['600px', '580px']
                ,cancel: function(){
                     // feedSetting();
                }
            });

        });*/



        //设置轮播主体高度
        var zyl_login_height = $(window).height()/1.3;
        var zyl_car_height = $(".zyl_login_height").css("cssText","height:" + zyl_login_height + "px!important");


        //Login轮播主体
        carousel.render({
            elem: '#zyllogin'//指向容器选择器
            ,width: '100%' //设置容器宽度
            ,height:'zyl_car_height'
            ,arrow: 'always' //始终显示箭头
            ,anim: 'fade' //切换动画方式
            ,autoplay: true //是否自动切换false true
            ,arrow: 'hover' //切换箭头默认显示状态||不显示：none||悬停显示：hover||始终显示：always
            ,indicator: 'none' //指示器位置||外部：outside||内部：inside||不显示：none
            ,interval: '5000' //自动切换时间:单位：ms（毫秒）
        });

        //监听轮播--案例暂未使用
        carousel.on('change(zyllogin)', function(obj){
            var loginCarousel = obj.index;
        });

        //粒子线条
        $(".zyl_login_cont").jParticle({
            background: "rgba(0,0,0,0)",//背景颜色
            color: "#fff",//粒子和连线的颜色
            particlesNumber:100,//粒子数量
            //disableLinks:true,//禁止粒子间连线
            //disableMouse:true,//禁止粒子间连线(鼠标)
            particle: {
                minSize: 1,//最小粒子
                maxSize: 3,//最大粒子
                speed: 30,//粒子的动画速度
            }
        });

    });

</script>



</body>
</html>
