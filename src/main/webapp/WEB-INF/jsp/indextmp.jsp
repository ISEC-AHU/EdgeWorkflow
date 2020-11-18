<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FogWorkflowSim</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>

<%--标题栏start--%>
<div class="title-bar">

    <div class="title-logo">
        <img src="/images/titleLog.png" alt="...">
    </div>

    <div class="developer">
        <div class="developer_logo">
            <img src="/images/developers.png">
        </div>
        <div class="developer_png">
            System<br>Informations
        </div>
    </div>

    <div id="login_div" class="user buttons">
        <div class="layui-btn-group">
            <button id="user_login" type="button" class="layui-btn layui-btn-radius layui-btn-primary">Login </button>
            <button id="user_register" type="button" class="layui-btn layui-btn-radius layui-btn-primary">Register</button>
        </div>
    </div>

    <div id="userinfo_div" class="user" hidden>
        <ul class="layui-nav" style="background-color: #4597E6">
            <%--<li class="layui-nav-item">
                <a href="">个人中心<span class="layui-badge-dot"></span></a>
            </li>--%>
            <li class="layui-nav-item">
                <a id="username_a"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                <dl class="layui-nav-child">
                    <dd><a  id="logout" href="javascript:;">Logout</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div id="ahu_logo"><img src="/images/ahu_logo.png"></div>
    <div id="deakin_logo"><img src="/images/deakin_logo.png"></div>
    <div id="swinburne_logo"><img src="/images/swinburne_logo.png"></div>
    <div id="monash_logo"><img src="/images/monash_logo.png"></div>

</div>
<div id="visit_logo">
    <script type="text/javascript" id="clustrmaps" src="//cdn.clustrmaps.com/map_v2.js?d=OZ5USxbSCBbe0YwvtXfxIlsvW6PMudDLV8qXCA4EX4M&cl=ffffff&w=a"></script>
</div>
<%--标题栏end--%>


<%--底栏 start--%>
<div class="foot-bar">
    <div>Copyright ©  Intelligent Software and Edge Computing Lab, Anhui University</div>
    <div id="versions">Version:--</div>
    <div id="visitcount">
        <span>Total number of visits：-- || </span>
        <span>Total number of visits today：--  </span>
    </div>
    <div class="advices layui-icon layui-icon-survey" style="font-size: 30px; color: #1E9FFF;"></div>
</div>
<%--底栏 end--%>

