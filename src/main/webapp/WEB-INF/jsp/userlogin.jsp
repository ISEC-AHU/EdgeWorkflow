<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19 0019
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
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
    <%--<script type="text/javascript" src="/jquery/jparticle.min.js"></script>--%>
    <!-- ZylVerificationCode Js-->
    <script type="text/javascript" src="/jquery/zylVerificationCode.js"></script>
    <%--get ip and location--%>
    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <style>
        /* 覆盖原框架样式 */
        .layui-elem-quote{background-color: inherit!important;}
        .layui-input, .layui-select, .layui-textarea{background-color: inherit; padding-left: 30px;}
        .register{
            /*width: 425px;*/
            margin-top:  5px;
            /*margin-left: 13px;*/
            /*position: relative;*/
            /*left: -10px;*/
        }
        #fogot{
            margin-top: 5px;
        }
    </style>
</head>
<body>
<div class="login_main">
    <fieldset class="layui-elem-field layui-field-title zyl_mar_03">
        <legend>Welcome to - FogWorkflow platform</legend>
    </fieldset>
    <%--<form class="layui-form zyl_pad_01" action="">--%>
    <div class="layui-form zyl_pad_01">
        <div class="layui-col-sm12 layui-col-md12">
            <div class="layui-form-item">
                <input id="email" type="text" name="email" lay-verify="|username" autocomplete="off" placeholder="email address" class="layui-input">
                <i class="layui-icon layui-icon-username zyl_lofo_icon"></i>
            </div>
        </div>
        <div class="layui-col-sm12 layui-col-md12">
            <div class="layui-form-item">
                <input id="password" type="password" name="password" lay-verify="|pass" autocomplete="off" placeholder="password" class="layui-input">
                <i class="layui-icon layui-icon-password zyl_lofo_icon"></i>
            </div>
        </div>
        <div class="layui-col-sm12 layui-col-md12">
            <div class="layui-row">
                <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div class="layui-form-item">
                        <input id="vercode" type="text" name="vercode" id="vercode" lay-verify="|vercodes" autocomplete="off" placeholder="verification code" class="layui-input" maxlength="4">
                        <i class="layui-icon layui-icon-vercode zyl_lofo_icon"></i>
                    </div>
                </div>
                <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div id="vercodes_right" class="zyl_lofo_vercode zylVerCode" onclick="zylVerCode()">xMYb</div>
                </div>
            </div>
        </div>
        <div class="layui-col-sm12 layui-col-md12">
            <button id="login" class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="demo1">Login</button>
        </div>
        <div class="layui-col-sm12 layui-col-md12">
            <button id="fogot" class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="demo1">Forgot password</button>
        </div>
    </div>
    <%--</form>--%>
</div>
</body>
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
    /*$.ajax({
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
    });*/
    $("#login").click(function (){
        // console.log("login");
        var email = $("#email").val();
        var password = $("#password").val();
        var vercode = $("#vercode").val().toLowerCase();
        var vercode_right = $("#vercodes_right").text().toLowerCase();
        var email_reg = /^[A-Za-z0-9]+([_\.][A-Za-z0-9]+)*@([A-Za-z0-9\-]+\.)+[A-Za-z]{2,6}$/;
        var password_reg = /^[\S]{4,12}$/;
        // console.log(vercode);
        // console.log(vercode_right);
        if(email ==""){
            layer.msg("The email address cannot be empty!",
                {time:1000}
            );
            return false;
        }
        if(password ==""){
            layer.msg("The password cannot be empty!",
                {time:1000}
            );
            return false;
        }
        if(vercode ==""){
            layer.msg("The verification code cannot be empty!",
                {time:1000}
            );
            return false;
        }
        if((!email_reg.test(email)) && (email != "")){
            layer.msg("The Email address format is not correct!",
                {time:1000}
            );
            return false;
        }
        if((!password_reg.test(password)) && (password != "")){
            layer.msg("The passwords must be 4 to 12 digits and no Spaces!",
                {time:1000}
            );
            return false;
        }
        if((vercode != vercode_right) && (vercode != "")){
            layer.msg("Incorrect verification code!",
                {time:1000}
            );
            return false;
        }
        var data = JSON.stringify({'email':email,'password':password});
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

                    parent.location.href = "/login_success?email=" + email +"&visitip=" + visitip
                        +"&visitaddress=" + visitaddress +"&visitdate=" + visitdate;

                }
                else if(res == "errorPsw"){
                    layer.msg("Incorrect password!",
                        {time:1000}
                    );

                }
                else{
                    layer.msg("This user does not exist. Please register!",
                        {time:2000}
                    );
                    /*setTimeout(function(){
                        parent.location.href = "/";
                        },3000);*/

                }
            },
            error:function (res) {
                // console.log(res);
                console.log("error");
            }
        })

    });

    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    //forgot password button
    $("#fogot").click(function(){
        //关闭当前页面
        parent.layer.close(index);
        //打开找回密码页面
        parent.layer.open({
            type: 2
            , offset: "140px"
            , title: "Forgot Password"
            , content: "/forgotPsw"
            , skin: 'title-style'
            , area: ['600px', '580px']
            ,cancel: function(){
                // feedSetting();
            }
        });
    });

    // console.log(visitip +" "+visitaddress+" "+getFormatDate() );
    /*layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //自定义验证规则
        form.verify({
            username: function(value){
                if(value.length < 4 ){
                    return 'The username must have 4 to 12 digits and no Spaces';
                }
            }
            ,pass: [/^[\S]{4,12}$/,'The password must have 4 to 12 digits and no Spaces']
            ,vercodes: function(value){
                //获取验证码
                var zylVerCode = $(".zylVerCode").html().toLowerCase();
                var vercode = value.toLowerCase();
                if(vercode == ""){
                    return 'The verification code cannot be empty';
                }
                if(vercode != zylVerCode){
                    return 'verification code error';
                }
            }
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data){
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
            var username = formData['username'];
            var password = formData['password'];
            var data = JSON.stringify({'username':username,'password':password});
            $.ajax({
                url:"/login_check",
                data:data,
                type:"POST",
                dataType: "text",
                contentType: "application/json; charset=utf-8",
                async : false,
                success:function (res) {
                    console.log(res)
                    // console.log(res);
                    if(res == "success"){
                        parent.location.href = "/login_success?username=" + username +"&visitip=" + visitip
                            +"&visitaddress=" + visitaddress +"&visitdate=" + visitdate;

                    }
                    else if(res == "errorPsw"){
                        layer.alert("密码不正确！",{
                            title: '提示信息'
                        });
                    }
                    else{
                        layer.alert("不存在该用户，请前往注册！",{
                            title: '提示信息'
                        });
                    }
                },
                error:function (res) {
                    // console.log(res);
                    console.log("error");
                }
            })
            return false;
        });




    });*/

</script>
</html>
