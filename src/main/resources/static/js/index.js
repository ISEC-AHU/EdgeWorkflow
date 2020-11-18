
//粒子特效Start
function n(n, e, t) {
    return n.getAttribute(e) || t
}
function e(n) {
    return document.getElementsByTagName(n)
}
function t() {
    var t = e("script"),
        o = t.length,
        i = t[o - 1];
    return {
        l: o,
        z: n(i, "zIndex", -1),
        o: n(i, "opacity", .5),
        c: n(i, "color", "0,0,0"),
        n: n(i, "count", 99)
    }
}
function o() {
    a = m.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,
        c = m.height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight
}
function i() {
    r.clearRect(0, 0, a, c);
    var n, e, t, o, m, l;
    s.forEach(function(i, x) {
        for (i.x += i.xa, i.y += i.ya, i.xa *= i.x > a || i.x < 0 ? -1 : 1, i.ya *= i.y > c || i.y < 0 ? -1 : 1, r.fillRect(i.x - .5, i.y - .5, 1, 1), e = x + 1; e < u.length; e++) n = u[e],
        null !== n.x && null !== n.y && (o = i.x - n.x, m = i.y - n.y, l = o * o + m * m, l < n.max && (n === y && l >= n.max / 2 && (i.x -= .03 * o, i.y -= .03 * m), t = (n.max - l) / n.max, r.beginPath(), r.lineWidth = t / 2, r.strokeStyle = "rgba(" + d.c + "," + (t + .2) + ")", r.moveTo(i.x, i.y), r.lineTo(n.x, n.y), r.stroke()))
    }),
        x(i)
}
var a, c, u, m = document.createElement("canvas"),
    d = t(),
    l = "c_n" + d.l,
    r = m.getContext("2d"),
    x = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||
        function(n) {
            window.setTimeout(n, 1e3 / 45)
        },
    w = Math.random,
    y = {
        x: null,
        y: null,
        max: 2e4
    };
m.id = l,
    m.style.cssText = "position:fixed;top:0;left:0;z-index:" + d.z + ";opacity:" + d.o,
    e("body")[0].appendChild(m),
    o(),
    window.onresize = o,
    window.onmousemove = function(n) {
        n = n || window.event,
            y.x = n.clientX,
            y.y = n.clientY
    },
    window.onmouseout = function() {
        y.x = null,
            y.y = null
    };
for (var s = [], f = 0; d.n > f; f++) {
    var h = w() * a,
        g = w() * c,
        v = 2 * w() - 1,
        p = 2 * w() - 1;
    s.push({
        x: h,
        y: g,
        xa: v,
        ya: p,
        max: 6e3
    })
}
u = s.concat([y]),
    setTimeout(function() {
            i()
        },
        100)
//粒子特效End


//设置进度条
layui.use('element', function(){
    var $ = layui.jquery
        ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

    //触发事件
    var active = {
        loading: function(othis){
            var DISABLED = 'layui-btn-disabled';
            if(othis.hasClass(DISABLED)) return;

            //模拟loading
            var n = 0, timer = setInterval(function(){
                n = n + Math.random()*10|0;
                if(n>100){
                    n = 100;
                    clearInterval(timer);
                    othis.removeClass(DISABLED);
                }
                element.progress('realProgress', n+'%');
            }, 300+Math.random()*1000);

            othis.addClass(DISABLED);
        }
    };

    $('.site-demo-active').on('click', function(){
        var othis = $(this), type = $(this).data('type');
        active[type] ? active[type].call(this, othis) : '';
    });
});


var records = null;
var three_object = null;










