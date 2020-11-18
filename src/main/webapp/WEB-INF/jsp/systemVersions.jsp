<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/2 0002
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>System Versions</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/jquery-ui-1.10.4.min.css">
</head>
<style>
    body{
        padding: 20px 20px 20px 20px;
    }
</style>
<body>

<table class="layui-table">
    <%--<colgroup>
        <col width="20">
        <col width="100">
        <col width="150">
        <col width="150">
    </colgroup>--%>
    <thead>
    <tr>
        <th>Number</th>
        <th>Version Number</th>
        <th>Note</th>
        <th>Updated Date</th>
    </tr>
    </thead>
    <tbody id="version_tb">

    </tbody>
</table>

</body>
<script type="text/javascript" src="/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script>
    $(document).ready(function(){
        $.ajax({
            url:"/getVersions",
            type:"POST",
            data:'',
            dataType:'text',
            processData: false,
            cache:false,
            contentType: 'application/json',
            mimeType:"multipart/form-data",
            success:function (res) {
                // console.log(res);
                var versions = eval("("+res+")");
                console.log(versions);
                var version_tb = $("#version_tb");
                var html = "";
                for(var i = 0; i < versions.length; i++){
                    var version = versions[i];
                    var number = i +1;
                    var version_number = version['versionNum'];
                    var note = version['note'];
                    var updateTime = version['updateTime'];
                    html += "<tr>";
                    html +=     "<td>"+ number +"</td>";
                    html +=     "<td>"+ version_number +"</td>";
                    html +=     "<td>"+ note +"</td>";
                    html +=     "<td>"+ updateTime +"</td>";
                    html += "</tr>";
                }
                version_tb.html(html);
            },
            error:function (res) {
                console.log(res);
            }
        })
    });
</script>
</html>
