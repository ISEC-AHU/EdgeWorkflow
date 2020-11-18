<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html>
<head>
    <title>FogWorkflow</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/images/ahu_logo.png">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>
<%--------------------------标题栏开始------------------------------%>
<div class="layui-container title_main">
    <div class="layui-row">
        <div class="layui-col-xs4">
            <div class="logo_div"><img src="/images/edge_logo.png" class="edge_img"></div>
        </div>
        <div class="layui-col-xs1">
            <div id="doc_div" class="doc_div">Document</div>
        </div>
        <div class="layui-col-xs2">
            <div id="developer_div" class="developer_div" >Developers</div>
        </div>
        <div class="layui-col-xs2">
            <div id="version_info" class="version_info">Versions</div>
        </div>

        <div class="layui-col-xs3">
            <div id="login_div" class="buttons">
                <div class="layui-btn-group">
                    <button id="user_login" type="button" class="layui-btn layui-btn-radius layui-btn-primary">Login </button>
                    <button id="user_register" type="button" class="layui-btn layui-btn-radius layui-btn-primary">Register</button>
                </div>
            </div>

            <div id="userinfo_div" hidden>
                <ul class="layui-nav" style="background-color: #FFFFFF">
                    <li class="layui-nav-item">
                        <a id="username_a"><img src="/images/userlogo.jpg" class="layui-nav-img">me</a>
                        <dl class="layui-nav-child">
                            <dd><a  id="logout" href="javascript:;">Logout</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>



    </div>
</div>
<%--------------------------标题栏结束------------------------------%>