<div style="display: none" id="parent_cloud_tips"></div>
<div style="display: none" id="chart_content"></div>
<%--<div style="display: none" id="chart_doubleContent"></div>--%>
<%--//-----------------------------------左右布局start-----------------------------------------%>
<%--左边--%>
<div class="main-left">
    <%--左边-上部--%>
    <div class="left-div">
        <div class="fog-environment-div">
            <div class="setting-title-div">
                Fog Computing Environment Setting
            </div>
            <div class="number-left-div">
                <div class="fog-top-div">
                    <div class="number-div">
                        <div class="number-label">Number of Cloud Servers:</div>
                        <div class="number_div">
                            <input id="cloudServer_input" type="text" class="number_input">
                            <select id="cloudServer" class="choose-imgs">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <div class="show-imgs" id="cloudServerImgs"></div>
                    </div>
                    <div class="number-div">
                        <div class="number-label">Number of Fog Nodes:</div>
                        <div class="number_div">
                            <input id="fogServer_input" type="text" class="number_input">
                            <select id="fogServer" class="choose-imgs">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <div class="show-imgs" id="fogServerImgs"></div>
                    </div>
                    <div class="number-div">
                        <div class="number-label">Number of End Devices:</div>
                        <div class="number_div">
                            <input id="mobile_input" type="text" class="number_input">
                            <select id="mobile" class="choose-imgs">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <div class="show-imgs" id="mobileImgs"></div>
                    </div>
                </div>
                <button class="more-btn layui-btn layui-btn-radius layui-btn-normal" id="more">More Details</button>
            </div>
        </div>
        <div class="action-div">
            <div class="action-div-1">
                <button id="simulation" class="action-btn layui-btn layui-btn-radius layui-btn-normal">Start Simulation</button>
                <button id="compare" class="action-btn layui-btn layui-btn-radius layui-btn-normal">Compare</button>
            </div>
            <div class="action-div-1">
                <button id="setting" class="action-btn layui-btn layui-btn-radius layui-btn-primary">Algorithms Setting</button>
                <button id="export" class="action-btn layui-btn layui-btn-radius layui-btn-primary">Export</button>
            </div>
        </div>
    </div>

    <%--分割线--%>
    <div class="line-sep"></div>

    <%--左边-下部--%>
    <div class="right-div">
        <div class="strategy-div">
            <div class="setting-title-div">
                Strategy & Algorithms & Objective
            </div>
            <div class="strategy-content-div">
                <div class="strategy-label">Offloading Strategies:</div>
                <div class="strategy-label">
                    <select id="strategy">
                        <option value="0"></option>
                        <option value="1">All-in-Fog</option>
                        <option value="2">All-in-Cloud</option>
                        <option value="3">Simple</option>
                    </select>
                </div>
            </div>


            <div class="scheduling-div">
                Scheduling Algorithms:
            </div>
            <div class="strategy-content-div">
                <div class="minmin-input">
                    <input id="minmin" type="checkbox" value="0" class="al_check" checked/> MINMIN
                </div>
                <div class="minmin-input">
                    <input type="checkbox" value="1" class="al_check"/> MAXMIN
                </div>
                <div class="minmin-input">
                    <input type="checkbox" value="2" class="al_check"/> FCFS
                </div>
                <div class="round-input">
                    <input type="checkbox" value="3" class="al_check"/> ROUDROBIN
                </div>
            </div>
            <div class="strategy-content-div">
                <div class="minmin-input">
                    <input type="checkbox" value="4" class="al_check"/> PSO
                </div>
                <div class="ga-input">
                    <input type="checkbox" value="5" class="al_check"/> GA
                </div>
            </div>
            <div class="strategy-content-div">
                <div class="objective-label">Objective:</div>

                <%--<div class="minmin-input">
                    <input id="time" type="radio" value="0" name="radioGroup" checked="checked"/> Time
                </div>
                <div class="minmin-input">
                    <input id="energy" type="radio" value="1" name="radioGroup"/> Energy
                </div>
                <div class="minmin-input">
                    <input id="cost" type="radio" value="2" name="radioGroup"/> Cost
                </div>--%>
                <div class="radio_option">
                    <div class="radio_input" style="margin-left:-110px;">
                        <input id="time" type="radio" value="0" name="radioGroup" checked="checked" value="Time"/>
                        <label for="time"></label>
                        &nbsp;<span>Time</span>
                    </div>
                    <div class="radio_input">
                        <input id="energy" type="radio" value="1" name="radioGroup"/>
                        <label for="energy"></label>
                        &nbsp;<span>Energy</span>
                    </div>
                    <div class="radio_input" style="margin-left:30px;">
                        <input id="cost" type="radio" value="2" name="radioGroup"/>
                        <label for="cost"></label>
                        &nbsp;<span>Cost</span>
                    </div>
                </div>

            </div>
        </div>
        <div class="strategy-content-div">
            <div class="deadline-label">Deadline:</div>
            <div>
                <input class="deadline-input" type="text" id="deadline"/>
                <input  style="display: none" type="file" id="import-file"/>
            </div>
            <%--<div class="realenviorment-div">
                <input id="real" type="checkbox" value="real" class="realEnviorment" /> Real Enviorment
            </div>--%>
        </div>
        <div class="workflow-div">
            <div class="setting-title-div">
                Workflow Setting
            </div>
            <div class="strategy-content-div">
                <div class="workflow_example layui-unselect layui-form-radio layui-form-radioed "><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div></div></div>
                <div class="type-label">
                    &nbsp;&nbsp;&nbsp;&nbsp;Example&nbsp;&nbsp;Type:
                </div>
                <select id="sType" class="type-select"></select>
                <div class="amount-label">Amount:</div>
                <select class="amount-select" id="amount">
                    <option value="1">20</option>
                    <option value="1">20</option>
                    <option value="1">20</option>
                </select>
            </div>
            <div class="strategy-content-div">
                <div class="workflow_custom layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div></div></div>
                <div class="custom-checkbox">
                    <%--<input id="custom" type="checkbox"/>--%>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Custom&nbsp;&nbsp;&nbsp;Type:
                </div>
                <select id="customXML" class="type-select" style="margin-top:2px;margin-left:43px;" disabled></select>
                <%--<input class="custom-input" id="custom_input" type="text" disabled="disabled"/>
                <input class="custom-input" style="display: none" type="file" id="select-file"/>--%>
                <%--<button class="layui-btn layui-btn-radius layui-btn-primary" id="select_file_btn" disabled="disabled" style="margin-left:10px;margin-top:-4px;">Select File</button>--%>
                <%--<button id="select_file_btn" class="layui-btn layui-btn-radius layui-btn-normal" disabled="disabled" >Select</button>--%>
                <button id="draw_workflow" class = "layui-btn layui-btn-radius">Draw Workflow</button>
            </div>
            <%--<div class="strategy-content-div">
                <div class="deadline-label">Deadline:</div>
                <div>
                    <input class="deadline-input" type="text" id="deadline"/>
                    &lt;%&ndash;<button id="draw_workflow" class="layui-btn layui-btn-radius layui-btn-normal">Draw Workflow</button>
                    <button id="trans_workflow"  class="layui-btn layui-btn-radius layui-btn-normal" style="width:110px;" >Transform</button>&ndash;%&gt;
                    <input  style="display: none" type="file" id="import-file"/>
                </div>
            </div>--%>
        </div>
    </div>
