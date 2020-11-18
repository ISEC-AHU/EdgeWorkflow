<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/2 0002
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>customFileChose</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/jquery-ui-1.10.4.min.css">
</head>
<body>
<button id="submit_xml" class="layui-btn layui-btn-radius layui-btn-normal" style="margin-left:10px;margin-top:5px;width: 150px;">Submit</button>
<table class="layui-table">
    <%--<colgroup>
        <col width="20">
        <col width="100">
        <col width="150">
        <col width="150">
    </colgroup>--%>
    <thead>
    <tr>
        <th>Chose</th>
        <th>XML FileName</th>
        <th>Creation Time</th>
    </tr>
    </thead>
    <tbody id="xml_th">

    </tbody>
</table>


</body>
<script type="text/javascript" src="/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    /*layui.use('element', function(){
        var element = layui.element;

        //…
    });*/
$(document).ready(function(){
    $.ajax({
        url:"/getxmlfile",
        type:"POST",
        // data:"",
        dataType:"text",
        async: false,
        contentType: "application/json",
        success:function (res) {
            console.log(res);
            var xmlFiles = eval("("+res+")");
            var xmlName = xmlFiles[0];
            var xmlTime = xmlFiles[1];
            console.log(xmlName);
            console.log(xmlTime);
            var html ="";
            for(var i = 0; i < xmlName.length; i++){
                var xmlName_item = xmlName[i];
                var xmlTime_item = xmlTime[i];
                console.log(xmlName_item);
                console.log(xmlTime_item);
                html += "<tr>";

                html +=     "<td>"+ "<div class=\" chose_radio layui-unselect layui-form-radio\" value="+ xmlName +"><i class=\"layui-anim layui-icon\"></i><div></div></div>" +"</td>";
                html +=     "<td>"+ xmlName_item +"</td>";
                html +=     "<td>"+ xmlTime_item +"</td>";
                html += "</tr>";
            }
            $("#xml_th").html(html);
        },
        error:function () {
            alert("import error!");
        }
    });
    $(".chose_radio").click(function(){
        $(".chose_radio").html("<i class=\"layui-anim layui-icon\"></i><div></div>");
        $(this).html("<i class=\"layui-anim layui-icon layui-anim-scaleSpring\"></i><div></div>");
        $(".chose_radio").removeClass("layui-form-radioed");
        $(this).addClass("layui-form-radioed");
    });
    $("#submit_xml").click(function () {
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        var xmlName = $(".layui-form-radioed").attr("value");
        console.log(xmlName);
        if (xmlName != "" | typeof(reValue) != undefined) {
            parent.loadCustomXml(xmlName);
            parent.layer.close(index);
        } else {
            //parent.layer.close(index);
        }
    });

});

</script>
</html>
