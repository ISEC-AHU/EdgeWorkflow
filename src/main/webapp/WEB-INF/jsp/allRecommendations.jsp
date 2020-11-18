<%--
  Created by IntelliJ IDEA.
  User: dr
  Date: 2020/2/11
  Time: 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>allRecommendations</title>
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<style>

</style>
<script>
$(document).ready(function(){
    $.ajax({
        url:"/getRecommendations",
        type:"POST",
        data:"",
        dataType:"text",
        async:false,
        contentType:"application/json",
        success:function (res) {
            var advices = eval("("+res+")");
            console.log(advices);
            var advices_tb = $("#advices_tb");
            var html = "";
            for(var i = 0; i < advices.length; i++){
                var advice = advices[i];
                var number = i +1;
                var date = advice['date'];
                var advice = advice['advices'];
                html += "<tr>";
                html +=     "<td>"+ number +"</td>";
                html +=     "<td>"+ date +"</td>";
                html +=     "<td>"+ advice +"</td>";
                html += "</tr>";
            }
            advices_tb.html(html);
        },
        error:function(res){
            layer.msg("Failed to obtain user information!");
        }
    });
});
</script>
<body>
<table class="layui-table">
    <thead>
    <tr>
        <th width="10%">Number</th>
        <th width="30%">Time</th>
        <th width="60%">Advices</th>
    </tr>
    </thead>
    <tbody id="advices_tb">

    </tbody>
</table>
</body>
</html>