</div>

<%--右边--%>
<div class="main-right">
    <div class="main-right-div">
        <div class="">
            <div class="output-div">
                <div id="real_loading_div">
                    <i id="real_loading" class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop"></i>
                </div>
                <button id="realOperate" class = "layui-btn layui-btn-radius">
                    Real Enviorment
                </button>
                <div class="output-label">Output result display area:</div>
                <select class="output-input" id="output"></select>
                <div id="output-time" class="output-time"></div>

            </div>
        </div>

        <div id="overview_data" class="layui-row">
            <div id="bar-chart-div" class="layui-col-md6 chart_item">
                <div id="barChartMain"></div>
            </div>
            <div id="pie-chart-div"  class="layui-col-md6 chart_item">
                <div id="pieChartMain"></div>
            </div>
            <div id="line-chart-div"  class="layui-col-md6 chart_item">
                <div id="lineChartMain"></div>
            </div>
            <div id="gantt-chart-div"  class="layui-col-md6 chart_item">
                <div id="ganttChartMain"></div>
            </div>
        </div>
        <div class="table-div">
            <table  id="output-table" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                <thead>
                <th>Job ID</th>
                <th>Task ID</th>
                <th>sim Status</th>
                <th>Datacenter ID</th>
                <th>VM ID</th>
                <th>simTime</th>
                <th>simCost</th>
                <th>Start Time</th>
                <th>Finish Time</th>
                <th>Depth</th>
                <th>realTime</th>
                <th>realCost</th>
                <th>Parents</th>
                <th>realStatus</th>
                </thead>
                <%--<tbody id="data_tbody">


                </tbody>--%>
            </table>
            <div id="table-data-div">
                <table id="output-table-tbody" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                    <tbody id="data_tbody">

                    </tbody>
                </table>
            </div>
        </div>
        <%--<table class="layui-table table" lay-size="sm" lay-even lay-skin="nob" id="output-table">
            <thead>
            <th>Job ID</th>
            <th>Task ID</th>
            <th>Status</th>
            <th>Datacenter ID</th>
            <th>VM ID</th>
            <th>Time</th>
            <th>Start Time</th>
            <th>Finish Time</th>
            <th>Depth</th>
            <th>Cost</th>
            <th>realTime</th>
            <th>realCost</th>
            <th>Parents</th>
            </thead>
            <tbody id="data_tbody">


            </tbody>
        </table>--%>


    </div>
