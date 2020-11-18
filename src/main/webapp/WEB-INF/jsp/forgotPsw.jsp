<%--
  Created by IntelliJ IDEA.
  User: dr
  Date: 2020/2/16
  Time: 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>forgotPsw</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
<style>

</style>
<body>
<div class="forgot_main">
    <%--<form class="layui-form zyl_pad_01" action="">--%>
    <div class="layui-form zyl_pad_01">
        <div class="layui-col-sm12 layui-col-md12">
            <div class="layui-form-item">
                <input id="password" type="password" name="password" lay-verify="|pass" autocomplete="off" placeholder="New Password" class="layui-input">
                <i class="layui-icon layui-icon-password zyl_lofo_icon"></i>
            </div>
        </div>
        <div class="layui-col-sm12 layui-col-md12">
            <div class="layui-form-item">
                <input id="repassword" type="password" name="rePassword" lay-verify="|pass" autocomplete="off" placeholder="Confirm password" class="layui-input">
                <i class="layui-icon layui-icon-password zyl_lofo_icon"></i>
            </div>
        </div>
        <div class="layui-col-sm12 layui-col-md12">
            <div class="layui-form-item">
                <input id="email" type="text" name="email" lay-verify="|username" autocomplete="off" placeholder="Email Address" class="layui-input">
                <i class="layui-icon layui-icon-username zyl_lofo_icon"></i>
            </div>
        </div>
        <div class="layui-col-sm12 layui-col-md12">
            <div class="layui-row">
                <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div class="layui-form-item">
                        <input id="emailVerCode" type="text" name="emailVerCode" lay-verify="|vercodes" autocomplete="off" placeholder="Verification code" class="layui-input" maxlength="6">
                        <i class="layui-icon layui-icon-vercode zyl_lofo_icon"></i>
                    </div>
                </div>
                <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <button id="sendemail" type="button" class="layui-btn  layui-btn-primary" style="width:180px;margin-left: 10px;">Get verification code</button>
                </div>
            </div>
        </div>
        <div class="layui-col-sm12 layui-col-md12">
            <button id="saveChange" class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="demo1">Save Change</button>
        </div>
    </div>
    <%--</form>--%>

</div>
</body>
<script>
    var password_reg = /^[\S]{4,12}$/;
    var email_reg = /^[A-Za-z0-9]+([_\.][A-Za-z0-9]+)*@([A-Za-z0-9\-]+\.)+[A-Za-z]{2,6}$/;
    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引

    //验证码
    var email_verCode ="";

    $("#sendemail").click(function () {
        var email = $("#email").val();
        if(email ==""){
            layer.msg("The email cannot be empty!",
                {time:1000}
            );
            return false;
        }

        if((!email_reg.test(email)) && (email != "")){
            layer.msg("The email address format is not correct!",
                {time:1000}
            );
            return false;
        }

        $.ajax({
            type: "POST",
            dataType: "text",
            url:'/email',
            data: "emailAddress=" + email,
            success: function(data) {

                if(data == "none"){
                    layer.msg("The user is not exists!",
                        {time:1000}
                    );
                    return;
                }else{
                    var countTime = 60;
                    var t;
                    t = setInterval(function () {
                        if (countTime == 0) {
                            //这里时设置当时间到0的时候重新设置点击事件，并且默认time修改为60
                            $("#sendemail").text("Get verification code");
                            $("#sendemail").removeClass("layui-btn-disabled");
                            $("#sendemail").attr("disabled",false);
                            countTime = 60;
                            clearInterval(t);
                        }else{
                            //这里是显示时间倒计时的时候点击不生效
                            $("#sendemail").text("Send again " + countTime);
                            $("#sendemail").addClass("layui-btn-disabled");
                            console.log(countTime);
                            $("#sendemail").attr("disabled",true);
                            countTime--;
                        }
                    }, 1000);
                    email_verCode = data;
                    console.log(data);
                }
            },
            error:function (res) {
                layer.msg("Page error, please reload!");
                parent.layer.close(index);
                console.log(res);
            }
        });
    })
    $("#saveChange").click(function () {
        var newpsw = $("#password").val();
        var repsw = $("#repassword").val();
        var email = $("#email").val();
        var emailVerCode = $("#emailVerCode").val();
        var flag = true;
        if(newpsw == ""){
            flag = false;
            layer.msg("The new password cannot be empty!",
                {time:1000}
            );
            return false;
        }
        var flag = true;
        if(repsw ==""){
            flag = false;
            layer.msg("The Confirm password cannot be empty!",
                {time:1000}
            );
            return false;
        }
        var flag = true;
        if(email ==""){
            flag = false;
            layer.msg("The email cannot be empty!",
                {time:1000}
            );
            return false;
        }
        var flag = true;
        if(emailVerCode ==""){
            flag = false;
            layer.msg("The verification code cannot be empty!",
                {time:1000}
            );
            return false;
        }

        if((!password_reg.test(newpsw)) && (newpsw != "")){
            flag = false;
            layer.msg("The password must be 4 to 12 digits and no Spaces!",
                {time:1000}
            );
            return false;
        }

        if((!password_reg.test(repsw)) && (repsw != "")){
            flag = false;
            layer.msg("The confirm password must be 4 to 12 digits and no Spaces!",
                {time:1000}
            );
            return false;
        }

        if(newpsw != repsw){
            flag = false;
            layer.msg("The password is not the same as the confirmation password!",
                {time:1000}
            );
            return false;
        }

        if((!email_reg.test(email)) && (email != "")){
            flag = false;
            layer.msg("The Incorrect email format!",
                {time:1000}
            );
            return false;
        }
        if(email_verCode == ""){
            flag = false;
            layer.msg("Please get the verification code first!",
                {time:1000}
            );
            return false;
        }
        if(email_verCode != emailVerCode){
            flag = false;
            layer.msg("The verification code is not right!",
                {time:1000}
            );
            return false;
        }

        debugger
        $.ajax({
            type: "POST",
            dataType: "text",
            url:'/resetPsw',
            data: "emailAddress=" + email + "&password=" + newpsw,
            success: function(data) {
                console.log(data)
                console.log("ddd");
                if(data == "success"){
                    layer.msg("Password changed successfully, please log in!",
                        {time:1000}
                    );
                    parent.layer.close(index);
                    return false;
                }else if(data =="none"){
                    layer.msg("The user does not exist!",
                        {time:1000}
                    );
                    parent.layer.close(index);
                    return false;
                }
                else{
                    layer.msg("Password changed failed, please reset password!",
                        {time:1000}
                    );
                    parent.layer.close(index);
                    return false;
                }
            },
            error:function (res) {
                layer.msg("Password changed failed, please reset password!");
                parent.layer.close(index);
                console.log(res);
            }
        });
    })

</script>
</html>