<%--------------------------自定义方案表格开始------------------------------%>
<div class="layui-container plan_main">
    <div class="layui-row">
        <%--标题--%>
        <div class="layui-col-xs10">
            <div class="plan_title" style="display: inline-block">
                Scientific Workflow & EC Environment Setting
            </div>
            <div id="sim_loading_div" style="display: inline-block">
                <i id="sim_loading" class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop"></i>
            </div>
        </div>

        <div class="layui-col-xs2">
            <button id="plan_add" class="layui-btn layui-btn-radius">
                Add +
            </button>
        </div>
        <%--表格--%>
        <div class="layui-col-xs12 layui-row plan_padding">
            <div class="layui-col-xs12">
                <table id="plan_table1" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                    <thead>
                        <th class="plan_no">No.</th>
                        <th class="plan_name">Project Name</th>
                        <th class="plan_mec">EC Environment</th>
                        <th class="plan_strategy">Offloading Strategy</th>
                        <th class="plan_algo">Scheduling Algorithm</th>
                        <th class="plan_opti">Optimization Object</th>
                        <th class="plan_deadline">Deadline</th>
                        <th class="plan_workflow">Workflow Type</th>
                        <th class="plan_editTime">Last Modified</th>
                        <th class="plan_action">Action</th>
                    </thead>
                </table>
            </div>
            <div class="layui-col-xs12 plan_data_div">
                <table id="plan_table2" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                    <thead hidden>
                        <th>No.</th>
                        <th>Plan Name</th>
                        <th>EC Environment</th>
                        <th>Offloading Strategy</th>
                        <th>Scheduling Algorithm</th>
                        <th>Optimization Object</th>
                        <th>Deadline</th>
                        <th>Workflow Type</th>
                        <th>Last Modified</th>
                        <th>Ation</th>
                    </thead>
                    <tbody id="plan_tbody" class="plan_tbody">
                        <tr>
                            <td class="plan_no">1</td>
                            <td class="plan_name">example1</td>
                            <td class="plan_mec">
                                <div class="layui-row">
                                    <div class="layui-col-xs4">
                                        <div class="img_cloud">
                                            <div class="cloud_topnum">1</div>
                                        </div>
                                    </div>
                                    <div class="layui-col-xs4">
                                        <div class="img_fog">
                                            <div class="fog_topnum">1</div>
                                        </div>
                                    </div>
                                    <div class="layui-col-xs4">
                                        <div class="img_mobile">
                                            <div class="mobile_topnum">1</div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="plan_strategy">simple</td>
                            <td class="plan_algo">MINMIN,MAXMIN,FCFS,ROUNDROBIN</td>
                            <td class="plan_opti">Time</td>
                            <td class="plan_deadline">--</td>
                            <td class="plan_workflow">Montage_20.xml</td>
                            <td class="plan_editTime">2020-11-05 10:30:53</td>
                            <td class="plan_action">
                                <div class="layui-btn-group">
                                    <button type="button" class="layui-btn layui-btn-sm btns run_sim"><i class="layui-icon"></i></button>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns edit_plan"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns del_plan"><i class="layui-icon"></i></button>--%>
                                </div>
                            </td>
                            <td hidden>
                                {"nodeSize":"20","daxPath":"Montage_20.xml","planName":"example1","custom":"","pi":[],"kmp":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"],"levenshtein":[],"selectsort":[],"cloudServer":1,"fogServer":1,"mobile":1,"setting_json":{"cloud_mips_list":[1600],"cloud_cost_list":[0.96],"fog_mips_list":[1300],"fog_cost_list":[0.48],"mobile_mips_list":[1000],"cloud_number":1,"fog_number":1,"mobile_number":1,"GA":{"GA-popsize":20,"GA-gmax":100,"GA-crossoverProb":0.8,"GA-mutationRate":0.01,"GA-repeat":1},"PSO":{"PSO-particleNum":20,"PSO-iterateNum":100,"PSO-c1":1.37,"PSO-c2":1.37,"PSO-w":0.73,"PSO-repeat":1}},"strategy":"","alSet":["MINMIN","MAXMIN","FCFS","ROUNDROBIN"],"optimize_objective":"Time","deadline":"","editTime":"2020-11-06 10:42:01"}
                                    <%--{"nodeSize":"100","daxPath":"Epigenomics_100.xml","planName":"ddd","custom":"","pi":[],"kmp":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],"levenshtein":[],"selectsort":[],"cloudServer":2,"fogServer":3,"mobile":2,"setting_json":{"cloud_mips_list":[1600,1600],"cloud_cost_list":[0.96,0.96],"fog_mips_list":[1300,1300,1300],"fog_cost_list":[0.48,0.48,0.48],"mobile_mips_list":[1000,1000],"cloud_number":2,"fog_number":3,"mobile_number":2,"GA":{"GA-popsize":20,"GA-gmax":100,"GA-crossoverProb":0.8,"GA-mutationRate":0.01,"GA-repeat":1},"PSO":{"PSO-particleNum":20,"PSO-iterateNum":100,"PSO-c1":1.37,"PSO-c2":1.37,"PSO-w":0.73,"PSO-repeat":1}},"strategy":"All-in-Cloud","alSet":["PSO","GA"],"optimize_objective":"Energy","deadline":"12","editTime":"2020-11-06 16:14:03"}--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="plan_no">2</td>
                            <td class="plan_name">example2</td>
                            <td class="plan_mec">
                                <div class="layui-row">
                                    <div class="layui-col-xs4">
                                        <div class="img_cloud">
                                            <div class="cloud_topnum">2</div>
                                        </div>
                                    </div>
                                    <div class="layui-col-xs4">
                                        <div class="img_fog">
                                            <div class="fog_topnum">3</div>
                                        </div>
                                    </div>
                                    <div class="layui-col-xs4">
                                        <div class="img_mobile">
                                            <div class="mobile_topnum">2</div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="plan_strategy">simple</td>
                            <td class="plan_algo">MINMIN,MAXMIN</td>
                            <td class="plan_opti">Time</td>
                            <td class="plan_deadline">--</td>
                            <td class="plan_workflow">CyberShake_30.xml</td>
                            <td class="plan_editTime">2020-11-05 11:01:53</td>
                            <td class="plan_action">
                                <div class="layui-btn-group">
                                    <button type="button" class="layui-btn layui-btn-sm btns run_sim"><i class="layui-icon"></i></button>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns edit_plan"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns del_plan"><i class="layui-icon"></i></button>--%>
                                </div>
                            </td>
                            <td hidden>
                                {"nodeSize":"30","daxPath":"CyberShake_30.xml","planName":"example2","custom":"","pi":[],"kmp":[],"levenshtein":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"],"selectsort":[],"cloudServer":2,"fogServer":3,"mobile":2,"setting_json":{"cloud_mips_list":[1600,1600],"cloud_cost_list":[0.96,0.96],"fog_mips_list":[1300,1300,1300],"fog_cost_list":[0.48,0.48,0.48],"mobile_mips_list":[1000,1000],"cloud_number":2,"fog_number":3,"mobile_number":2,"GA":{"GA-popsize":20,"GA-gmax":100,"GA-crossoverProb":0.8,"GA-mutationRate":0.01,"GA-repeat":1},"PSO":{"PSO-particleNum":20,"PSO-iterateNum":100,"PSO-c1":1.37,"PSO-c2":1.37,"PSO-w":0.73,"PSO-repeat":1}},"strategy":"","alSet":["MINMIN","MAXMIN"],"optimize_objective":"Time","deadline":"","editTime":"2020-11-06 10:46:39"}
                            </td>
                        </tr>
                        <tr>
                            <td class="plan_no">3</td>
                            <td class="plan_name">example3</td>
                            <td class="plan_mec">
                                <div class="layui-row">
                                    <div class="layui-col-xs4">
                                        <div class="img_cloud">
                                            <div class="cloud_topnum">1</div>
                                        </div>
                                    </div>
                                    <div class="layui-col-xs4">
                                        <div class="img_fog">
                                            <div class="fog_topnum">1</div>
                                        </div>
                                    </div>
                                    <div class="layui-col-xs4">
                                        <div class="img_mobile">
                                            <div class="mobile_topnum">2</div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="plan_strategy">simple</td>
                            <td class="plan_algo">MINMIN,MAXMIN,PSO</td>
                            <td class="plan_opti">Time</td>
                            <td class="plan_deadline">--</td>
                            <td class="plan_workflow">Epigenomics_24.xml</td>
                            <td class="plan_editTime">2020-11-05 11:01:53</td>
                            <td class="plan_action">
                                <div class="layui-btn-group">
                                    <button type="button" class="layui-btn layui-btn-sm btns run_sim"><i class="layui-icon"></i></button>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns run_sim">Simulation</button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns del_plan">Delete</button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns edit_plan"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns del_plan"><i class="layui-icon"></i></button>--%>
                                </div>
                            </td>
                            <td hidden>
                                {"nodeSize":"24","daxPath":"Epigenomics_24.xml","planName":"example3","custom":"","pi":[],"kmp":[],"levenshtein":[],"selectsort":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"],"cloudServer":1,"fogServer":1,"mobile":2,"setting_json":{"cloud_mips_list":[1600],"cloud_cost_list":[0.96],"fog_mips_list":[1300],"fog_cost_list":[0.48],"mobile_mips_list":[1000,1000],"cloud_number":1,"fog_number":1,"mobile_number":2,"GA":{"GA-popsize":20,"GA-gmax":100,"GA-crossoverProb":0.8,"GA-mutationRate":0.01,"GA-repeat":1},"PSO":{"PSO-particleNum":20,"PSO-iterateNum":100,"PSO-c1":1.37,"PSO-c2":1.37,"PSO-w":0.73,"PSO-repeat":1}},"strategy":"Simple","alSet":["MINMIN","MAXMIN","PSO"],"optimize_objective":"Time","deadline":"","editTime":"2020-11-06 10:51:39"}
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <%--<div class="layui-btn-group">--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns run_sim"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns edit_plan"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns del_plan"><i class="layui-icon"></i></button>--%>
                                <%--</div>--%>
                            </td>
                            <td hidden></td>
                        </tr>
                        <tr style="height: 40px;">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <%--<div class="layui-btn-group">--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns run_sim"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns edit_plan"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns del_plan"><i class="layui-icon"></i></button>--%>
                                <%--</div>--%>
                            </td>
                            <td hidden></td>
                        </tr>
                        <tr style="height: 40px;">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <%--<div class="layui-btn-group">--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns run_sim"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns edit_plan"><i class="layui-icon"></i></button>--%>
                                    <%--<button type="button" class="layui-btn layui-btn-sm btns del_plan"><i class="layui-icon"></i></button>--%>
                                <%--</div>--%>
                            </td>
                            <td hidden></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <%--进度条--%>
        <div class="layui-col-xs12 layui-row outputTitle">
            <div class="layui-col-xs1 output_label">
                Result display area:
            </div>
            <div class="layui-col-xs2">
                <select class="output-input" id="output">
                    <option value='0'>MINMIN</option>
                </select>
                <button id="realOperate" class = "layui-btn layui-btn-radius">
                    Real Environment
                </button>
            </div>

            <div class="layui-col-xs8">
                <div id="real_loading_div">
                    <i id="real_loading" class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop"></i>
                </div>
                <div id="operate_percent"></div>
                <%--<div class="output_progress">
                    <div class="layui-progress layui-progress-small" lay-showpercent="true" lay-filter="realProgress">
                        <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
                    </div>
                    &lt;%&ndash;<div class="site-demo-button">&ndash;%&gt;
                    &lt;%&ndash;<button class="layui-btn site-demo-active" data-type="setPercent">设置50%</button>&ndash;%&gt;
                    &lt;%&ndash;<button class="layui-btn site-demo-active" data-type="loading">模拟loading</button>&ndash;%&gt;
                    &lt;%&ndash;</div>&ndash;%&gt;
                </div>--%>
            </div>
            <div class="layui-col-xs1">
                <div id="output-time" class="output-time"></div>
            </div>
        </div>

    </div>

</div>


<%--------------------------自定义方案表格结束------------------------------%>

<%--------------------------柱状图&饼图&折线图&甘特图开始------------------------------%>
<div class="layui-container chart_main">
    <div class="layui-row">
        <div id="bar-chart-div" class="layui-col-md6 chart_item">
            <div id="barChartMain"></div>
        </div>
        <div id="pie-chart-div"  class="layui-col-md6 chart_item">
            <div id="pieChartMain"></div>
        </div>
        <div id="line-chart-div"  class="layui-col-md12 chart_item">
            <div id="lineChartMain"></div>
        </div>
        <div id="gantt-chart-div"  class="layui-col-md12 chart_item">
            <div id="ganttChartMain"></div>
        </div>
    </div>
</div>

<%--------------------------柱状图&饼图&折线图&甘特图结束------------------------------%>

<%--------------------------分类表格开始------------------------------%>
<div class="layui-container table_main">
    <div class="layui-row">
        <div class="layui-col-md12">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">Standby</li>
                    <li>Running</li>
                    <li>Successed</li>
                    <li>Failed</li>
                    <li>Detail</li>
                </ul>
                <div class="layui-row layui-tab-content">
                    <div class="layui-col-md12 layui-tab-item layui-show layui-row">
                        <div class="layui-col-xs12">
                            <table  id="standby_table1" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead>
                                    <th>Job ID</th>
                                    <th>Computing Resource Type</th>
                                    <th>VM ID</th>
                                    <th>Sim-Time</th>
                                    <th>Sim-Cost</th>
                                    <th>Depth</th>
                                    <th>Parents</th>
                                    <th>Sim-Status</th>
                                </thead>
                            </table>
                        </div>
                        <div class="layui-col-xs12 standby_data_div">
                            <table id="standby_table2" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead hidden>
                                    <th>Job ID</th>
                                    <th>Computing Resource Type</th>
                                    <th>VM ID</th>
                                    <th>Sim-Time</th>
                                    <th>Sim-Cost</th>
                                    <th>Depth</th>
                                    <th>Parents</th>
                                    <th>Sim-Status</th>
                                </thead>
                                <tbody id="standby_tbody" class="standby_tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="layui-col-md12 layui-tab-item layui-row">
                        <div class="layui-col-xs12">
                            <table  id="running_table1" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead>
                                    <th>Job ID</th>
                                    <th>Computing Resource Type</th>
                                    <th>VM ID</th>
                                    <th>Start Time</th>
                                    <th>Finish Time</th>
                                    <th>Depth</th>
                                    <th>Real-Time</th>
                                    <th>Real-Cost</th>
                                    <th>Parents</th>
                                    <th>Real-Status</th>
                                </thead>
                            </table>
                        </div>
                        <div class="layui-col-xs12 running_data_div">
                            <table id="running_table2" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead hidden>
                                    <th>Job ID</th>
                                    <th>Computing Resource Type</th>
                                    <th>VM ID</th>
                                    <th>Start Time</th>
                                    <th>Finish Time</th>
                                    <th>Depth</th>
                                    <th>Real-Time</th>
                                    <th>Real-Cost</th>
                                    <th>Parents</th>
                                    <th>Real-Status</th>
                                </thead>
                                <tbody id="running_tbody" class="running_tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="layui-col-md12 layui-tab-item layui-row">
                        <div class="layui-col-xs12">
                            <table  id="successed_table1" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead>
                                    <th>Job ID</th>
                                    <th>Computing Resource Type</th>
                                    <th>VM ID</th>
                                    <th>Start Time</th>
                                    <th>Finish Time</th>
                                    <th>Depth</th>
                                    <th>Real-Time</th>
                                    <th>Real-Cost</th>
                                    <th>Parents</th>
                                    <th>Real-Status</th>
                                </thead>
                            </table>
                        </div>
                        <div class="layui-col-xs12 successed_data_div">
                            <table id="successed_table2" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead hidden>
                                    <th>Job ID</th>
                                    <th>Computing Resource Type</th>
                                    <th>VM ID</th>
                                    <th>Start Time</th>
                                    <th>Finish Time</th>
                                    <th>Depth</th>
                                    <th>Real-Time</th>
                                    <th>Real-Cost</th>
                                    <th>Parents</th>
                                    <th>Real-Status</th>
                                </thead>
                                <tbody id="successed_tbody" class="successed_tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="layui-col-md12 layui-tab-item layui-row">
                        <div class="layui-col-xs12">
                            <table  id="failed_table1" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead>
                                    <th>Job ID</th>
                                    <th>Computing Resource Type</th>
                                    <th>VM ID</th>
                                    <th>Start Time</th>
                                    <th>Finish Time</th>
                                    <th>Depth</th>
                                    <th>Real-Time</th>
                                    <th>Real-Cost</th>
                                    <th>Parents</th>
                                    <th>Real-Status</th>
                                </thead>
                            </table>
                        </div>
                        <div class="layui-col-xs12 failed_data_div">
                            <table id="failed_table2" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead hidden>
                                    <th>Job ID</th>
                                    <th>Computing Resource Type</th>
                                    <th>VM ID</th>
                                    <th>Start Time</th>
                                    <th>Finish Time</th>
                                    <th>Depth</th>
                                    <th>Real-Time</th>
                                    <th>Real-Cost</th>
                                    <th>Parents</th>
                                    <th>Real-Status</th>
                                </thead>
                                <tbody id="failed_tbody" class="failed_tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="layui-col-md12 layui-tab-item layui-row">
                        <div class="layui-col-xs12">
                            <table  id="detail_table1" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead>
                                    <th class="detail_job">Job ID</th>
                                    <th class="detail_task">Task ID</th>
                                    <th class="detail_simStus">Sim-Status</th>
                                    <th class="detail_resource">Computing Resource Type</th>
                                    <th class="detail_vm">VM ID</th>
                                    <th class="detail_simTime">Sim-Time</th>
                                    <th class="detail_simCost">Sim-Cost</th>
                                    <th class="detail_start">Start Time</th>
                                    <th class="detail_finish">Finish Time</th>
                                    <th class="detail_depth">Depth</th>
                                    <th class="detail_realTime">Real-Time</th>
                                    <th class="detail_realCost">Real-Cost</th>
                                    <th class="detail_parents">Parents</th>
                                    <th class="detail_realStus">Real-Status</th>
                                </thead>
                            </table>
                        </div>
                        <div class="layui-col-xs12 detail_data_div">
                            <table id="detail_table2" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead hidden>
                                    <th class="detail_job">Job ID</th>
                                    <th class="detail_task">Task ID</th>
                                    <th class="detail_simStus">Sim-Status</th>
                                    <th class="detail_resource">Computing Resource Type</th>
                                    <th class="detail_vm">VM ID</th>
                                    <th class="detail_simTime">Sim-Time</th>
                                    <th class="detail_simCost">Sim-Cost</th>
                                    <th class="detail_start">Start Time</th>
                                    <th class="detail_finish">Finish Time</th>
                                    <th class="detail_depth">Depth</th>
                                    <th class="detail_realTime">Real-Time</th>
                                    <th class="detail_realCost">Real-Cost</th>
                                    <th class="detail_parents">Parents</th>
                                    <th class="detail_realStus">Real-Status</th>
                                </thead>
                                <tbody id="detail_tbody" class="detail_tbody">

                                </tbody>
                            </table>
                        </div>

                        <%--<table class="layui-hide" id="detailTable" lay-filter="test"></table>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--------------------------分类表格结束------------------------------%>

<%--------------------------尾部栏开始------------------------------%>
<div class="layui-container footer_main">
    <div class="layui-row">
        <div class="layui-col-xs4">
            <div id="ahu_logo"><img src="/images/ahu_logo.png"></div>
        </div>
        <div class="layui-col-xs1">
            <div id="deakin_logo"><img src="/images/deakin_logo.png"></div>
        </div>
        <div class="layui-col-xs1">
            <div id="swinburne_logo"><img src="/images/swinburne_logo.png"></div>
        </div>
        <div class="layui-col-xs2">
            <div id="monash_logo"><img class="monash_img" src="/images/monash_logo.png"></div>
        </div>
        <div class="layui-col-xs1">
            <div id="visit_logo">
                <script type="text/javascript" id="clustrmaps" src="/jquery/clustrmaps.js?d=OZ5USxbSCBbe0YwvtXfxIlsvW6PMudDLV8qXCA4EX4M&cl=ffffff&w=a"></script>
                <%--<script type="text/javascript" id="clustrmaps" src="//cdn.clustrmaps.com/map_v2.js?d=OZ5USxbSCBbe0YwvtXfxIlsvW6PMudDLV8qXCA4EX4M&cl=ffffff&w=a"></script>--%>
            </div>
        </div>
        <div class="layui-col-xs12">
            <div class="bottom-sep" ></div>
        </div>
        <div class="layui-col-xs12">
            <div class="foot-bar">
                <div>Copyright ©  Intelligent Software and Edge Computing Lab, Anhui University</div>
                <div id="versions">Version:--</div>
                <div class="advices layui-icon layui-icon-survey" style="font-size: 30px; color: #1E9FFF;"></div>
            </div>
        </div>
    </div>
</div>
<%--<div class="layui-container testMain">
    <div class="layui-row">


        <div class="layui-col-xs12 tt">
            <div id="testChartMain"></div>
        </div>



    </div>
</div>--%>

<%--------------------------尾部栏结束------------------------------%>

<%--------------------------隐藏内容开始------------------------------%>
<%--<div style="display: none" id="parent_cloud_tips"></div>--%>
<div style="display: none" id="chart_content"></div>

<input type="hidden" id="emailAddress" value='${emailAddress}'>
<input type="hidden" id="customXmlFile" value="">
<input type="hidden" id="editPlanJson" value="">
<button id="flushPlan" hidden>flushPlan</button>
<input type="hidden" id="dagParam" value="">
<button hidden id="showDag" hidden>show Dag</button>
<%--<button id="test">test</button>--%>
<div id="background" class="background" style="display: none; "></div>
<div id="progressBar" class="progressBar" style="display: none; ">Data loading, please wait...</div>
<%--------------------------隐藏内容结束------------------------------%>

</body>
<script src="/jquery/jquery-1.9.1.min.js"></script>
<script src="/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/js/jquery.table2excel.js"></script>
<script type="text/javascript" src="/jquery/jsencrypt.js"></script>
<%--<script type="text/javascript" src="/js/global.js"></script>--%>
<%--<script type="text/javascript" src="/jquery/canvas-nest.min.js"></script>--%>
<script type="text/javascript" src="/echarts/echarts.min.js"></script> 　　
<script type="text/javascript" src="/echarts/echarts-en.min.js"></script> 　　
<script type="text/javascript" src="/js/index.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>
</html>