</div>

<%-------------------------------------左右布局end-------------------------------------------%>

<%-------------------------------------上下布局start-----------------------------------------%>
<%--<div class="main-div" hidden>
    <div class="middle-div">
        &lt;%&ndash;左边&ndash;%&gt;
        <div class="left-div">
            <div class="fog-environment-div">
                <div class="setting-title-div">
                    Fog Computing Environment Setting
                </div>
                <div class="number-left-div">
                    <div class="fog-top-div">
                        <div class="number-div">
                            <div class="number-label">Number of Cloud Servers:</div>
                            <div class="number_div">
                                <input id="cloudServer_input" type="text" class="number_input">
                                <select id="cloudServer" class="choose-imgs">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="show-imgs" id="cloudServerImgs"></div>
                        </div>
                        <div class="number-div">
                            <div class="number-label">Number of Fog Nodes:</div>
                            <div class="number_div">
                                <input id="fogServer_input" type="text" class="number_input">
                                <select id="fogServer" class="choose-imgs">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="show-imgs" id="fogServerImgs"></div>
                        </div>
                        <div class="number-div">
                            <div class="number-label">Number of End Devices:</div>
                            <div class="number_div">
                                <input id="mobile_input" type="text" class="number_input">
                                <select id="mobile" class="choose-imgs">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="show-imgs" id="mobileImgs"></div>
                        </div>
                    </div>
                    &lt;%&ndash;<button class="more-btn layui-btn layui-btn-radius layui-btn-primary" id="more">More Details</button>&ndash;%&gt;
                    <button class="more-btn layui-btn layui-btn-radius layui-btn-normal" id="more">More Details</button>
                </div>
            </div>
            <div class="action-div">
                <div class="action-div-1">
                    &lt;%&ndash;<button class="action-btn layui-btn layui-btn-radius layui-btn-primary" id="simulation">Start Simulation</button>
                    <button class="action-btn layui-btn layui-btn-radius layui-btn-primary" id="compare">Compare</button>&ndash;%&gt;
                    <button class="action-btn layui-btn layui-btn-radius layui-btn-normal" id="simulation">Start Simulation</button>
                    <button class="action-btn layui-btn layui-btn-radius layui-btn-normal" id="compare">Compare</button>
                </div>
                <div class="action-div-1">
                    &lt;%&ndash;<button class="action-btn layui-btn layui-btn-radius layui-btn-primary" id="setting">Algorithms Setting</button>
                    <button id="export" class="action-btn layui-btn layui-btn-radius layui-btn-primary">Export</button>&ndash;%&gt;
                    <button class="action-btn layui-btn layui-btn-radius layui-btn-primary" id="setting">Algorithms Setting</button>
                    <button id="export" class="action-btn layui-btn layui-btn-radius layui-btn-primary">Export</button>
                </div>
            </div>
        </div>
        <div class="line-sep-div"></div>
        &lt;%&ndash;右边&ndash;%&gt;

        <div class="right-div">
            <div class="strategy-div">
                <div class="setting-title-div">
                    Strategy & Algorithms & Objective
                </div>
                <div class="strategy-content-div">
                    <div class="strategy-label">Offloading Strategies:</div>
                    <div class="strategy-label">
                        <select id="strategy">
                            <option value="0"></option>
                            <option value="1">All-in-Fog</option>
                            <option value="2">All-in-Cloud</option>
                            <option value="3">Simple</option>
                        </select>
                    </div>
                </div>


                <div class="scheduling-div">
                    Scheduling Algorithms:
                </div>
                <div class="strategy-content-div">
                    <div class="minmin-input">
                        <input id="minmin" type="checkbox" value="0" class="al_check" checked/> MINMIN
                    </div>
                    <div class="minmin-input">
                        <input type="checkbox" value="1" class="al_check"/> MAXMIN
                    </div>
                    <div class="minmin-input">
                        <input type="checkbox" value="2" class="al_check"/> FCFS
                    </div>
                    <div class="round-input">
                        <input type="checkbox" value="3" class="al_check"/> ROUDROBIN
                    </div>
                </div>
                <div class="strategy-content-div">
                    <div class="minmin-input">
                        <input type="checkbox" value="4" class="al_check"/> PSO
                    </div>
                    <div class="ga-input">
                        <input type="checkbox" value="5" class="al_check"/> GA
                    </div>
                </div>
                <div class="strategy-content-div">
                    <div class="objective-label">Objective:</div>

                    &lt;%&ndash;<div class="minmin-input">
                        <input id="time" type="radio" value="0" name="radioGroup" checked="checked"/> Time
                    </div>
                    <div class="minmin-input">
                        <input id="energy" type="radio" value="1" name="radioGroup"/> Energy
                    </div>
                    <div class="minmin-input">
                        <input id="cost" type="radio" value="2" name="radioGroup"/> Cost
                    </div>&ndash;%&gt;
                    <div class="radio_option">
                        <div class="radio_input" style="margin-left:-110px;">
                            <input id="time" type="radio" value="0" name="radioGroup" checked="checked" value="Time"/>
                            <label for="time"></label>
                            &nbsp;<span>Time</span>
                        </div>
                        <div class="radio_input">
                            <input id="energy" type="radio" value="1" name="radioGroup"/>
                            <label for="energy"></label>
                            &nbsp;<span>Energy</span>
                        </div>
                        <div class="radio_input" style="margin-left:30px;">
                            <input id="cost" type="radio" value="2" name="radioGroup"/>
                            <label for="cost"></label>
                            &nbsp;<span>Cost</span>
                        </div>
                    </div>

                </div>

            </div>
            <div class="strategy-content-div">
                <div class="deadline-label">Deadline:</div>
                <div>
                    <input class="deadline-input" type="text" id="deadline"/>
                    <input  style="display: none" type="file" id="import-file"/>
                </div>
                <div class="realenviorment-div">
                    <input id="real" type="checkbox" value="real" class="realEnviorment" /> Real Enviorment
                </div>
            </div>
            <div class="workflow-div">
                <div class="setting-title-div">
                    Workflow Setting
                </div>
                <div class="strategy-content-div">
                    <div class="workflow_example layui-unselect layui-form-radio layui-form-radioed "><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div></div></div>
                    <div class="type-label">
                        &nbsp;&nbsp;&nbsp;&nbsp;Example&nbsp;&nbsp;Type:
                    </div>
                    <select id="sType" class="type-select"></select>
                    <div class="amount-label">Amount:</div>
                    <select class="amount-select" id="amount">
                        <option value="1">20</option>
                        <option value="1">20</option>
                        <option value="1">20</option>
                    </select>
                </div>
                <div class="strategy-content-div">
                    <div class="workflow_custom layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div></div></div>
                    <div class="custom-checkbox">
                        &lt;%&ndash;<input id="custom" type="checkbox"/>&ndash;%&gt;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Custom&nbsp;&nbsp;&nbsp;Type:
                    </div>
                    <select id="customXML" class="type-select" style="margin-top:2px;margin-left:43px;" disabled></select>
                    &lt;%&ndash;<input class="custom-input" id="custom_input" type="text" disabled="disabled"/>
                    <input class="custom-input" style="display: none" type="file" id="select-file"/>&ndash;%&gt;
                    &lt;%&ndash;<button class="layui-btn layui-btn-radius layui-btn-primary" id="select_file_btn" disabled="disabled" style="margin-left:10px;margin-top:-4px;">Select File</button>&ndash;%&gt;
                    &lt;%&ndash;<button id="select_file_btn" class="layui-btn layui-btn-radius layui-btn-normal" disabled="disabled" >Select</button>&ndash;%&gt;
                    <button id="draw_workflow" class = "layui-btn layui-btn-radius">Draw Workflow</button>
                </div>
                &lt;%&ndash;<div class="strategy-content-div">
                    <div class="deadline-label">Deadline:</div>
                    <div>
                        <input class="deadline-input" type="text" id="deadline"/>
                        &lt;%&ndash;<button id="draw_workflow" class="layui-btn layui-btn-radius layui-btn-normal">Draw Workflow</button>
                        <button id="trans_workflow"  class="layui-btn layui-btn-radius layui-btn-normal" style="width:110px;" >Transform</button>&ndash;%&gt;
                        <input  style="display: none" type="file" id="import-file"/>
                    </div>
                </div>&ndash;%&gt;
            </div>
        </div>
    </div>
    &lt;%&ndash;<div class="middle-sep-div"></div>&ndash;%&gt;
