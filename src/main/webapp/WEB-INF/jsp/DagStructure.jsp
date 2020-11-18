<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Document Information</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/jquery-ui-1.10.4.min.css">
</head>
<body>
<div id="dagHelpShow"></div>

</body>
<script type="text/javascript" src="/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<%--<script type="text/javascript" src="/echarts/echarts.min.js"></script>--%>
<script type="text/javascript" src="/echarts/echarts-en.min.js"></script>
<script>
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
    var element = layui.element;

    //…
});

$(document).ready(function(){
    var dagParam = parent.$("#dagParam").val();
    console.log(dagParam);
    var dagJson = eval("("+dagParam+")");
    $.ajax({
        type: "POST",
        url: "/getDag",
        data: dagJson,
        dataType: "text",
        async: false,
        success: function (data) {
            // console.log(data);
            var dagData = eval("("+data+")");
            var points = dagData["points"];
            var links = dagData["links"];
            loadDag(points, links);
        },
        error: function(data){
            console.log("error...");
        }
    });

});

//加载dag图
function loadDag(points, links){
    var option = {
        title: {
            text: 'DAG Structure'
        },
        tooltip: {},
        animationDurationUpdate: 1500,
        animationEasingUpdate: 'quinticInOut',
        series: [
            {
                type: 'graph',
                layout: 'none',
                symbolSize: 20,
                roam: true,
                label: {
                    show: true
                },
                edgeSymbol: ['circle', 'arrow'],
                edgeSymbolSize: [4, 10],
                edgeLabel: {
                    fontSize: 20
                },
                data: points,
                // links: [],
                links: links,
                lineStyle: {
                    opacity: 0.9,
                    width: 2,
                    curveness: 0
                }
            }
        ]
    };

    var dagChart = echarts.init(document.getElementById('dagHelpShow'));
    dagChart.clear();
    dagChart.setOption(option);

}

</script>
<style>
body{
    background-color: #FFFFFF;
}

#dagHelpShow{
    position: relative;
    width: 99%;
    height: 99%;
    border: #aab9c3 solid 1px;
    border-radius: 10px 10px 10px 10px;
    background-color: #FFFFFF;
    /*display: none;*/
}
</style>
</html>