<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FogWorkflowSim</title>
    <meta charset="utf-8">
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <link rel="stylesheet" href="/css/chart.css">
</head>
<body>
<div id="main" style="width: 900px;height:400px;"></div>
<script src="/echarts/echarts.min.js"></script>
<script>
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    var data = parent.$("#chart_content").text();
    // console.log("data:" + data);
    var json = eval("("+data+")");
    // console.log(json);
    // var source = JSON.parse(json);
    // console.log(source);

    // 指定图表的配置项和数据
    var option = {
        legend: {},
        tooltip: {},
        dataset: {
            source: json
        },
        xAxis: {
            type: 'category',
            name: 'Algorithms',
        },
        yAxis: {},
        // Declare several bar series, each will be mapped
        // to a column of dataset.source by default.
        series: [
            {type: 'bar'},
            {type: 'bar'},
            {type: 'bar'}
        ]
    };


    //-------------------------------------------------------------------
    /*var record_double = parent.$("#chart_doubleContent").text();
    console.log("record_double:" + record_double);
    var obj_res = eval("("+ record_double +")");

    var count = obj_res.length;
    console.log(obj_res.length);
    // console.log("obj_res:" + obj_res);
    var x_data = [];
    var y_data = [];
    var y1_data = [];
    for(var i = 0; i < count; i++){
        x_data.push('Time');
        x_data.push('Energy');
        x_data.push('Cost');

        var item = obj_res[i];
        y_data.push(item[1]);
        y_data.push(item[2]);
        y_data.push(item[3]);

        y1_data.push(item[4]);
        y1_data.push(item[5]);
        y1_data.push(item[6]);
    }
    console.log(x_data);
    console.log(y_data);
    console.log(y1_data);

    let data = {
        // xData: ['Time', 'Energy', 'Cost', 'Time', 'Energy', 'Cost', 'Time', 'Energy', 'Cost', 'Time', 'Energy', 'Cost'],
        // yData: [10, 15, 18, 25, 23, 32, 33, 36, 57, 72, 45, 45],
        // y1Data: [20, 50, 80, 50, 30, 50, 60, 60, 70, 90, 50, 50]
        xData: x_data,
        yData: y_data,
        y1Data: y1_data

    }
    /!**
     双X轴标签对应，伪实现思路：
     底部的标签也是柱状图，对应包含的区域为上方X轴条数占总数的比例，设为宽度即可
     *!/
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        title: {
            text: "总体对比",
            textStyle: {
                fontSize: 24
            },
            left: '40%'
        },
        legend: {
            top: 50,
            right: 80,
            data: ['sim', 'real']
        },
        grid: [
            {
                top: 100,
                bottom: 101
            },
            {
                height: 60,
                bottom: 40
            }
        ],
        xAxis: [{
            type: 'category',
            data: data.xData,
            gridIndex: 0,
            axisLabel: {
                color: '#333'
            },
            axisLine: {
                lineStyle: {
                    color: '#e7e7e7'
                }
            },
            axisTick: {
                lineStyle: {
                    color: '#e7e7e7'
                }
            },
            zlevel: 2
        }, {
            type: 'category',
            gridIndex: 1,
            axisLine: {
                show: false
            },
            zlevel: 1
        }],
        yAxis: [{
            type: 'value',
            gridIndex: 0,
            axisLabel: {
                color: '#333'
            },
            splitLine: {
                lineStyle: {
                    type: 'dashed'
                }
            },
            axisLine: {
                lineStyle: {
                    color: '#ccc'
                }
            },
            axisTick: {
                lineStyle: {
                    color: '#ccc'
                }
            }
        },{
            type: 'value',
            gridIndex: 1,
            axisLabel: {
                show: false
            },
            axisLine: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisTick: {
                show: false
            }
        }],
        series: [{
            name: 'sim',
            data: data.yData,
            type: 'bar',
            label: {
                show: false,
                position: 'top',
                textStyle: {
                    color: '#555'
                }
            },
            itemStyle: {
                normal: {
                    color: (params) => {
                    let colors = ['#b6c2ff', '#96edc1', '#fcb75b', '#b6c2ff', '#96edc1', '#fcb75b','#b6c2ff', '#96edc1', '#fcb75b','#b6c2ff', '#96edc1', '#fcb75b']
                    return colors[params.dataIndex]
                }
            }
        },
        xAxisIndex: 0,
        yAxisIndex: 0
    },{
        name: 'real',
            data: data.y1Data,
            type: 'bar',
            label: {
            show: false,
                position: 'top',
                textStyle: {
                color: '#555'
            }
        },
        itemStyle: {
            normal: {
                color: (params) => {
                    let colors = ['#4150d8', '#28bf7e', '#ed7c2f', '#4150d8', '#28bf7e', '#ed7c2f', '#4150d8', '#28bf7e', '#ed7c2f', '#4150d8', '#28bf7e', '#ed7c2f']
                    return colors[params.dataIndex]
                }
            }
        },
        xAxisIndex: 0,
            yAxisIndex: 0
    },{
        data: [{
            name: 'MINMIN',
            value: 1
        }],
            label: {
            show: true,
                position: 'inside',
                formatter: '{b}',
                offset: [0, 10],
                textStyle: {
                color: '#777'
            }
        },
        type: 'bar',
            barGap: 0,
            barWidth: '33%',
            itemStyle: {
            normal: {
                color: 'rgba(134,176,237, .5)'
            }
        },
        xAxisIndex: 1,
        yAxisIndex: 1
    },{
        data: [{
            name: 'MAXMIN',
            value: 1
        }],
            label: {
            show: true,
                position: 'inside',
                formatter: '{b}',
                offset: [0, 10],
                textStyle: {
                color: '#777'
            }
        },
        type: 'bar',
            barGap: 0,
            barWidth: '33%',
            itemStyle: {
            normal: {
                color: 'rgba(40,191,126, .5)'
            }
        },
        xAxisIndex: 1,
            yAxisIndex: 1
    },{
        data: [{
            name: 'FCFS',
            value: 1
        }],
            label: {
            show: true,
                position: 'inside',
                formatter: '{b}',
                offset: [0, 10],
                textStyle: {
                color: '#777'
            }
        },
        type: 'bar',
            barGap: 0,
            barWidth: '33%',
            itemStyle: {
            normal: {
                color: 'rgba(237,124,47, .5)'
            }
        },
        xAxisIndex: 1,
        yAxisIndex: 1
    },{
        data: [{
            name: 'ROUDROBIN',
            value: 1
        }],
            label: {
            show: true,
                position: 'inside',
                formatter: '{b}',
                offset: [0, 10],
                textStyle: {
                color: '#777'
            }
        },
        type: 'bar',
            barGap: 0,
            barWidth: '25%',
            itemStyle: {
            normal: {
                color: 'rgba(242,169,59, .5)'
            }
        },
        xAxisIndex: 1,
        yAxisIndex: 1
    }]
    };

    var series = option["series"];
    var width_per = 1/count;
    console.log("width_per:" + width_per);
    for(var i = 0; i < count ; i++ ){
        var series_item = "";
        var algo_name = '';
        var item = obj_res[i];
        if (item[0] == 1) algo_name = 'MINMIN';
        if (item[0] == 2) algo_name = 'MAXMIN';
        if (item[0] == 3) algo_name = 'FCFS';
        if (item[0] == 4) algo_name = 'ROUNDROBIN';
        if (item[0] == 5) algo_name = 'PSO';
        if (item[0] == 6) algo_name = 'GA';
        series_item = {
            data: [{
                name: algo_name,
                value: 1
            }],
            label: {
                show: true,
                position: 'inside',
                formatter: '{b}',
                offset: [0, 10],
                textStyle: {
                    color: '#777'
                }
            },
            type: 'bar',
            barGap: 0,
            barWidth: width_per,
            itemStyle: {
                normal: {
                    color: 'rgba(242,169,59, .5)'
                }
            },
            xAxisIndex: 1,
            yAxisIndex: 1
        }
        series.push(series_item);
    }
    console.log(series);*/


    //-------------------------------------------------------------------

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>
