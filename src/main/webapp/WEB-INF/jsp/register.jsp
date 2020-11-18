<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/29 0029
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>registerPage</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/css/login.css" media="all">
    <style>
        /* 覆盖原框架样式 */
        .layui-elem-quote{background-color: inherit!important;}
        .layui-input, .layui-select, .layui-textarea{background-color: inherit; padding-left: 30px;}
        .register{
            width: 425px;
            margin-top: 5px;
            margin-left: 13px;
        }
    </style>
    <link id="layuicss-layer" rel="stylesheet" href="/layui/css/layer_v3.1.1.css" media="all">
</head>
<body>
<div class="register_main">
        <%--<form class="layui-form zyl_pad_01" action="">--%>
    <div class="layui-form zyl_pad_01">
        <div class="layui-col-sm12 layui-col-md12">
            <div class="layui-form-item">
                <input id="email" type="text" name="email" lay-verify="|userName" autocomplete="off" placeholder="Email" class="layui-input">
                <i class="layui-icon layui-icon-read zyl_lofo_icon"></i>
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
                    <button id="sendEmail" type="button" class="layui-btn  layui-btn-primary" style="width:180px;margin-left: 10px;">Get verification code</button>
                </div>
                <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <label class="layui-form-label" title="">Subscribe</label>
                    <div class="layui-input-block">
                        <input id="subscribe" type="checkbox" name="switch" lay-skin="switch">
                    </div>
                </div>
            </div>
        </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input id="password" type="password" name="password" lay-verify="|pass" autocomplete="off" placeholder="Password" class="layui-input">
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
                    <input id="username" type="text" name="username" lay-verify="|userName" autocomplete="off" placeholder="nickname" class="layui-input">
                    <i class="layui-icon layui-icon-username zyl_lofo_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input id="organization" type="text" name="organization" lay-verify="|userName" autocomplete="off" placeholder="Organization" class="layui-input">
                    <i class="layui-icon layui-icon-user zyl_lofo_icon"></i>
                </div>
            </div>

            <%--<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                <div class="layui-form-item">
                    <input id="vvv" type="text" name="vercode" id="vvv" lay-verify="|vercodes" autocomplete="off" placeholder="Verification code" class="layui-input" maxlength="4">
                </div>
                <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <button>发送验证码</button>
                </div>
            </div>--%>

            <%--<div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input id="organization" type="text" name="organization" lay-verify="|userName" autocomplete="off" placeholder="Organization" class="layui-input">
                    <i class="layui-icon layui-icon-user zyl_lofo_icon"></i>
                </div>
            </div>--%>

            <%--<div class="layui-col-sm12 layui-col-md12">
                <div class="layui-row">
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div class="layui-form-item">
                            <input id="vercode" type="text" name="vercode" id="vercode" lay-verify="|vercodes" autocomplete="off" placeholder="Verification code" class="layui-input" maxlength="4">
                            <i class="layui-icon layui-icon-vercode zyl_lofo_icon"></i>
                        </div>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div id="vercodes_right" class="zyl_lofo_vercode zylVerCode" onclick="zylVerCode()">xMYb</div>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <label class="layui-form-label" title="">Subscribe</label>
                        <div class="layui-input-block">
                            <input id="subscribe" type="checkbox" name="switch" lay-skin="switch">
                        </div>
                    </div>
                </div>
            </div>--%>
            <div class="layui-col-sm12 layui-col-md12">
                <button id="register" class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="demo1">Register</button>
            </div>
    </div>
        <%--</form>--%>

</div>

