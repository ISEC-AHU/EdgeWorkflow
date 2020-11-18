<%--
  Created by IntelliJ IDEA.
  User: dr
  Date: 2020/2/10
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>recommendations</title>
    <meta charset="utf-8">
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<style>
    .textarea{
        border: grey 1px solid;
        width: 99%;
        height: 80%;
        margin-left: 2px;
    }

    .buttons{
        margin-left: 230px;
        margin-top: 20px;
    }
</style>
<script>
    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "H+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
$(document).ready(function(){
    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    $("#submit").click(function(){
        var context = $("#textMain").val();
        // console.log(context);
        var currentTime = new Date().Format("yyyy-MM-dd HH:mm:ss");
        var data = JSON.stringify({"date":currentTime,"advices":context});
        $.ajax({
            url:"/submitAdvices",
            type:"POST",
            data:data,
            dataType:"text",
            async:false,
            contentType:"application/json",
            success:function (res) {
                layer.msg("The recommendations submitted successfully!",
                    {time:1000}
                );
                // console.log(res);
                setTimeout(function(){
                    parent.layer.close(index);
                },1100);
                // parent.layer.close(index);

            },
            error:function(res){
                layer.msg("Failed to obtain user information!");
            }
        });


    });

    $("#reset").click(function(){
        $("#textMain").val("");
    });
})
</script>
<body>
<div class="textarea">
<textarea id="textMain" style="width: 100%; height: 100%;resize: none;" >
</textarea>
<div class="buttons">
    <div class="layui-btn-group">
        <button id="submit" type="button" class="layui-btn">Submit</button>
        <button id="reset" type="button" class="layui-btn">Reset</button>

    </div>
</div>
</div>
</body>
</html>