//设置柱状图
function barChart(threeObject){
    var key = $("#output").val();
    // console.log("key:" + key);
    // console.log(threeObject);
    var data = [];
    var arr_sim = [];
    var arr_real = [];

    arr_sim.push("Sim");
    arr_real.push("Real");
    var realFlag = false;
    for (var i = 0; i < threeObject.length ; i++) {
        var algo = threeObject[i];
        if(key.indexOf(algo[0]) >= 0){
            var count = algo.length;

            arr_sim.push(algo[1]);
            arr_sim.push(algo[2]);
            arr_sim.push(algo[3]);
            if(count == 7){
                realFlag = true;
                arr_real.push(algo[4]);
                arr_real.push(algo[5]);
                arr_real.push(algo[6]);
            }
        }
    }
    // console.log(arr_sim);
    // console.log(arr_real);

    data.push(['standard', 'Time', 'Energy', 'Cost']);

    data.push(arr_sim);
    if(realFlag){
        data.push(arr_real);
    }

    // console.log("data:" + data);

    option = {
        title : {
            text: 'Objectives\' Comparison',
            subtext: 'Comparison of optimization objectives in different environments',
            x:'center'
        },
        legend: {
            orient: 'vertical',
            left: 'left'

        },
        tooltip: {},
        grid:{
            left: '15%',
            right: '10%',
            bottom: '10%',
            // containLabel: true
        },
        dataset: {
            // 提供一份数据。
            /*source: [
                ['standard', 'Time', 'Energy', 'Cost'],
                ['Sim', 43.3, 85.8, 93.7],
                ['Real', 83.1, 73.4, 55.1],
            ]*/
            source:data
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        // 声明一个 X 轴，类目轴（category）。默认情况下，类目轴对应到 dataset 第一列。
        xAxis: {
            type: 'category',
            name: "Sim/Real"
        },
        // 声明一个 Y 轴，数值轴。
        yAxis: {},
        // 声明多个 bar 系列，默认情况下，每个系列会自动对应到 dataset 的每一列。
        series: [
            {type: 'bar'},
            {type: 'bar'},
            {type: 'bar'}
        ]
    };

    var barChart = echarts.init(document.getElementById('barChartMain'));
    barChart.clear();
    barChart.setOption(option);



}

//设置饼图
function pieChart(outputEntityList){
    var key = $("#output").val();

    // console.log(key);

    var flag_cloud = flag_fog = flag_mobile = false;
    var hostdata = [];// 存放主机所有信息
    var cloudInfo = [];// 存放每个主机及每个主机的任务信息
    var cloudTemp = {};
    var fogInfo = [];// 存放雾主机及任务信息
    var fogTemp = {};
    var mobileInfo = [];// 存放终端设备及任务信息
    var mobileTemp = {};
    // 云上主机及任务量
    for (var i = 0; i < outputEntityList.length; i++) {
        if(outputEntityList[i].dataCenterId == "cloud"){
            for (var j = 0; j < cloudInfo.length; j++) {
                if(cloudInfo[j].name == outputEntityList[i].vmId){
                    cloudInfo[j].value++;
                    flag_cloud = true;
                    j = 0;
                    break;
                }
            }
            if(!flag_cloud){
                cloudTemp = {name:outputEntityList[i].vmId,value:1};
                cloudInfo.push(cloudTemp);
            }
            flag_cloud = false;
        }else if(outputEntityList[i].dataCenterId == "f-0"){// 雾上主机及任务量
            for (var j = 0; j < fogInfo.length; j++) {
                if(fogInfo[j].name == outputEntityList[i].vmId){
                    fogInfo[j].value++;
                    flag_fog = true;
                    j = 0;
                    break;
                }
            }
            if(!flag_fog){
                fogTemp = {name:outputEntityList[i].vmId,value:1};
                fogInfo.push(fogTemp);
            }
            flag_fog = false;
        }else if(outputEntityList[i].dataCenterId == "m-0-0"){// 终端设备上主机及任务量
            for (var j = 0; j < mobileInfo.length; j++) {
                if(mobileInfo[j].name == outputEntityList[i].vmId){
                    mobileInfo[j].value++;
                    flag_mobile = true;
                    j = 0;
                    break;
                }
            }
            if(!flag_mobile){
                mobileTemp = {name:outputEntityList[i].vmId,value:1};
                mobileInfo.push(mobileTemp);
            }
            flag_mobile = false;
        }
    }

    for (var i = 0; i < cloudInfo.length; i++) {
        cloudInfo[i].name = "Cloud"+(i+1);
        hostdata.push(cloudInfo[i]);
    }
    for (var i = 0; i < fogInfo.length; i++) {
        fogInfo[i].name = "Fog"+(i+1);
        hostdata.push(fogInfo[i]);
    }
    for (var i = 0; i < mobileInfo.length; i++) {
        mobileInfo[i].name = "Mobile"+(i+1);
        hostdata.push(mobileInfo[i]);
    }

    var hostKeyData = [];
    for (var i = 0; i < hostdata.length; i++) {
        hostKeyData.push(hostdata[i].name);
    }

    option = {
        title : {
            text: 'Tasks Allocation',
            subtext: 'Number of tasks per machine',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: hostKeyData
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        series : [
            {
                name: '来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                /*data:[
                    {value:5, name:'Cloud1'},
                    {value:10, name:'Fog1'},
                    {value:2, name:'Fog2'},
                    {value:4, name:'Local1'}],*/
                data: hostdata,
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    var pieChart = echarts.init(document.getElementById('pieChartMain'));
    pieChart.clear();
    pieChart.setOption(option);

}

//设置折线图
function lineChart(list) {
    //设置运行时间折线图
    var jobIds = [];
    var simTimes = {};
    var realTimes = {};
    var realFlag = true;
    var count = 0 ;
    for(var i = 0; i < list.length; i++){
        var item = list[i];
        var jobId = item["jobId"];
        var simTime = item["time"];
        var realTime = item["realTime"];
        count += parseFloat(simTime);
        jobIds.push(jobId);
        simTimes[jobId] = simTime;
        if(realTime == undefined){
            realFlag = false;
            realTime = 0;
        }
        realTimes[jobId] = realTime;

    }
    // console.log("count:" + count);

    var legend = [];
    var x_data =[];
    var series_simTime = {};
    var series_realTime = {};
    var series_simTime_y = [];
    var series_realTime_y = [];
    var series = [];



    //添加标题
    legend.push("simTime");
    if(realFlag){
        legend.push("realTime");
    }
    //添加横坐标-任务Id
    for(key in simTimes){
        x_data.push(key);
        series_simTime_y.push(simTimes[key]);
    }
    if(realFlag){
        for(key in realTimes){
            series_realTime_y.push(realTimes[key]);
        }
    }


    //添加数据
    series_simTime['name'] = "simTime";
    series_simTime['type'] = "line";
    series_simTime['data'] = series_simTime_y;
    series.push(series_simTime);

    if(realFlag){
        series_realTime['name'] = "realTime";
        series_realTime['type'] = "line";
        series_realTime['data'] = series_realTime_y;
        series.push(series_realTime)
    }

    option = {
        title : {
            text: 'Scientific Workflow Execution',
            subtext: 'The execution time of the entire scientific workflow',
            x:'center'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: legend,
            left: "left"
        },
        grid:{
            left: '10%',
            right: '10%',
            bottom: '10%',
            // containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            name: "Job ID",
            type: 'category',
            boundaryGap: false,
            data: x_data
        },
        yAxis: {
            name: "Time(ms)",
            type: 'value'
        },
        series: series
    };

    var lineChart = echarts.init(document.getElementById('lineChartMain'));
    lineChart.clear();
    lineChart.setOption(option);
}

//设置甘特图
function ganttChart(outputEntityList){
    var jobs = [];// 存储job名称
    var startTime = [];// 存储任务开始时间
    var finishTime = [];// 存储任务结束时间
    var totalExecutionTime = [];// 存储任务总执行时间

    //判断真实环境中的执行时间是否存在
    var realTimeFlag = true;
    for (var i = 0; i < outputEntityList.length; i++) {
        var outputEntity = outputEntityList[i];
        if(outputEntity.realStartTime == undefined){
            realTimeFlag = false;
            break;
        }

    }

    //甘特图颜色
    var gantt_color = "";
    // 为Echarts获取指定格式的数据
    if(realTimeFlag){
        gantt_color = "#FF0000";
        for (var i = 0; i < outputEntityList.length; i++) {
            var outputEntity = outputEntityList[i];
            jobs.push(i);
            startTime.push(parseFloat(outputEntity.realStartTime));
            finishTime.push(parseFloat(outputEntity.realFinishTime));
            totalExecutionTime.push(parseFloat(finishTime[i] - startTime[i]).toFixed(2));
        }
    }else{
        gantt_color = "#259d24";
        for (var i = 0; i < outputEntityList.length; i++) {
            var outputEntity = outputEntityList[i]
            jobs.push(i);
            startTime.push(parseFloat(outputEntity.startTime));
            finishTime.push(parseFloat(outputEntity.finishTime));
            totalExecutionTime.push(parseFloat(finishTime[i] - startTime[i]).toFixed(2));
        }
    }

    var option = {
        title: {
            text: 'Task Progress',
            subtext: 'Execution time gantt chart',
            x:'center'
        },
        legend: {
            data: ['Task progress']
        },
        xAxis: {
            type: 'value',
            name: 'Time(ms)',
            nameLocation: 'end',
        },
        yAxis: {
            //data: ['job1','job2', 'job3','job4'],
            data: jobs,
            name: 'Job ID',
        },
        tooltip: {
            show: true,
            trigger: 'axis',
            formatter: function(params) {
                var res = params[0].name + "</br>"
                var date0 = params[0].data;
                var date1 = params[1].data;
                var finishTime = Number(date1) + Number(date0);
                // console.log("sum" + finishTime);
                res += params[0].seriesName + ":" + date0 + "   ";
                res += "finishTime:" + finishTime + "</br>";
                res += params[1].seriesName + ":" + date1;
                return res;
            }
        },
        grid: {
            left: '7%',
            right: '10%',
            bottom: '10%'
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        dataZoom: [
            {
                type: 'slider',
                show: true,
                yAxisIndex: [0],
                left: '93%',
                start: 0, //数据窗口范围的起始百分比
                end: 100,
                bottom: "18%"
            },
            {
                type: 'inside',
                yAxisIndex: [0],
                start: 0,
                end: 36
            }
        ],
        series: [
            {
                name: 'startTime',
                type: 'bar',
                stack: '总量',
                barWidth: '60%',
                itemStyle: {
                    normal: {
                        color: 'rgba(0,0,0,0)'
                    }
                },
                //data: [14.78,15.06,39.79,44.33]
                data: startTime
            },
            {/*实际存放差值totalExecution，*/
                name: 'totalExecutionTime',
                type: 'bar',
                stack: '总量',
                barWidth: '60%',
                itemStyle: {
                    normal: {
                        color: gantt_color,
                        barBorderRadius: 0,
                        shadowColor: 'rgba(0, 0, 0, 0)',
                        shadowBlur: 0 //图形阴影的模糊大小。
                    }
                },
                //data: [1,39.79,44.33,44.81]
                data: totalExecutionTime
            }
        ]
    };

    var ganttChart = echarts.init(document.getElementById('ganttChartMain'));
    ganttChart.clear();
    ganttChart.setOption(option);

}

//初始化柱状图，饼图，折线图，甘特图
function initChart(){
    //初始化柱状图
    var threeObject = [];
    var MINMIN_example = [];
    MINMIN_example.push("0");
    MINMIN_example.push(400);
    MINMIN_example.push(50);
    MINMIN_example.push(300);
    threeObject.push(MINMIN_example)
    barChart(threeObject);

    //初始化饼图
    var outputList = [];
    var item1 = {"cost":"6.99","dataCenterId":"f-0","depth":"1","finishTime":"14.74","jobId":"0","parents":"20,","realStatus":"FAILED","startTime":"0.17","status":"SUCCESS","taskId":"2","time":"3","vmId":"1","workLoad":"18941"}
    var item2 = {"cost":"8.32","dataCenterId":"m-0-0","depth":"1","finishTime":"27.82","jobId":"1","parents":"20,","realStatus":"FAILED","startTime":"19.16","status":"SUCCESS","taskId":"2","time":"6","vmId":"2","workLoad":"13856"}
    var item3 = {"cost":"18.23","dataCenterId":"cloud","depth":"1","finishTime":"19.16","jobId":"2","parents":"20,","realStatus":"FAILED","startTime":"0.17","status":"SUCCESS","taskId":"2","time":"9","vmId":"0","workLoad":"30383"}
    var item4 = {"cost":"0.00","dataCenterId":"m-0-0","depth":"1","finishTime":"13.63","jobId":"3","parents":"20,","realStatus":"FAILED","startTime":"0.17","status":"SUCCESS","taskId":"2","time":"12","vmId":"2","workLoad":"13460"}
    var item5 = {"cost":"6.48","dataCenterId":"cloud","depth":"2","finishTime":"34.57","jobId":"4","parents":"0,","realStatus":"FAILED","startTime":"27.82","status":"SUCCESS","taskId":"2","time":"15","vmId":"0","workLoad":"10800"}
    var item6 = {"cost":"6.34","dataCenterId":"f-0","depth":"2","finishTime":"60.96","jobId":"5","parents":"1,0,","realStatus":"FAILED","startTime":"54.36","status":"SUCCESS","taskId":"2","time":"18","vmId":"1","workLoad":"10576"}

    outputList.push(item1);
    outputList.push(item2);
    outputList.push(item3);
    outputList.push(item4);
    outputList.push(item5);
    outputList.push(item6);
    // console.log(outputList);

    //初始化绘制饼图，折线图，甘特图
    pieChart(outputList);
    lineChart(outputList);
    ganttChart(outputList);


}

//初始化数据表格
function initTable(){
    // 初始化Standby表格
    initStandBy();

    //初始化Running表格
    initRunning();

    //初始化Successed表格
    initSuccessed();

    //初始化Failed表格
    initFailed();

    //初始化Detail表格
    initDetail();
}

// 初始化Standby表格
function initStandBy(){
    var html = '';
    for (var i=0; i<20; i++) {
        html += '<tr>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>';

        var temp = '';
        if(i%2 == 0){
            temp = '<td><input class="input_even" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }else{
            temp = '<td><input class="input_odd" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }
        html += temp;
        html += '<td></td>';
        html += '</tr>';
    }
    $("#standby_tbody").html(html);
}

//初始化Running表格
function initRunning(){
    var html = "";
    for (var i=0; i<11; i++) {
        html += '<tr>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>';

        var temp = '';
        if(i%2 == 0){
            temp = '<td><input class="input_even" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }else{
            temp = '<td><input class="input_odd" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }
        html += temp;
        html += '<td></td>';
        html += '</tr>';
    }
    $("#running_tbody").html(html);
}

//初始化Successed表格
function initSuccessed(){
    var html = "";
    for (var i=0; i<20; i++) {
        html += '<tr>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>';

        var temp = '';
        if(i%2 == 0){
            temp = '<td><input class="input_even" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }else{
            temp = '<td><input class="input_odd" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }
        html += temp;
        html += '<td></td>';
        html += '</tr>';
    }
    $("#successed_tbody").html(html);
}

//初始化Failed表格
function initFailed(){
    var html = "";
    for (var i=0; i<20; i++) {
        html += '<tr>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>'+
            '<td></td>';

        var temp = '';
        if(i%2 == 0){
            temp = '<td><input class="input_even" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }else{
            temp = '<td><input class="input_odd" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }
        html += temp;
        html += '<td></td>';
        html += '</tr>';
    }
    $("#failed_tbody").html(html);
}

//初始化detail表格
function initDetail(){
    var html = "";
    for (var i=0; i<20; i++) {
        html += '<tr>'+
            '<td class="detail_job"></td>'+
            '<td class="detail_task"></td>'+
            '<td class="detail_simStus"></td>'+
            '<td class="detail_resource"></td>'+
            '<td class="detail_vm"></td>'+
            '<td class="detail_simTime"></td>'+
            '<td class="detail_simCost"></td>'+
            '<td class="detail_start"></td>'+
            '<td class="detail_finish"></td>'+
            '<td class="detail_depth"></td>'+
            '<td class="detail_realTime"></td>'+
            '<td class="detail_realCost"></td>';

        var temp = '';
        if(i%2 == 0){
            temp = '<td class="detail_parents"><input class="input_even" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }else{
            temp = '<td class="detail_parents"><input class="input_odd" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }
        html += temp;
        html += '<td class="detail_realStus"></td>';
        html += '</tr>';
    }
    $("#detail_tbody").html(html);
}

//设置版本信息
function setVersion() {
    $.ajax({
        url : "/getCurrentVersion",
        data : "",
        type : "POST",
        dataType : "JSON",
        contentType : "application/json;charset=utf-8",
        async : false,
        success : function(res){
            // debugger
            // console.log(res);
            // console.log(res);
            var versionNum = res['versionNum'];
            var note = res['note'];
            var updateTime = res['updateTime'];
            $("#versions").html("Version:" + versionNum);

        },
        error : function(res){
            // console.log(res);
            console.log("error");
        }
    });
}

//加载plan表格
function loadPlanTable(planJson){
    // console.log(planJson);
    var plan_html = "";
    var plan_index = 1;
    for(var key in planJson){
        var plan_name = key;
        var plan_value = planJson[key];
        // console.log(key);
        // console.log(plan_value);
        // console.log(JSON.stringify(plan_value));

        var mobile_number = plan_value["mobile"];
        var fog_number = plan_value["fogServer"];
        var cloud_number = plan_value["cloudServer"];
        var strategy = plan_value["strategy"];
        var algos = plan_value["alSet"];
        var optimize_objective = plan_value["optimize_objective"];
        var deadline = plan_value["deadline"];
        var workflowType = plan_value["daxPath"];
        var customXml = plan_value["custom"];
        var editTime = plan_value["editTime"];

        // console.log("mobile_number:" + mobile_number);
        // console.log("fog_number:" + fog_number);
        // console.log("cloud_number:" + cloud_number);
        // console.log("strategy:" + strategy);
        // console.log("algos:" + algos);
        // console.log("optimize_objective:" + optimize_objective);
        // console.log("deadline:" + deadline);
        // console.log("workflowType:" + workflowType);
        // console.log("editTime:" + editTime);
        if(strategy == ""){
            strategy = "--";
        }
        if(deadline == ""){
            deadline = "--";
        }

        var xmlFile = "";
        if(customXml == ""){
            xmlFile = workflowType;
        }else{
            xmlFile = customXml;
        }

        plan_html += "<tr>" +
                        "<td class=\"plan_no\">" + plan_index + "</td>" +
                        "<td class=\"plan_name\">" + plan_name + "</td>";
        var mec_html = "";
        // "<td>" + cloud_number +"--"+ fog_number +"--"+ mobile_number + "</td>"
        mec_html = "<td class=\"plan_mec\">" +
                    "<div class=\"layui-row\">" +
                        "<div class=\"layui-col-xs4\">" +
                            "<div class=\"img_cloud\">" +
                                "<div class=\"cloud_topnum\">" + cloud_number + "</div>" +
                            "</div>" +
                        "</div>" +
                        "<div class=\"layui-col-xs4\">" +
                            "<div class=\"img_fog\">" +
                                "<div class=\"fog_topnum\">" + fog_number + "</div>" +
                            "</div>" +
                        "</div>" +
                        "<div class=\"layui-col-xs4\">" +
                            "<div class=\"img_mobile\">" +
                                "<div class=\"mobile_topnum\">" + mobile_number + "</div>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                    "</td>";

        plan_html += mec_html;
        plan_html += "<td class=\"plan_strategy\">" + strategy + "</td>" +
                        "<td class=\"plan_algo\">" + algos + "</td>" +
                        "<td class=\"plan_opti\">" + optimize_objective + "</td>" +
                        "<td class=\"plan_deadline\">" + deadline + "</td>" +
                        "<td class=\"plan_workflow\">" + xmlFile + "</td>" +
                        "<td class=\"plan_editTime\">" + editTime + "</td>";
        plan_html += "<td class=\"plan_action\">" +
                        "<div class=\"layui-btn-group\">" +
                            "<button type=\"button\" class=\"layui-btn layui-btn-sm btns run_sim\"><i class=\"layui-icon\"></i></button>" +
                            // "<button type=\"button\" class=\"layui-btn layui-btn-sm btns edit_plan\"><i class=\"layui-icon\"></i></button>" +
                            "<button type=\"button\" class=\"layui-btn layui-btn-sm btns del_plan\"><i class=\"layui-icon\"></i></button>" +
                        "</div>";
                     "</td>";
        plan_html +="<td hidden>" + JSON.stringify(plan_value) + "</td>";
        plan_html +="</tr>";

        plan_index++;
    }
    $("#plan_tbody").html(plan_html);

}
//追加plan表格
function appendPlanTable(planJson){
    // console.log(planJson);
    var plan_html = "";
    var plan_index = 4;
    for(var key in planJson){
        var plan_name = key;
        var plan_value = planJson[key];
        // console.log(key);
        // console.log(plan_value);
        // console.log(JSON.stringify(plan_value));

        var mobile_number = plan_value["mobile"];
        var fog_number = plan_value["fogServer"];
        var cloud_number = plan_value["cloudServer"];
        var strategy = plan_value["strategy"];
        var algos = plan_value["alSet"];
        var optimize_objective = plan_value["optimize_objective"];
        var deadline = plan_value["deadline"];
        var workflowType = plan_value["daxPath"];
        var customXml = plan_value["custom"];
        var editTime = plan_value["editTime"];

        // console.log("mobile_number:" + mobile_number);
        // console.log("fog_number:" + fog_number);
        // console.log("cloud_number:" + cloud_number);
        // console.log("strategy:" + strategy);
        // console.log("algos:" + algos);
        // console.log("optimize_objective:" + optimize_objective);
        // console.log("deadline:" + deadline);
        // console.log("workflowType:" + workflowType);
        // console.log("editTime:" + editTime);
        if(strategy == ""){
            strategy = "--";
        }
        if(deadline == ""){
            deadline = "--";
        }
        var xmlFile = "";
        if(customXml == ""){
            xmlFile = workflowType;
        }else{
            xmlFile = customXml;
        }

        plan_html += "<tr>" +
            "<td class=\"plan_no\">" + plan_index + "</td>" +
            "<td class=\"plan_name\">" + plan_name + "</td>";
        var mec_html = "";
        // "<td>" + cloud_number +"--"+ fog_number +"--"+ mobile_number + "</td>"
        mec_html = "<td class=\"plan_mec\">" +
            "<div class=\"layui-row\">" +
            "<div class=\"layui-col-xs4\">" +
            "<div class=\"img_cloud\">" +
            "<div class=\"cloud_topnum\">" + cloud_number + "</div>" +
            "</div>" +
            "</div>" +
            "<div class=\"layui-col-xs4\">" +
            "<div class=\"img_fog\">" +
            "<div class=\"fog_topnum\">" + fog_number + "</div>" +
            "</div>" +
            "</div>" +
            "<div class=\"layui-col-xs4\">" +
            "<div class=\"img_mobile\">" +
            "<div class=\"mobile_topnum\">" + mobile_number + "</div>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</td>";

        plan_html += mec_html;
        plan_html += "<td class=\"plan_strategy\">" + strategy + "</td>" +
            "<td class=\"plan_algo\">" + algos + "</td>" +
            "<td class=\"plan_opti\">" + optimize_objective + "</td>" +
            "<td class=\"plan_deadline\">" + deadline + "</td>" +
            "<td class=\"plan_workflow\">" + xmlFile + "</td>" +
            "<td class=\"plan_editTime\">" + editTime + "</td>";
        plan_html += "<td class=\"plan_action\">" +
            "<div class=\"layui-btn-group\">" +
            "<button type=\"button\" class=\"layui-btn layui-btn-sm btns run_sim\"><i class=\"layui-icon\"></i></button>" +
            // "<button type=\"button\" class=\"layui-btn layui-btn-sm btns edit_plan\"><i class=\"layui-icon\"></i></button>" +
            "<button type=\"button\" class=\"layui-btn layui-btn-sm btns del_plan\"><i class=\"layui-icon\"></i></button>" +
            "</div>";
        "</td>";
        plan_html +="<td hidden>" + JSON.stringify(plan_value) + "</td>";
        plan_html +="</tr>";

        plan_index++;
    }
    $("#plan_tbody").append(plan_html);

}

$(document).ready(function(){
    /*var planA = {"cloudServer":"1","nodeSize":"20","daxPath":"Montage_20.xml","optimize_objective":"Time","mobile":"1","strategy":"","deadline":"","setting_json":{"cloud_mips_list":[1600],"cloud_cost_list":[0.96],"mobile_mips_list":[1000],"cloud_number":1,"fog_cost_list":[0.48],"GA":{"GA-gmax":100,"GA-repeat":1,"GA-popsize":20,"GA-mutationRate":0.01,"GA-crossoverProb":0.8},"fog_number":1,"mobile_number":1,"PSO":{"PSO-c1":1.37,"PSO-w":0.73,"PSO-repeat":1,"PSO-c2":1.37,"PSO-particleNum":20,"PSO-iterateNum":100},"fog_mips_list":[1300]},"fogServer":"1","alSet":["MINMIN"]};
    var planB = {"cloudServer":"1","nodeSize":"20","daxPath":"Montage_20.xml","optimize_objective":"Time","mobile":"1","strategy":"","deadline":"","setting_json":{"cloud_mips_list":[1600],"cloud_cost_list":[0.96],"mobile_mips_list":[1000],"cloud_number":1,"fog_cost_list":[0.48],"GA":{"GA-gmax":100,"GA-repeat":1,"GA-popsize":20,"GA-mutationRate":0.01,"GA-crossoverProb":0.8},"fog_number":1,"mobile_number":1,"PSO":{"PSO-c1":1.37,"PSO-w":0.73,"PSO-repeat":1,"PSO-c2":1.37,"PSO-particleNum":20,"PSO-iterateNum":100},"fog_mips_list":[1300]},"fogServer":"1","alSet":["MINMIN","MAXMIN","FCFS","ROUNDROBIN"]}
    $.cookie("planA", JSON.stringify(planA), { expires: 1});
    $.cookie("planB", JSON.stringify(planB), { expires: 1});

    var A = $.cookie("planA");
    var B = $.cookie("planB");
    console.log(A);
    console.log(B);*/

    //清空cookie
    // console.log($.cookie("plans"));
    $.removeCookie("plan");
    // $.removeCookie("email");
    // $.removeCookie("password");

    var userJson = new Object();
    //获取完整用户信息
    var cookieEmail = $.cookie("email");
    // console.log(cookieEmail == undefined)
    var emailAddress = $("#emailAddress").val();
    if(emailAddress!=""){
        $.cookie("email",emailAddress,{ expires: 1});
    }else{
        if (cookieEmail == "null" || cookieEmail == undefined){
            emailAddress = "";
        }else{
            emailAddress = $.cookie("email");
        }
    }
    // console.log(emailAddress);
    if(emailAddress != ""){
        emailAddress = emailAddress.replace("%20","").replace("%40","@");
        $.cookie("email",emailAddress,{ expires: 7});
        $.ajax({
            url:"/getUser",
            type:"GET",
            data:{"email":emailAddress},
            dataType:"text",
            async:false,
            contentType:"application/json",
            success:function (res) {
                if(res != ""){
                    userJson = eval("("+res+")");
                    // console.log(userJson);

                    var email = userJson["email"];
                    var username = userJson['username'];
                    var xmlfils = eval("("+userJson['xmlfiles']+")");
                    $("#customXmlFile").val(xmlfils);
                    $("#emailAddress").val(email);
                    // console.log(xmlfils);
                    // console.log($("#customXmlFile").val());
                    // $("#customXML").empty();
                    /*for(var i = 0; i < xmlfils.length; i++){
                        debugger
                        console.log(xmlfils[i]);
                        $("#customXML").append('<option value="'+i+'">'+xmlfils[i]+'</option>');

                    }*/

                    //加载MEC表格
                    var plan = userJson['plan'];
                    var planJson = eval("("+ plan +")");
                    loadPlanTable(planJson);

                    $("#username_a").html($("#username_a").html().replace('me',username));
                    $("#userinfo_div").show();
                    $("#login_div").hide();

                }else{
                    // console.log(userJson);
                    // console.log("no user");
                }
            },
            error:function(res){
                layer.msg("Failed to obtain user information!");
            }
        });
    }else{//用户未登录，获取cookie中的plan

    }


    // 底部图标点击链接
    $("#ahu_logo").click(function(){
        window.open("http://www.ahu.edu.cn/");
    });
    $("#deakin_logo").click(function(){
        window.open("http://www.deakin.edu.au/");
    });
    $("#swinburne_logo").click(function(){
        window.open("https://www.swinburne.edu.au/");
    });
    $("#monash_logo").click(function(){
        window.open("https://www.monash.edu/");
    });

    //初始化四个图
    initChart();

    //初始化版本信息
    setVersion();

    //初始化表格
    initTable();


    //添加方案
    $("#plan_add").click(function(){
        var email = $("#emailAddress").val();
        // console.log("ddd");
        // console.log(email);
        if(email == "" || email == undefined || email == null){
            var cookiePlans = $.cookie("plan");
            var cookiePlans_json = eval("("+cookiePlans+")");
            // console.log(cookiePlans);
            if(cookiePlans_json == undefined){
                cookiePlans_json = new Object();
            }
            var len = 0;
            for(var item in cookiePlans_json){
                len++;
            }
            // console.log(len);
            if(len == 3){
                layer.msg("Log in first, Then add more plans!",
                    {icon: 2,offset:['50%', '40%'],time:3000,area:['420px','70px']});
                return false;
            }

        }
        /*var editTime = getCurrentTime();
        console.log(editTime);
        var plan = {"editTime":editTime,"planName":"dr6","pi":[0,1,2,3,4,5],"kmp":[6,7,8,9,10],"levenshtein":[11,12,13,14,15],"selectsort":[16,17,18,19,20],"cloudServer":"1","nodeSize":"20","daxPath":"Montage_20.xml","optimize_objective":"Time","mobile":"1","strategy":"","deadline":"","setting_json":{"cloud_mips_list":[1600],"cloud_cost_list":[0.96],"mobile_mips_list":[1000],"cloud_number":1,"fog_cost_list":[0.48],"GA":{"GA-gmax":100,"GA-repeat":1,"GA-popsize":20,"GA-mutationRate":0.01,"GA-crossoverProb":0.8},"fog_number":1,"mobile_number":1,"PSO":{"PSO-c1":1.37,"PSO-w":0.73,"PSO-repeat":1,"PSO-c2":1.37,"PSO-particleNum":20,"PSO-iterateNum":100},"fog_mips_list":[1300]},"fogServer":"1","alSet":["MINMIN","MAXMIN","FCFS","ROUNDROBIN"]};
        // var plan = {"editTime":editTime,"planName":"dr3","pi":[0,1,2,3,4,5],"kmp":[6,7,8,9,10],"levenshtein":[11,12,13,14,15],"selectsort":[16,17,18,19,20],"cloudServer":"1","nodeSize":"20","daxPath":"Montage_20.xml","optimize_objective":"Time","mobile":"1","strategy":"","deadline":"","setting_json":{"cloud_mips_list":[1600],"cloud_cost_list":[0.96],"mobile_mips_list":[1000],"cloud_number":1,"fog_cost_list":[0.48],"GA":{"GA-gmax":100,"GA-repeat":1,"GA-popsize":20,"GA-mutationRate":0.01,"GA-crossoverProb":0.8},"fog_number":1,"mobile_number":1,"PSO":{"PSO-c1":1.37,"PSO-w":0.73,"PSO-repeat":1,"PSO-c2":1.37,"PSO-particleNum":20,"PSO-iterateNum":100},"fog_mips_list":[1300]},"fogServer":"1","alSet":["MINMIN"]};
        var param = {"email":"dingran1012@163.com","plan":plan};
        console.log("add plan：" + JSON.stringify(param));
        $.ajax({
            type: "POST",
            url: "updatePlan",
            data: {json: JSON.stringify(param)},
            async: true,
            dataType:"text",
            success: function (res) {
                var planJson = eval("("+ res +")");
                loadPlanTable(planJson);
            },
        });*/
        layer.open({
            title: false,
            type: 2,
            zIndex: 0,
            area: ['970px', '520px'],// 宽高
            // shade:0,
            //content: $("#sets"),
            content: "/setMEC",
            offset: "70px",
            cancel: function(){

            }
        });

    });

    //意见按钮
    $(".advices").click(function(){

        var username = userJson['username'];
        if(username == "root"){
            layer.open({
                type: 2
                , offset: "140px"
                , title: "All recommendations"
                , content: "/allRecommendations"
                , skin: 'title-style'
                , area: ['600px', '500px']
                ,cancel: function(){
                    // feedSetting();
                }
            });
        }else{
            layer.open({
                type: 2
                , offset: "140px"
                , title: "Submit recommendations"
                , content: "/recommendations"
                , skin: 'title-style'
                , area: ['600px', '500px']
                ,cancel: function(){
                    // feedSetting();
                }
            });
        }
    });

});

//判断是否在前面加0
function getNow(s) {
    return s < 10 ? '0' + s: s;
}

//获取系统当前时间
function getCurrentTime(){
    var myDate = new Date();

    var year=myDate.getFullYear();      //获取当前年
    var month=myDate.getMonth()+1;      //获取当前月
    var date=myDate.getDate();          //获取当前日


    var h=myDate.getHours();            //获取当前小时数(0-23)
    var m=myDate.getMinutes();          //获取当前分钟数(0-59)
    var s=myDate.getSeconds();          //获取当前秒数(0-59)
    var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);

    return now;
}

//登录
$("#user_login").click(function(){
    layer.open({
        type: 2
        , offset: "140px"
        , title: "Login"
        , content: "/To_login"
        , skin: 'title-style'
        , area: ['600px', '580px']
        ,cancel: function(){
            // feedSetting();
        }
    });
});

// 用户注册
$("#user_register").click(function(){
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

//退出登录
$("#logout").click(function(){
    $.cookie("email",null);
    $.cookie("password",null);
    // console.log("logout");
    window.location.href = "/";
})



//标题栏Document
$("#doc_div").click(function(){
    /*layer.open({
        type: 2,
        offset: "140px",
        title: "Documents",
        content: "/documentsInfo",
        skin: "title-style",
        area: ['700px', '500px'],
        cancel: function(){

        }
    });*/
    window.open("http://127.0.0.1/documentsInfo");
    // window.open("http://47.98.222.243/documentsInfo");
});

//标题栏Developers
$("#developer_div").click(function(){

    layer.open({
        type: 2,
        offset: "140px",
        title: "Developers\' Informations",
        content: "/developersInfo",
        skin: "title-style",
        area: ['700px', '500px'],
        cancel: function(){

        }
    });
});

//标题栏Versions
$("#version_info").click(function(){
    layer.open({
        type: 2,
        offset: "140px",
        title: "Version Informations",
        content: "/versionInfo",
        skin: "title-style",
        area: ['700px', '500px'],
        cancel: function(){

        }
    });
});


//仿真按钮
$("#plan_tbody").on("click", ".run_sim", function(){
    // console.log("run_sim");
    var tr = $(this).parents("tr");
    var json_para = tr.children("td").eq(10).text();
    // console.log("json_para: " + json_para);

    //加载动画
    $("#sim_loading").css("display" , "block");
    var url = "simulation";
    start(url,json_para);
    // $("#sim_loading").css("display" , "none");
});

//编辑按钮
$("#plan_tbody").on("click", ".edit_plan", function(){
   /* console.log("edit_plan");
    var tr = $(this).parents("tr");
    var json_string = tr.children("td").eq(10).text();
    $("#editPlanJson").val(json_string);
    layer.open({
        title: false,
        type: 2,
        zIndex: 0,
        area: ['970px', '520px'],// 宽高
        //content: $("#sets"),
        content: "/setMEC",
        offset: "70px",
        cancel: function(){

        }
    });*/
});

//删除按钮
$("#plan_tbody").on("click", ".del_plan", function(){
    // console.log("del_plan");
    var tr = $(this).parents("tr");
    var plan_td = tr.children("td").eq(10).text();
    var plan = eval("("+plan_td+")");
    // console.log("plan:" + JSON.stringify(plan));

    var email = $("#emailAddress").val();

    if(email == null || email == undefined || email == ""){//用户未登录--删除cookie中的plan
        var planName = plan["planName"];

        var cookiePlans = $.cookie("plan");
        var cookiePlans_json = eval("("+cookiePlans+")");
        delete cookiePlans_json[planName];

        $.cookie("plan",JSON.stringify(cookiePlans_json),{ expires: 1});

        // console.log("cookiePlan:" + $.cookie("plan"));

        $("#flushPlan").click();

    }else{//用户已登录--删除数据库中的plan

        var json_del = {"email":email,"plan":plan};
        // console.log("plan:" + JSON.stringify(plan));
        // console.log("json_del: " + JSON.stringify(json_del));
        var url = "delPlan";
        $.ajax({
            type: "POST",
            url: url,
            data: {json: JSON.stringify(json_del)},
            async: true,
            dataType:"text",
            success: function (res) {
                var planJson = eval("("+ res +")");
                loadPlanTable(planJson);
            },
        });
    }

});

//刷新plan table
$("#flushPlan").click(function(){
    // console.log("flush");
    var email = $("#emailAddress").val();
    if(email == null || email == undefined || email == ""){//用户已登录--查询数据库中的plan
        var html = "";
        var count = 0;
        $("#plan_tbody").find("tr").each(function(){
            if(count >=3){
                $(this).remove();
            }
            count++;
        });

        var plan = $.cookie("plan");
        var planJson = eval("("+ plan +")");
        appendPlanTable(planJson);
    }else{//用户未登录--查询cookie中的plan

        var url = "getPlans";
        $.ajax({
            type: "POST",
            url: url,
            data: {email: email},
            async: true,
            dataType:"text",
            success: function (res) {
                var planJson = eval("("+ res +")");
                loadPlanTable(planJson);
            },
        });
    }

});


// var ajaxbg = $("#background,#progressBar");

function start(url, json_para) {

    $.ajax({
        type: "POST",
        url: url,
        data: {json: json_para},
        async: true,
        dataType:"JSON",
        success: function (res) {
            // console.log(res);
            records = res["outputMap"];
            three_object = res["record"];
            $("#output").empty();
            for (var record in records) {
                $("#output").append("<option value='"+record+"'>"+record+"</option>")
            }

            var pso_time = res["pso_time"];
            var ga_time = res["ga_time"];
            $("#output-time").text("PSO:"+pso_time+"ms GA:"+ga_time+"ms");

            var list = res["record"];
            for (var i=0; i<list.length; i++) {
                var content = list[i];
                if (content[0] == 1) content[0] = 'MINMIN';
                if (content[0] == 2) content[0] = 'MAXMIN';
                if (content[0] == 3) content[0] = 'FCFS';
                if (content[0] == 4) content[0] = 'ROUNDROBIN';
                if (content[0] == 5) content[0] = 'PSO';
                if (content[0] == 6) content[0] = 'GA';
            }

            loadChart();

            loadTable();
            //关闭加载动画
            // ajaxbg.hide();
            $("#sim_loading").css("display" , "none");

            //弹出柱状图
            var head = ['product', 'Time', 'Energy', 'Cost'];
            var list = res["record"];
            var source = [];
            source.push(head);
            for (var i=0; i<list.length; i++) {
                var content = list[i];
                if (content[0] == 1) content[0] = 'MINMIN';
                if (content[0] == 2) content[0] = 'MAXMIN';
                if (content[0] == 3) content[0] = 'FCFS';
                if (content[0] == 4) content[0] = 'ROUNDROBIN';
                if (content[0] == 5) content[0] = 'PSO';
                if (content[0] == 6) content[0] = 'GA';
                source.push(list[i]);
            }

            $("#chart_content").text("");
            $("#chart_content").text(JSON.stringify(source));
            layer.open({
                type: 2
                , offset: "140px"
                , title: "FogWorkflow Simulation Result"
                , content: "/barChart"
                , skin: 'title-style'
                , area: ['1000px', '500px']
                ,cancel: function(){
                    // feedSetting();
                    // ajaxbg.hide();
                }
            });
        },
    });
}

function loadChart(){
    var key = $("#output").val();
    var list = records[key];

    // console.log(three_object);

    //绘制柱状图
    barChart(three_object);

    //绘制饼图
    pieChart(list);

    //绘制折线图
    lineChart(list);

    //绘制甘特图
    ganttChart(list);
}

function loadTable(){
    var key = $("#output").val();
    var outputEntityList = records[key];

    // console.log("key:" + key);
    // console.log(outputEntityList);

    //加载Standby表格
    var html = "";
    for(var i = 0; i < outputEntityList.length; i++){
        var outputEntity = outputEntityList[i];

        var jobId = outputEntity["jobId"];
        var dataCenterId = outputEntity["dataCenterId"];
        var vmId = outputEntity["vmId"];
        var time = outputEntity["time"];
        var cost = outputEntity["cost"];
        var parents = outputEntity["parents"];
        var status = outputEntity["status"];
        var depth = outputEntity["depth"];

        if(status == "SUCCESS"){
            status = '<button class=\'btn_status_success\'></button>';
        }else{
            status = '<button class=\'btn_status_failed\'></button>';
        }

        var realStatus = outputEntity["realStatus"];
        if(realStatus == "FAILED"){
            html += "<tr>";
            html +=     "<td>" + jobId + "</td>";
            html +=     "<td>" + dataCenterId + "</td>";
            html +=     "<td>" + vmId + "</td>";
            html +=     "<td>" + time + "</td>";
            html +=     "<td>" + cost + "</td>";
            html +=     "<td>" + depth + "</td>";
            var temp_parent = '';
            if(i%2 == 0){
                temp_parent = '<td><input class="input_even" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
            }else{
                temp_parent = '<td><input class="input_odd" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
            }
            html += temp_parent;
            html +=     "<td>" + status + "</td>";
            html += "</tr>";
        }


    }
    if(html != ""){
        $("#standby_tbody").html(html);
    }else{
        initStandBy();
    }


    //加载Running表格

    //加载Successed表格
    html = "";
    for(var i = 0; i < outputEntityList.length; i++){
        var outputEntity = outputEntityList[i];

        var jobId = outputEntity["jobId"];
        var dataCenterId = outputEntity["dataCenterId"];
        var vmId = outputEntity["vmId"];
        var realStartTime = outputEntity["realStartTime"];
        var realFinishTime = outputEntity["realFinishTime"];
        var depth = outputEntity["depth"];
        var realTime = outputEntity["realTime"];
        var realCost = outputEntity["realCost"];
        var parents = outputEntity["parents"];
        var realStatus = outputEntity["realStatus"];
        // console.log("realStatus" + realStatus);
        if(realStartTime == undefined){
            realStartTime = "--";
        }
        if(realFinishTime == undefined){
            realFinishTime = "--";
        }
        if(realTime == undefined){
            realTime = "--";
        }
        if(realCost == undefined){
            realCost = "--";
        }

        var realStatus_temp = "";
        if(realStatus == "SUCCESS"){
            realStatus_temp = '<button class=\'btn_status_success\'></button>';
        }else{
            realStatus_temp = '<button class=\'btn_status_failed\'></button>';
        }
        var temp_parent = '';
        if(i%2 == 0){
            temp_parent = '<td><input class="input_even" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }else{
            temp_parent = '<td><input class="input_odd" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }

        if(realStatus == "SUCCESS"){
            html += "<tr>" +
                '<td>'+ jobId +'</td>'+
                '<td>'+ dataCenterId +'</td>'+
                '<td>'+ vmId +'</td>'+
                '<td>'+ realStartTime +'</td>'+
                '<td>'+ realFinishTime +'</td>'+
                '<td>'+ depth +'</td>'+
                '<td>'+ realTime +'</td>'+
                '<td>'+ realCost +'</td>'+
                 temp_parent +
                '<td>'+ realStatus_temp +'</td>'+
                '</tr>';
        }



    }
    if(html != ""){
        $("#successed_tbody").html(html);
    }else{
        initSuccessed();
    }


    //加载Failed表格

    //加载Detail表格
    html = "";
    for(var i = 0; i < outputEntityList.length; i++){
        var outputEntity = outputEntityList[i];

        var jobId = outputEntity["jobId"];
        var taskId = outputEntity["taskId"];
        var status = outputEntity["status"];
        var dataCenterId = outputEntity["dataCenterId"];
        var vmId = outputEntity["vmId"];
        var time = outputEntity["time"];
        var cost = outputEntity["cost"];
        var startTime = outputEntity["startTime"];
        var finishTime = outputEntity["finishTime"];
        var depth = outputEntity["depth"];
        var realTime = outputEntity["realTime"];
        var realCost = outputEntity["realCost"];
        var parents = outputEntity["parents"];
        var realStartTime = outputEntity["realStartTime"];
        var realFinishTime = outputEntity["realFinishTime"];
        var realStatus = outputEntity["realStatus"];

        if(realTime == undefined){
            realTime = "--";
        }
        if(realCost == undefined){
            realCost = "--";
        }
        if(realStartTime == undefined){
            realStartTime = "--";
        }
        if(realFinishTime == undefined){
            realFinishTime = "--";
        }

        if(status == "SUCCESS"){
            status = '<button class=\'btn_status_success\'></button>';
        }else{
            status = '<button class=\'btn_status_failed\'></button>';
        }

        html += '<tr>'+
            '<td class="detail_job">'+ jobId +'</td>'+
            '<td class="detail_task">'+ taskId +'</td>'+
            '<td class="detail_simStus">'+ status +'</td>'+
            '<td class="detail_resource">'+ dataCenterId +'</td>'+
            '<td class="detail_vm">'+ vmId +'</td>'+
            '<td class="detail_simTime">'+ time +'</td>'+
            '<td class="detail_simCost">'+ cost +'</td>' +
            '<td class="detail_start">'+ realStartTime +'</td>'+
            '<td class="detail_finish">'+ realFinishTime +'</td>'+
            '<td class="detail_depth">'+ depth +'</td>'+
            '<td class="detail_realTime">'+ realTime +'</td>' +
            '<td class="detail_realCost">'+ realCost +'</td>';

        var temp_parent = '';
        if(i%2 == 0){
            temp_parent = '<td class="detail_parents"><input class="input_even" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }else{
            temp_parent = '<td class="detail_parents"><input class="input_odd" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
        }
        html += temp_parent;

        var temp_realStatus = '';
        if(realStatus == "FAILED"){
            temp_realStatus = "<td class=\"detail_realStus\"><button class='btn_status_failed'></button></td>";
        }else{
            temp_realStatus = "<td class=\"detail_realStus\"><button class='btn_status_success'></button></td>";
        }
        html += temp_realStatus;

        html += '</tr>';
    }
    $("#detail_tbody").html(html);

    /*layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#detailTable'
            ,url:'/jsonFile/detailJson.json'
            ,toolbar: true
            ,title: '用户数据表'
            ,totalRow: true
            ,cols: [[
                {field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true, totalRowText: '合计行'}
                ,{field:'username', title:'用户名', width:120, edit: 'text'}
                ,{field:'email', title:'邮箱', width:150, edit: 'text'}
                ,{field:'experience', title:'积分', width:100, sort: true, totalRow: true}
                ,{field:'sex', title:'性别', width:80, edit: 'text', sort: true}
                ,{field:'logins', title:'登入次数', width:100, sort: true, totalRow: true}
                ,{field:'sign', title:'签名'}
                ,{field:'city', title:'城市', width:100}
                ,{field:'ip', title:'IP', width:120}
                ,{field:'joinTime', title:'加入时间', width:120}
            ]]
            ,page: true
            ,response: {
                statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
            }
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.status, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.total, //解析数据长度
                    "data": res.rows.item //解析数据列表
                };
            }
        });
    });*/

}

// output改变事件
$("#output").change(function () {
    var flag = false;
    $(".tr-line").each(function(){
        var text = $(this).find("td:first").text();
        if(text == ""|| text ==null){
            flag = true;
            return false;
        }
    });
    if(!flag){
        loadChart();
        loadTable();
    }
});


//Real Enviorment按钮
$("#realOperate").click(function(){

    // 判断是否存在仿真数据
    var text = $("#detail_tbody").find("tr:first").find("td:first").text();
    if(text == "" || text == null){
        layer.msg("There is no simulation data , Please simulate first!",
            {icon: 2,offset:['50%', '40%'],time:3000,area:['420px','70px']});
        return false;
    }

    //设置进度条
    // layui.use('element', function(){
    //     var $ = layui.jquery
    //         ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    //
    //     //触发事件
    //     var active = {
    //         loading: function(othis){
    //             var DISABLED = 'layui-btn-disabled';
    //             if(othis.hasClass(DISABLED)) return;
    //
    //             //模拟loading
    //             var n = 0, timer = setInterval(function(){
    //                 n = n + Math.random()*10|0;
    //                 if(n>100){
    //                     n = 100;
    //                     clearInterval(timer);
    //                     othis.removeClass(DISABLED);
    //                 }
    //                 element.progress('demo', n+'%');
    //             }, 300+Math.random()*1000);
    //
    //             othis.addClass(DISABLED);
    //         }
    //     };
    //
    //     $('.site-demo-active').on('click', function(){
    //         var othis = $(this), type = $(this).data('type');
    //         active[type] ? active[type].call(this, othis) : '';
    //     });
    // });

    var key = $("#output").val();
    var list = records[key];

    //定时执行单个任务

    var list_real = [];
    var currentIndex = 0;
    var realTimeClData;
    var detail_tbody = $("#detail_tbody");
    var td_realTime = new Object();
    var td_realCost = new Object();
    var td_realStartTime = new Object();
    var td_realFinishTime = new Object();
    var td_realStatus_btn = new Object();


    //禁用Real Enviorment按钮
    var DISABLED = 'layui-btn-disabled';
    $("#realOperate").addClass(DISABLED);
    //显示进度条
    $(".output_progress").css("display","block");

    $("#successed_tbody").html("");
    realTimeClData = setInterval(function(){
        var outputEntity = list[currentIndex];
        var jobId = outputEntity['jobId'];

        /*$("#standby_tbody").find("tr:odd").each(function(){
            var input = $(this).children("td").eq(6).find("input");
            input.attr("class", "input_odd");
            $(this).attr("background-color", "#ffffff");
        });
        $("#standby_tbody").find("tr:even").each(function(){
            console.log("even");
            var input = $(this).children("td").eq(6).find("input");
            input.attr("class", "input_even");
            $(this).attr("background-color", "#f2f2f2");
        });*/

        //standby中移除对象
        var html = "";

        var input_background = "";
        $("#standby_tbody").find("tr").each(function(){

            var jobId_td = $(this).children("td").eq(0).text();
            var input = $(this).children("td").eq(6).find("input");
            var trSeq = $(this).parent().find("tr").index($(this)[0]);

            // if(trSeq%2 == 0){
            //     $(this).css("background-color", "#FFFFFF");
            //     input.attr("class", "input_even");
            // }else{
            //     $(this).css("background-color", "#F2F2F2");
            //     input.attr("class","input_odd");
            // }
            if(jobId == jobId_td){
                $(this).remove();

                //running添加对象
                var dataCenterId = outputEntity["dataCenterId"];
                var vmId = outputEntity["vmId"];
                var realStartTime = outputEntity["realStartTime"];
                var realFinishTime = outputEntity["realFinishTime"];
                var depth = outputEntity["depth"];
                var realTime = outputEntity["realTime"];
                var realCost = outputEntity["realCost"];
                var parents = outputEntity["parents"];
                var realStatus = outputEntity["realStatus"];
                // console.log("realStatus" + realStatus);
                if(realStartTime == undefined){
                    realStartTime = "--";
                }
                if(realFinishTime == undefined){
                    realFinishTime = "--";
                }
                if(realTime == undefined){
                    realTime = "--";
                }
                if(realCost == undefined){
                    realCost = "--";
                }

                var realStatus_temp = "";
                if(realStatus == "SUCCESS"){
                    realStatus_temp = '<button class=\'btn_status_success\'></button>';
                }else{
                    realStatus_temp = '<button class=\'btn_status_failed\'></button>';
                }
                var temp_parent = '<td><input class="input_even" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';

                html += "<tr>" +
                    '<td>'+ jobId +'</td>'+
                    '<td>'+ dataCenterId +'</td>'+
                    '<td>'+ vmId +'</td>'+
                    '<td>'+ realStartTime +'</td>'+
                    '<td>'+ realFinishTime +'</td>'+
                    '<td>'+ depth +'</td>'+
                    '<td>'+ realTime +'</td>'+
                    '<td>'+ realCost +'</td>'+
                    temp_parent +
                    '<td>'+ realStatus_temp +'</td>'+
                    '</tr>';

                var html_standby = '';
                html_standby += '<tr>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>';

                var temp = '';
                if(currentIndex%2 == 0){
                    temp = '<td><input class="input_even" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
                }else{
                    temp = '<td><input class="input_odd" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
                }
                html_standby += temp;
                html_standby += '<td></td>';
                html_standby += '</tr>';
                $("#standby_tbody").append(html_standby);
            }

            //设置standby的input背景色
            input_background = $(this).css("background-color");
            if(input_background == "rgb(242, 242, 242)"){
                input_background = "rgb(0, 0, 0, 0)";
            }else{
                input_background = "rgb(242, 242, 242)";
            }
            input.css("background-color", input_background);
            for (var i = 1; i < 10; i++) {
                html += '<tr>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>'+
                    '<td></td>';

                var temp = '';
                if(i%2 == 0){
                    temp = '<td><input class="input_even" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
                }else{
                    temp = '<td><input class="input_odd" value="" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
                }
                html += temp;
                html += '<td></td>';
                html += '</tr>';
            }
        });
        $("#running_tbody").html(html);



        // console.log("currentIndex:" + currentIndex);
        detail_tbody.find("tr").each(function(){
            var jobId_td = $(this).children("td").eq(0).text();
            if(jobId == jobId_td){
                var tr_current = $(this);
                td_realStartTime = tr_current.children("td").eq(7);
                td_realFinishTime = tr_current.children("td").eq(8);
                td_realTime = tr_current.children("td").eq(10);
                td_realCost = tr_current.children("td").eq(11);
                td_realStatus_btn = tr_current.children("td").eq(13).find("button");

            }
        });

        //设置进度条

        /*var progress_per = '';
        progress_per = ((currentIndex + 1)/(list.length)).toFixed(2);
        console.log(progress_per);
        progress_per = progress_per * 100 + "%";
        console.log(progress_per);
        layui.use('element', function(){
            var $ = layui.jquery;
            var element = layui.element;
            element.progress('realProgress', progress_per);

        });*/
        var progress_per = '';
        progress_per = ((currentIndex + 1)/(list.length))*100;
        progress_per = progress_per.toFixed(2);
        // console.log(progress_per);
        $("#real_loading").css("display" , "block");
        $("#operate_percent").text("Complete Percent: " + progress_per + "%");

        $.ajax({
            type: "POST",
            url: "/realOperate",
            data:JSON.stringify(outputEntity),
            dataType: "text",
            async: false,
            contentType:"application/json",
            success: function (res) {
                currentIndex++;

                // console.log(res);
                var res_obj = eval("("+res+")");
                var real_item = res_obj["real_outputEntity"];
                list_real.push(real_item);
                var jobId = real_item["jobId"];
                var realTime = real_item["realTime"];
                var realCost = real_item["realCost"];
                var realStartTime = real_item["realStartTime"];
                var realFinishTime = real_item["realFinishTime"];

                td_realStartTime.text(realStartTime);
                td_realFinishTime.text(realFinishTime);
                td_realCost.text(realCost);
                td_realTime.text(realTime);
                td_realStatus_btn.removeClass("btn_status_failed");
                td_realStatus_btn.addClass("btn_status_success");

                var vmId = real_item["vmId"];
                var depth = real_item["depth"];
                var parents = real_item["parents"];
                var realStatus = real_item["realStatus"];
                var dataCenterId = real_item["dataCenterId"];


                if(realStartTime == undefined){
                    realStartTime = "--";
                }
                if(realFinishTime == undefined){
                    realFinishTime = "--";
                }
                if(realTime == undefined){
                    realTime = "--";
                }
                if(realCost == undefined){
                    realCost = "--";
                }

                var realStatus_temp = "";
                if(realStatus == "SUCCESS"){
                    realStatus_temp = '<button class=\'btn_status_success\'></button>';
                }else{
                    realStatus_temp = '<button class=\'btn_status_failed\'></button>';
                }

                var temp_parent = "";
                if(currentIndex%2 != 0){
                    temp_parent = '<td><input class="input_even" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
                }else{
                    temp_parent = '<td><input class="input_odd" value="'+ parents +'" onblur="parents_blur(this)" onfocus="parents_focus(this)"></td>';
                }
                var successed_tbody = $("#successed_tbody");
                var success_html = "";
                success_html += "<tr>" +
                    '<td>'+ jobId +'</td>'+
                    '<td>'+ dataCenterId +'</td>'+
                    '<td>'+ vmId +'</td>'+
                    '<td>'+ realStartTime +'</td>'+
                    '<td>'+ realFinishTime +'</td>'+
                    '<td>'+ depth +'</td>'+
                    '<td>'+ realTime +'</td>'+
                    '<td>'+ realCost +'</td>'+
                    temp_parent +
                    '<td>'+ realStatus_temp +'</td>'+
                    '</tr>';
                successed_tbody.append(success_html);

                //执行成功取消定时器
                if(currentIndex == (list.length)){
                    console.log("cleartimedata");
                    clearInterval(realTimeClData);

                    //加载表格
                    loadTable();
                    //清空running表格
                    initRunning();
                    //清空standby表格
                    initStandBy();
                    //解除Real Enviorment禁用
                    $("#realOperate").removeClass(DISABLED);
                    //隐藏进度条
                    // layui.use('element', function(){
                    //     var $ = layui.jquery;
                    //     var element = layui.element;
                    //     element.progress('realProgress', "0%");
                    //
                    // });
                    // $(".output_progress").css("display","none");
                    $("#real_loading").css("display" , "none");
                    $("#operate_percent").text("");

                    //重新绘制四个状态图
                    getRealThreeObject(key , list_real);
                    pieChart(list_real);
                    lineChart(list_real);
                    ganttChart(list_real);

                }

            },
            error: function(data){
                console.log("error...");
                currentIndex++;
            }
        });
    },2000);

    records[key] = list_real;

    return;
    // console.log(records);
    // console.log("list:" + list);


});

/*$("#test").click(function(){



});*/

$("#showDag").click(function(){
    var dagParam = $("#dagParam").val();
    // console.log(dagParam);
    layer.open({
        title: "Show DAG",
        type: 2,
        zIndex: 0,
        area: ['960px', '800px'],// 宽高
        shade:0,
        content: "/showDag",
        offset: ["70px","70px"],
        cancel: function(){

        }
    });

});





//获取真实环境中执行的总时间，能耗，成本
function getRealThreeObject(key , listReal){
    // console.log(listReal);
    var count = listReal.length;
    var outputJson = new Object();
    outputJson['count'] = count;
    for(var i = 0 ; i < listReal.length ; i++){
        var outputEntity = listReal[i];
        var outputItem = new Object();
        outputItem.jobId = outputEntity["jobId"];
        outputItem.taskId = outputEntity["taskId"];
        outputItem.status = outputEntity["status"];
        outputItem.dataCenterId = outputEntity["dataCenterId"];
        outputItem.vmId = outputEntity["vmId"];
        outputItem.time = outputEntity["time"];
        outputItem.startTime = outputEntity["startTime"];
        outputItem.finishTime = outputEntity["finishTime"];
        outputItem.depth = outputEntity["depth"];
        outputItem.cost = outputEntity["cost"];
        outputItem.parents = outputEntity["parents"];
        outputItem.realTime = outputEntity["realTime"];
        outputItem.realCost = outputEntity["realCost"];
        outputItem.workLoad = outputEntity["workLoad"];
        outputJson[i] = outputItem;
    }

    var realTotalTime;
    var realTotalCost;
    var mobileTotalEnergy;

    $.ajax({
        type: "POST",
        url: "/getRealTotal",
        data: JSON.stringify(outputJson),
        dataType: "text",
        async: false,
        contentType:"application/json",
        success: function (data) {
            // console.log(data);
            var totalThree = eval("("+data+")");
            realTotalTime = totalThree['realTotalTime'];
            realTotalCost = totalThree['realTotalCost'];
            mobileTotalEnergy = totalThree['mobileTotalEnergy'];
            if(realTotalTime == 0){
                realTotalTime = 1;
            }
            if(realTotalCost == 0){
                realTotalCost = 1;
            }
            if(mobileTotalEnergy == 0){
                mobileTotalEnergy = 1;
            }
            // console.log(data);
        },
        error: function(data){
            console.log("error...");
        }
    });
    // console.log(key);
    // console.log(three_object);
    for(var i = 0 ; i < three_object.length ; i++){
        var record = three_object[i];
        if(key.indexOf(record[0]) >= 0){
            record[4] = realTotalTime;
            record[5] = mobileTotalEnergy;
            record[6] = realTotalCost;
        }
        // console.log(record);
    }
    barChart(three_object);
}

function parents_blur(obj){
    if(obj.className.indexOf("input_even")){
        // console.log(obj.className);
        obj.className = "input_odd";
    }
    else{
        obj.className = "input_even";
    }
}
function parents_focus(obj){
    obj.className += ' input_border';
}