</body>
<%--<script type="text/javascript" src="/jquery/jquery.min.js"></script>--%>
<script type="text/javascript" src="/jquery/jquery-1.9.1.min.js"></script>
<!-- Layui Js -->
<%--<script type="text/javascript" src="/layui/layui.js"></script>--%>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<!-- Jqarticle Js -->
<script type="text/javascript" src="/jquery/jparticle.min.js"></script>
<!-- ZylVerificationCode Js-->
<script type="text/javascript" src="/jquery/zylVerificationCode.js"></script>
<script>
    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    var email_verCode ="";
    var t;  //倒计时对象
    var emailFormat = false;
    $("#sendEmail").click(function(){
        var emailAddress =$("#email").val();
        var email_reg = /^[A-Za-z0-9]+([_\.][A-Za-z0-9]+)*@([A-Za-z0-9\-]+\.)+[A-Za-z]{2,6}$/;

        if(emailAddress == ""){
            layer.msg("email vercode can not empty!",
                {time:1000}
            );
            return;
        }
        console.log(email_reg.test(emailAddress)+"ddd");
        if(!email_reg.test(emailAddress)){
            layer.msg("The incorrect email format!",
                {time:1000}
            );
            return false;
        }
        $.ajax({
            type: "POST",
            dataType: "text",
            url:'/register_email',
            data: "emailAddress=" + emailAddress,
            success: function(data) {
                emailFormat = true;
                var countTime = 60;
                if(data == "failed"){
                    layer.msg("The user already exists!",
                        {time:1000}
                    );
                    return;
                }else{
                    debugger
                    email_verCode = data;
                    // console.log(data);
                    t = setInterval(function () {
                        if (countTime == 0) {
                            //这里时设置当时间到0的时候重新设置点击事件，并且默认time修改为60
                            $("#sendEmail").text("Get verification code");
                            $("#sendEmail").removeClass("layui-btn-disabled");
                            $("#sendEmail").attr("disabled",false);
                            countTime = 60;
                            clearInterval(t);
                        }else{
                            //这里是显示时间倒计时的时候点击不生效
                            $("#sendEmail").text("Send again " + countTime);
                            $("#sendEmail").addClass("layui-btn-disabled");
                            $("#sendEmail").attr("disabled",true);
                            countTime--;
                        }
                    }, 1000);
                }

            },
            error:function (res) {
                layer.msg("Registration failed, please re-register!");
                parent.layer.close(index);
                console.log(res);
            }
        });
    });
    $("#register").click(function(){
        var subscribe = "";
        if($('#subscribe').is(':checked')) {
           subscribe = "yes";
        }else{
            subscribe = "no";
        }
        var username =$("#username").val();
        var password =$("#password").val();
        var repassword =$("#repassword").val();
        var email =$("#email").val();
        // var address = $("#address").val();
        var organization =$("#organization").val();
        // var telnumber =$("#telnumber").val();
        // var vercode = $("#vercode").val().toLowerCase();
        // var vercode_right = $("#vercodes_right").text().toLowerCase();
        var emailVerCode = $("#emailVerCode").val();

        var username_reg = /^[\S]{4,12}$/;
        var password_reg = /^[\S]{4,12}$/;
        var repassword_reg = /^[\S]{4,12}$/;
        var email_reg = /^[A-Za-z0-9]+([_\.][A-Za-z0-9]+)*@([A-Za-z0-9\-]+\.)+[A-Za-z]{2,6}$/;
        // var telnumber_reg = /^1[3|4|5|8][0-9]\d{4,8}$/;

        var flag = true;

        if(username ==""){
            flag = false;
            layer.msg("The user name cannot be empty!",
                {time:1000}
            );
            return false;
        }
        if(password ==""){
            flag = false;
            layer.msg("The password cannot be empty!",
                {time:1000}
            );
            return false;
        }
        if(repassword ==""){
            flag = false;
            layer.msg("The confirm password cannot be empty!",
                {time:1000}
            );
            return false;
        }
        if(email ==""){
            flag = false;
            layer.msg("The email cannot be empty!",
                {time:1000}
            );
            return false;
        }
        /*if(address ==""){
            flag = false;
            layer.msg("The address cannot be empty!",
                {time:1000}
            );
            return false;
        }*/
        if(organization ==""){
            flag = false;
            layer.msg("The organization cannot be empty!",
                {time:1000}
            );
            return false;
        }
        /*if(telnumber ==""){
            flag = false;
            layer.msg("The phone number cannot be empty!",
                {time:1000}
            );
            return false;
        }*/
        /*if(vercode ==""){
            flag = false;
            layer.msg("The verification code cannot be empty!",
                {time:1000}
            );
            return false;
        }*/
        if((!username_reg.test(username)) && (username != "")){
            flag = false;
            layer.msg("The user name must have 4 to 12 digits and no Spaces!",
                {time:1000}
            );
            return false;
        }
        if((!password_reg.test(password)) && (password != "")){
            flag = false;
            layer.msg("The passwords must be 4 to 12 digits and no Spaces!",
                {time:1000}
            );
            return false;
        }
        if((!repassword_reg.test(repassword)) && (repassword != "")){
            flag = false;
            layer.msg("The passwords must be 4 to 12 digits and no Spaces!",
                {time:1000}
            );
            return false;
        }
        if(password != repassword){
            flag = false;
            layer.msg("The password is not the same as the confirmation password!",
                {time:1000}
            );
            return false;
        }
        if((!email_reg.test(email)) && (email != "")){
            flag = false;
            layer.msg("The incorrect email format!",
                {time:1000}
            );
            return false;
        }
        /*if((!telnumber_reg.test(telnumber)) && (telnumber != "")){
            flag = false;
            layer.msg("The phone number format is incorrect!",
                {time:1000}
            );
            return false;
        }*/
        if(emailVerCode !=email_verCode){
            flag = false;
            layer.msg("The Incorrect email vercode!",
                {time:1000}
            );
            return false;
        }
        /*if((vercode != vercode_right) && (vercode != "")){
            flag = false;
            layer.msg("Incorrect verification code!",
                {time:1000}
            );
            return false;
        }*/

        if(flag){
            var info = {username:username,password:password,email:email,organization:organization,subscribe:subscribe};
            var data = JSON.stringify(info);
            // console.log(data);
            $.ajax({
                url:"/register",
                data:data,
                type:"POST",
                dataType: "text",
                contentType: "application/json; charset=utf-8",
                async : false,
                success:function (res) {
                    if(res == "success"){
                        layer.msg("Registration successful, please go to login!",
                            {time:2000},
                            function(){
                                parent.layer.close(index);
                            }
                        );
                        return false;
                    }
                    else if(res == "existed"){
                        layer.msg();layer.msg("This user has been registered, please login!",
                            {time:2000},
                            function(){
                                parent.layer.close(index);
                            }
                        );
                        return false;
                    }
                    else{
                        layer.msg("Registration failed, please re-register!",
                            {time:2000},
                            function(){
                                parent.layer.close(index);
                            }
                        );
                        return false;
                    }
                    // console.log(res);
                },
                error:function (res) {
                    layer.msg("Registration failed, please re-register!");
                    parent.layer.close(index);
                    // console.log(res);
                }
            })
        }


    });

</script>
</html>
