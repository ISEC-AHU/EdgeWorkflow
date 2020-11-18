<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FogWorkflow</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/images/ahu_logo.png">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<%----------------------------总布局开始----------------------------------------------%>
<div class="layui-container mainContainer">

    <%------------------------标题栏开始------------------------------%>
    <div class="main_title layui-row">
        <div class="layui-col-xs2 title_item">
            <div id="system_logo"><img src="/images/titleLog.png" alt="..."></div>
        </div>

        <div class="layui-col-xs1 title_item">
            <div id="ahu_logo"><img src="/images/ahu_logo.png"></div>
        </div>
        <div class="layui-col-xs1 title_item">
            <div id="deakin_logo"><img src="/images/deakin_logo.png"></div>
        </div>
        <div class="layui-col-xs2 title_item">
            <div id="swinburne_logo"><img src="/images/swinburne_logo.png"></div>
        </div>
        <div class="layui-col-xs2 title_item">
            <div id="monash_logo"><img src="/images/monash_logo.png"></div>
        </div>
        <div class="layui-col-xs1 title_item">
            <div id="visit_logo">
                <script type="text/javascript" id="clustrmaps" src="/jquery/clustrmaps.js?d=OZ5USxbSCBbe0YwvtXfxIlsvW6PMudDLV8qXCA4EX4M&cl=ffffff&w=a"></script>
                <%--<script type="text/javascript" id="clustrmaps" src="//cdn.clustrmaps.com/map_v2.js?d=OZ5USxbSCBbe0YwvtXfxIlsvW6PMudDLV8qXCA4EX4M&cl=ffffff&w=a"></script>--%>
            </div>
        </div>
        <div class="layui-col-xs2 title_item">
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
        </div>

        <div class="layui-col-xs1 title_item">
            <div class="developer">
                <div class="developer_logo">
                    <img src="/images/developers.png">
                </div>
                <div class="developer_png">
                    System<br>Informations
                </div>
            </div>
        </div>
    </div>
    <%------------------------标题栏结束------------------------------%>




    <%------------------------展示区域开始----------------------------%>
    <div class="main_middle layui-row">
        <%------------展示区域--左边开始-----------------%>
        <div class="layui-col-xs3">
            <div class="layui-row">
                <div class="layui-col-xs12">
                    <div class="setting-title-div">
                        Fog Computing Environment Setting
                    </div>
                </div>
                <div class="layui-col-xs12 number-left-div">
                    <div class="layui-row machine_div">
                        <div class="layui-col-xs5">
                            <div class="number-label">Number of Cloud Servers:</div>
                        </div>
                        <div class="layui-col-xs2">
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
                        </div>
                        <div class="layui-col-xs5">
                            <div class="show-imgs" id="cloudServerImgs"></div>
                        </div>
                    </div>
                    <div class="layui-row machine_div">
                        <div class="layui-col-xs5">
                            <div class="number-label">Number of Fog Nodes:</div>
                        </div>
                        <div class="layui-col-xs2">
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
                        </div>
                        <div class="layui-col-xs5">
                            <div class="show-imgs" id="fogServerImgs"></div>
                        </div>
                    </div>
                    <div class="layui-row machine_div">
                        <div class="layui-col-xs5">
                            <div class="number-label">Number of End Devices:</div>
                        </div>
                        <div class="layui-col-xs2">
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
                        </div>
                        <div class="layui-col-xs5">
                            <div class="show-imgs" id="mobileImgs"></div>
                        </div>
                    </div>
                    <div class="layui-col-xs12">
                        <button id="more" class="more-btn layui-btn layui-btn-radius layui-btn-normal">More Details</button>
                    </div>
                </div>

                <%--<div class="layui-col-xs12">
                    <div class="line-sep"></div>
                </div>--%>
                <div class="layui-col-xs12">
                    <div class="setting-title-div">
                        Strategy & Algorithms & Objective
                    </div>
                </div>
                <div class="layui-row number-left-div">
                    <div class="layui-col-xs5">
                        <div class="scheduling-div">Offloading Strategies:</div>
                    </div>
                    <div class="layui-col-xs7">
                            <select id="strategy">
                                <option value="0"></option>
                                <option value="1">All-in-Fog</option>
                                <option value="2">All-in-Cloud</option>
                                <option value="3">Simple</option>
                            </select>
                    </div>
                    <div class="layui-col-xs12">
                        <div class="scheduling-div">
                            Scheduling Algorithms:
                        </div>
                    </div>
                    <div class="layui-col-xs4">
                        <input id="minmin" type="checkbox" value="0" class="al_check" checked/> MINMIN
                    </div>
                    <div class="layui-col-xs4">
                        <input type="checkbox" value="1" class="al_check"/> MAXMIN
                    </div>
                    <div class="layui-col-xs4">
                        <input type="checkbox" value="2" class="al_check"/> FCFS
                    </div>
                    <div class="layui-col-xs4">
                        <input type="checkbox" value="3" class="al_check"/> ROUDROBIN
                    </div>
                    <div class="layui-col-xs4">
                        <input type="checkbox" value="4" class="al_check"/> PSO
                    </div>
                    <div class="layui-col-xs4">
                        <input type="checkbox" value="5" class="al_check"/> GA
                    </div>
                    <div class="layui-col-xs12">
                        <div class="objective-label">Objective:</div>
                    </div>
                    <div class="layui-col-xs12">
                        <div class="layui-row">
                            <div class="layui-col-xs4">
                                <div class="radio_input">
                                    <input id="time" type="radio" value="0" name="radioGroup" checked="checked" value="Time"/>
                                    <label for="time"></label>
                                    &nbsp;<span>Time</span>
                                </div>
                            </div>
                            <div class="layui-col-xs4">
                                <div class="radio_input">
                                    <input id="energy" type="radio" value="1" name="radioGroup"/>
                                    <label for="energy"></label>
                                    &nbsp;<span>Energy</span>
                                </div>
                            </div>
                            <div class="layui-col-xs4">
                                <div class="radio_input">
                                    <input id="cost" type="radio" value="2" name="radioGroup"/>
                                    <label for="cost"></label>
                                    &nbsp;<span>Cost</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs5">
                        <div class="deadline-label">Deadline:</div>
                    </div>
                    <div class="layui-col-xs7">
                        <input class="deadline-input" type="text" id="deadline"/>
                        <input  style="display: none" type="file" id="import-file"/>
                    </div>
                </div>

                <div class="layui-col-xs12">
                    <div class="setting-title-div">
                        Workflow Setting
                    </div>
                </div>
                <div class="layui-row number-left-div">
                    <div class="layui-col-xs12 layui-row">
                        <div class="layui-col-xs4">
                            <div class="workflow_example layui-unselect layui-form-radio layui-form-radioed ">
                                <i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                                <div>Example&nbsp;&nbsp;Type:</div>
                            </div>
                        </div>
                        <div class="layui-col-xs4">
                            <select id="sType" class="type-select"></select>
                        </div>
                        <div class="layui-col-xs4">
                            <div class="amount-label">Amount:</div>
                            <select class="amount-select" id="amount">
                                <option value="1">20</option>
                                <option value="1">20</option>
                                <option value="1">20</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-xs12 layui-row">
                        <div class="layui-col-xs4">
                        <div class="workflow_custom layui-unselect layui-form-radio">
                            <i class="layui-anim layui-icon"></i>
                            <div>Custom&nbsp;&nbsp;&nbsp;Type:</div>
                        </div>
                    </div>
                        <div class="layui-col-xs4">
                            <select id="customXML" class="custom-select" disabled></select>
                        </div>
                        <div class="layui-col-xs4">
                            <button id="draw_workflow" class = "layui-btn layui-btn-radius">Draw Workflow</button>
                        </div>
                    </div>
                </div>

                <div class="layui-col-xs6 four_btn">
                    <button id="simulation" class="action-btn layui-btn layui-btn-radius layui-btn-normal">Start Simulation</button>
                </div>
                <div class="layui-col-xs6 four_btn">
                    <button id="compare" class="action-btn layui-btn layui-btn-radius layui-btn-normal">Compare</button>
                </div>
                <div class="layui-col-xs6 four_btn">
                    <button id="setting" class="action-btn layui-btn layui-btn-radius layui-btn-primary">Algorithms Setting</button>
                </div>
                <div class="layui-col-xs6 four_btn">
                    <button id="export" class="action-btn layui-btn layui-btn-radius layui-btn-primary">Export</button>
                </div>
            </div>
        </div>

        <%--<div class="layui-col-xs3">
            &lt;%&ndash;左边-上部&ndash;%&gt;
            <div class="left-div layui-row">
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

            &lt;%&ndash;分割线&ndash;%&gt;
            <div class="line-sep"></div>

            &lt;%&ndash;左边-下部&ndash;%&gt;
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
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Custom&nbsp;&nbsp;&nbsp;Type:
                        </div>
                        <select id="customXML" class="type-select" style="margin-top:2px;margin-left:43px;" disabled></select>
                        <button id="draw_workflow" class = "layui-btn layui-btn-radius">Draw Workflow</button>
                    </div>
                </div>
            </div>
        </div>--%>
        <%------------展示区域--左边结束-----------------%>



        <%------------展示区域--右边开始-----------------%>
        <div class="layui-col-xs9">
            <div class="main-right-div">
                <div class="right_title layui-row">
                    <div class="layui-col-xs6">
                        <div class="output-label">Output result display area:</div>
                        <select class="output-input" id="output"></select>
                        <button id="realOperate" class = "layui-btn layui-btn-radius">
                            Real Enviorment
                        </button>
                        <div id="real_loading_div">
                            <i id="real_loading" class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop"></i>
                        </div>
                    </div>
                    <div class="layui-col-xs6">
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
                    <div class="layui-col-md12">
                        <div id="table-thead-div">
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
                                <%--<tbody id="data_tbody_hidden" hidden class="data_tbody">

                                </tbody>--%>
                            </table>
                        </div>
                    </div>
                    <div class="layui-col-md12">
                        <div id="table-data-div">
                            <table id="output-table-tbody" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                                <thead hidden>
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
                                <tbody id="data_tbody" class="data_tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%--<div class="table-div">
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
                        &lt;%&ndash;<tbody id="data_tbody">
                        </tbody>&ndash;%&gt;
                    </table>
                    <div id="table-data-div">
                        <table id="output-table-tbody" class="layui-table table" lay-size="sm" lay-even lay-skin="nob">
                            <tbody id="data_tbody">

                            </tbody>
                        </table>
                    </div>
                </div>--%>

            </div>
        </div>
        <%------------展示区域--右边结束-----------------%>
    </div>
    <%------------------------展示区域结束----------------------------%>




    <%------------------------尾部标题开始----------------------------%>
    <div class="main_foot layui-row">
        <div class="layui-col-xs12">
            <div class="foot-bar">
                <div>Copyright ©  Intelligent Software and Edge Computing Lab, Anhui University</div>
                <div id="versions">Version:--</div>
                <%--<div id="visitcount">
                    <span>Total number of visits：-- || </span>
                    <span>Total number of visits today：--  </span>
                </div>--%>
                <div class="advices layui-icon layui-icon-survey" style="font-size: 30px; color: #1E9FFF;"></div>
            </div>
        </div>
    </div>
    <%------------------------尾部标题结束----------------------------%>

</div>
<%------------------隐藏内容开始--------------------------------------%>
<div style="display: none" id="parent_cloud_tips"></div>
<div style="display: none" id="chart_content"></div>
<%------------------隐藏内容结束--------------------------------------%>
<%----------------------------总布局结束----------------------------------------------%>

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
<%--<script type="text/javascript" src="/jquery/canvas-nest.min.js"></script>--%>
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