</div>--%>
<%--<div class="main-bottom-div" hidden>
    <div class="bottom-div">
        <div class="output-div">
            <div class="output-label">Output result display area:</div>
            <select class="output-input" id="output"></select>
            <div id="output-time" class="output-time"></div>
            <button id="realOperate" class = "layui-btn layui-btn-radius">Real Enviorment</button>
        </div>
    </div>
    <table class="layui-table table" lay-size="sm" lay-even lay-skin="nob" id="output-table">
        <thead>
        <th>Job ID</th>
        <th>Task ID</th>
        <th>Status</th>
        <th>Datacenter ID</th>
        <th>VM ID</th>
        <th>Time</th>
        <th>Start Time</th>
        <th>Finish Time</th>
        <th>Depth</th>
        <th>Cost</th>
        <th>realTime</th>
        <th>realCost</th>
        <th>Parents</th>
        </thead>
        <tbody id="data_tbody">


        </tbody>
    </table>

    <div id="detailInfo" class="layui-carousel" hidden>
        <div carousel-item>
            <div id="runTime" class="layui-row">
                &lt;%&ndash;<button id="runTime_btn" class="layui-btn layui-btn-primary">runtimes info</button>&ndash;%&gt;
                <div id="speedChart" style="display: block;">
                    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                    <div id="speedChartMain" style="width: 850px; height: 300px;"></div>
                </div>
        &lt;%&ndash;<div></div>&ndash;%&gt;

            </div>
            <div id="cloudInfo" class="layui-row">
                    &lt;%&ndash;<div class="layui-col-xs3 cloudrow">
                        <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                            <input value="1600" hidden>
                            <input value="0.96" hidden>
                            <img id="cloudServer_0" class="servers" src="/images/cloudServer.png">
                        </div>
                        <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                            <input value="1600" hidden>
                            <input value="0.96" hidden>
                            <img id="cloudServer_1" class="servers" src="/images/cloudServer.png">
                        </div>
                        <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                            <input value="1600" hidden>
                            <input value="0.96" hidden>
                            <img id="cloudServer_2" class="servers" src="/images/cloudServer.png">
                        </div>
                        <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                            <input value="1600" hidden>
                            <input value="0.96" hidden>
                            <img id="cloudServer_3" class="servers" src="/images/cloudServer.png">
                        </div>
                        <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                            <input value="1600" hidden>
                            <input value="0.96" hidden>
                            <img id="cloudServer_4" class="servers" src="/images/cloudServer.png">
                        </div>
                        <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                            <input value="1600" hidden>
                            <input value="0.96" hidden>
                            <img id="cloudServer_5" class="servers" src="/images/cloudServer.png">
                        </div>
                        <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                            <input value="1600" hidden>
                            <input value="0.96" hidden>
                            <img id="cloudServer_6" class="servers" src="/images/cloudServer.png">
                        </div>
                        <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                            <input value="1600" hidden>
                            <input value="0.96" hidden>
                            <img id="cloudServer_7" class="servers" src="/images/cloudServer.png">
                        </div>

                    </div>
                    <div id="cloudDetail" class="layui-col-xs9">
                        <div class="layui-row">
                            <div class="layui-col-xs3">
                                <input value="jobId_item" hidden>
                                <input value="taskId_item" hidden>
                                <input value="status_item" hidden>
                                <input value="dataCenterId_item" hidden>
                                <input value="vmId_item" hidden>
                                <input value="time_item" hidden>
                                <input value="startTime_item" hidden>
                                <input value="finishTime_item" hidden>
                                <input value="depth_item" hidden>
                                <input value="cost_item" hidden>
                                <input value="parents_item" hidden>
                                <input value="realCost_item" hidden>
                                <input value="realTime_item" hidden>
                                <img id="cloudTask_0" src="/images/task.jpg" class="tasks" style="width: 25%; height: auto">
                            </div>
                            <div class="layui-col-xs3">
                                <input value="jobId_item" hidden>
                                <input value="taskId_item" hidden>
                                <input value="status_item" hidden>
                                <input value="dataCenterId_item" hidden>
                                <input value="vmId_item" hidden>
                                <input value="time_item" hidden>
                                <input value="startTime_item" hidden>
                                <input value="finishTime_item" hidden>
                                <input value="depth_item" hidden>
                                <input value="cost_item" hidden>
                                <input value="parents_item" hidden>
                                <input value="realCost_item" hidden>
                                <input value="realTime_item" hidden>
                                <img id="cloudTask_1" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                            </div>
                            <div class="layui-col-xs3">
                                <input value="jobId_item" hidden>
                                <input value="taskId_item" hidden>
                                <input value="status_item" hidden>
                                <input value="dataCenterId_item" hidden>
                                <input value="vmId_item" hidden>
                                <input value="time_item" hidden>
                                <input value="startTime_item" hidden>
                                <input value="finishTime_item" hidden>
                                <input value="depth_item" hidden>
                                <input value="cost_item" hidden>
                                <input value="parents_item" hidden>
                                <input value="realCost_item" hidden>
                                <input value="realTime_item" hidden>
                                <img id="cloudTask_2" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                            </div>
                            <div class="layui-col-xs3">
                                <input value="jobId_item" hidden>
                                <input value="taskId_item" hidden>
                                <input value="status_item" hidden>
                                <input value="dataCenterId_item" hidden>
                                <input value="vmId_item" hidden>
                                <input value="time_item" hidden>
                                <input value="startTime_item" hidden>
                                <input value="finishTime_item" hidden>
                                <input value="depth_item" hidden>
                                <input value="cost_item" hidden>
                                <input value="parents_item" hidden>
                                <input value="realCost_item" hidden>
                                <input value="realTime_item" hidden>
                                <img id="cloudTask_3" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                            </div>
                            <div class="layui-col-xs3">
                                <input value="jobId_item" hidden>
                                <input value="taskId_item" hidden>
                                <input value="status_item" hidden>
                                <input value="dataCenterId_item" hidden>
                                <input value="vmId_item" hidden>
                                <input value="time_item" hidden>
                                <input value="startTime_item" hidden>
                                <input value="finishTime_item" hidden>
                                <input value="depth_item" hidden>
                                <input value="cost_item" hidden>
                                <input value="parents_item" hidden>
                                <input value="realCost_item" hidden>
                                <input value="realTime_item" hidden>
                                <img id="cloudTask_4" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                            </div>
                        </div>
                    </div>&ndash;%&gt;
            </div>
            <div id="fogInfo" class="layui-row">
                &lt;%&ndash;<div class="layui-col-xs3 fogrow">
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1300" hidden>
                        <input value="0.48" hidden>
                        <img id="fogServer_0" class="servers" src="/images/fogServer.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1300" hidden>
                        <input value="0.48" hidden>
                        <img id="fogServer_1" class="servers" src="/images/fogServer.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1300" hidden>
                        <input value="0.48" hidden>
                        <img id="fogServer_2" class="servers" src="/images/fogServer.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1300" hidden>
                        <input value="0.48" hidden>
                        <img id="fogServer_3" class="servers" src="/images/fogServer.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1300" hidden>
                        <input value="0.48" hidden>
                        <img id="fogServer_4" class="servers" src="/images/fogServer.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1300" hidden>
                        <input value="0.48" hidden>
                        <img id="fogServer_5" class="servers" src="/images/fogServer.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1300" hidden>
                        <input value="0.48" hidden>
                        <img id="fogServer_6" class="servers" src="/images/fogServer.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1300" hidden>
                        <input value="0.48" hidden>
                        <img id="fogServer_7" class="servers" src="/images/fogServer.png">
                    </div>

                </div>
                <div id="fogDetail" class="layui-col-xs9">
                    <div class="layui-row">
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="fogTask_0" src="/images/task.jpg" class="tasks" style="width: 25%; height: auto">
                        </div>
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="fogTask_1" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                        </div>
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="fogTask_2" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                        </div>
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="fogTask_3" src="/images/task.jpg" class="tasks" class="tasks"  style="width: 25%; height: auto">
                        </div>
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="fogTask_4" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                        </div>
                    </div>
                </div>&ndash;%&gt;
            </div>
            <div id="mobileInfo" class="layui-row">
                &lt;%&ndash;<div class="layui-col-xs3 mobilerow">
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1000" hidden>
                        <input value="0" hidden>
                        <img id="mobile_0" class="servers" src="/images/mobile.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1000" hidden>
                        <input value="0" hidden>
                        <img id="mobile_1" class="servers" src="/images/mobile.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1000" hidden>
                        <input value="0" hidden>
                        <img id="mobile_2" class="servers" src="/images/mobile.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1000" hidden>
                        <input value="0" hidden>
                        <img id="mobile_3" class="servers" src="/images/mobile.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1000" hidden>
                        <input value="0" hidden>
                        <img id="mobile_4" class="servers" src="/images/mobile.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1000" hidden>
                        <input value="0" hidden>
                        <img id="mobile_5" class="servers" src="/images/mobile.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1000" hidden>
                        <input value="0" hidden>
                        <img id="mobile_6" class="servers" src="/images/mobile.png">
                    </div>
                    <div class="layui-col-md12" style="border: 1px red solid; text-align: center;">
                        <input value="1000" hidden>
                        <input value="0" hidden>
                        <img id="mobile_7" class="servers" src="/images/mobile.png">
                    </div>

                </div>
                <div id="mobileDetail" class="layui-col-xs9">
                    <div class="layui-row">
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="mobileTask_0" src="/images/task.jpg" class="tasks" style="width: 25%; height: auto">
                        </div>
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="mobileTask_1" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                        </div>
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="mobileTask_2" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                        </div>
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="mobileTask_3" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                        </div>
                        <div class="layui-col-xs3">
                            <input value="jobId_item" hidden>
                            <input value="taskId_item" hidden>
                            <input value="status_item" hidden>
                            <input value="dataCenterId_item" hidden>
                            <input value="vmId_item" hidden>
                            <input value="time_item" hidden>
                            <input value="startTime_item" hidden>
                            <input value="finishTime_item" hidden>
                            <input value="depth_item" hidden>
                            <input value="cost_item" hidden>
                            <input value="parents_item" hidden>
                            <input value="realCost_item" hidden>
                            <input value="realTime_item" hidden>
                            <img id="mobileTask_4" src="/images/task.jpg" class="tasks"  style="width: 25%; height: auto">
                        </div>
                    </div>
                </div>&ndash;%&gt;
            </div>
            &lt;%&ndash;<div id="timeCompare" style="background-color: #FF00FF">runtimes info</div>
            <div style="background-color: #FFB300">条目5</div>&ndash;%&gt;
        </div>
    </div>
</div>
</div>--%>
<%-------------------------------------上下布局end-----------------------------------------%>

<div id="background" class="background" style="display: none; "></div>
<div id="progressBar" class="progressBar" style="display: none; ">Data loading, please wait...</div>

<input type="hidden" id="emailAddress" value='${emailAddress}'>

</body>
<script src="/jquery/jquery-1.9.1.min.js"></script>
<script src="/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/js/jquery.table2excel.js"></script>
<script type="text/javascript" src="/jquery/jsencrypt.js"></script>
<%--<script type="text/javascript" src="/js/global.js"></script>--%>
<script type="text/javascript" src="/jquery/canvas-nest.min.js"></script>
<script type="text/javascript" src="/echarts/echarts.min.js"></script> 　　
<script type="text/javascript" src="/js/index.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>
</html>
