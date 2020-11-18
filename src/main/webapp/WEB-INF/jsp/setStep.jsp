<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FogWorkflowSim</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="css/setStep.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/jquery-ui-1.10.4.min.css">
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script src="/jquery/jquery.cookie.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/jquery.table2excel.js"></script>
    <script type="text/javascript" src="/jquery/jsencrypt.js"></script>
    <script type="text/javascript" src="/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="/echarts/echarts-en.min.js"></script>
    <script type="text/javascript" src="js/setStep.js"></script>
    <%--<script type="text/javascript" src="js/setStepTemp.js"></script>--%>
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;

        });
    </script>
    <style type="text/css">
        input:-webkit-autofill { box-shadow: 0 0 0px 1000px white inset !important;}
    </style>
</head>
<body>

<%--<button class="action-btn layui-btn layui-btn-radius layui-btn-normal" id="Sett">Sett</button>--%>

<div id="sets">
    <div style="display: none" id="parent_cloud_tips"></div>
    <div style="display: none" id="cloud_number">1</div>
    <div style="display: none" id="fog_number">1</div>
    <div style="display: none" id="mobile_number">1</div>
    <%--Setting MEC Environment选项卡--%>
    <div id="sets1">
        <ul id="nav">
            <li id="workflow_title1">1.Select Workflow Type</li>
            <li id="document_info1">2.Assign Computing Tasks</li>
            <li id="environment_title1" style="color: mediumpurple;">3.Setting EC Environment</li>
            <li id="strategy_title1">4.Select Offloading Strategy</li>
        </ul>
        <div id="content1">
            <div id="cleft">
                <div class="desc1">Environment Editor</div>
                <div id="pics1">
                    <div id="cloud">
                        <div class="fir_col">Cloud</div>
                        <div class="sec_col" id="cloudServerImgs">
                            <div class="imag1">
                                <img src="images/cloudServer.png"/>
                                <div class="title">Small</div>
                            </div>
                        </div>
                    </div>
                    <div id="fog">
                        <div class="fir_col">Edge</div>
                        <div class="sec_col"  id="fogServerImgs">
                            <div class="imag2">
                                <img src="images/fogServer.png"/>
                                <div class="title">Small</div>
                            </div>
                        </div>
                    </div>
                    <div id="mobile">
                        <div class="fir_col">End</div>
                        <div class="sec_col"  id="mobileImgs">
                            <div class="imag3">
                                <img src="images/mobile.png"/>
                                <div class="title">Small</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="cright">
                <%--<div class="desc1">Select VM</div>
                <div id="options">
                    <span>VM type:</span>
                    <span>
                    <select id="vmType">
                      <option value ="Small">Small</option>
                      <option value ="Large">Large</option>
                      <option value="Extra Large">Extra Large</option>
                    </select>
                </span>
                </div>--%>
                <div class="desc1" style="visibility:hidden">Environment editor</div>
                <div id="table2">

                    <%--云服务器环境设置--%>
                    <div id="cloudSetting" class="setRow">
                        <div id="ctype" class="type">
                            <span class="fontType">CloudType:</span>
                            <select id="clType">
                                <option value ="Small">Small(MIPS:1600 Cost:0.96)</option>
                                <option value ="Middle">Middle(MIPS:3200 Cost:1.66)</option>
                                <option value="Large">Large(MIPS:4800 Cost:2.36)</option>
                            </select>
                        </div>
                        <div id="cnum" class="number">Number:
                            <input id="cloudNum" name="cloudNum" type="text" value="1">
                        </div>
                        <div id="cadd" class="column1">
                            <button id="up1" style="border: darkgray 1px solid">Add</button>
                        </div>
                        <div id="cdown" class="column2">
                            <button id="down1" style="border: darkgray 1px solid">Del</button>
                        </div>
                    </div>

                    <%--边缘服务器环境设置--%>
                    <div id="edgeSetting" class="setRow">
                        <div id="etype" class="type">
                            <span class="fontType">EdgeType:</span>
                            <select id="edType">
                                <option value ="Small">Small(MIPS:1300 Cost:0.48)</option>
                                <option value ="Middle">Middle(MIPS:2600 Cost:0.78)</option>
                                <option value="Large">Large(MIPS:3900 Cost:1.08)</option>
                            </select>
                        </div>
                        <div id="enum" class="number">Number:
                            <input id="edgeNum" name="edgeNum" type="text" value="1">
                        </div>
                        <div id="eadd" class="column1">
                            <button id="up2" style="border: darkgray 1px solid">Add</button>
                        </div>
                        <div id="edown" class="column2">
                            <button id="down2" style="border: darkgray 1px solid">Del</button>
                        </div>
                    </div>

                    <%--终端设备环境设置--%>
                    <div id="mobileSetting" class="setRow">
                        <div id="mtype" class="type">
                            <span class="fontType">EndType:</span>
                            <select id="moType">
                                <option value ="Small">Small(MIPS:1000)</option>
                                <option value ="Middle">Middle(MIPS:2000)</option>
                                <option value="Large">Large(MIPS:3000)</option>
                            </select>
                        </div>
                        <div id="mnum" class="number">Number:
                            <input id="mobileNum" name="mobileNum" type="text" value="1">
                        </div>
                        <div id="madd" class="column1">
                            <button id="up3" style="border: darkgray 1px solid">Add</button>
                        </div>
                        <div id="mdown" class="column2">
                            <button id="down3" style="border: darkgray 1px solid">Del</button>
                        </div>
                    </div>
                    <%--<table id="t2">
                        <tr class="row2">
                            <td class="c1"><img class="img1" src="images/cloudServer.png"></td>
                            <td class="c2" id="down1">-</td>
                            <td class="c2"><input name="cloudNum" type="text" value="1"></td>
                            <td class="c2" id="up1">+</td>
                        </tr>

                        <tr class="row2">
                            <td class="c1"><img class="img1" src="images/fogServer.png"></td>
                            <td class="c2" id="down2">-</td>
                            <td class="c2"><input name="edgeNum" type="text" value="1"></td>
                            <td class="c2" id="up2">+</td>
                        </tr>

                        <tr class="row2">
                            <td class="c1"><img class="img1" src="images/mobile.png"></td>
                            <td class="c2" id="down3">-</td>
                            <td class="c2"><input name="mobileNum" type="text" value="1"></td>
                            <td class="c2" id="up3">+</td>
                        </tr>
                    </table>--%>
                </div>
            </div>
            <div id="btn1">
                <button class="action-btn layui-btn layui-btn-radius layui-btn-normal" id="pre1">previous</button>
                <button class="action-btn layui-btn layui-btn-radius layui-btn-normal" id="next1">next</button>
            </div>
        </div>
    </div>

    <%--Select Offloading Strategy选项卡--%>
    <div id="sets2">
        <ul id="nav2">
            <li id="workflow_title2">1.Select Workflow Type</li>
            <li id="document_info2">2.Assign Computing Tasks</li>
            <li id="environment_title2">3.Setting EC Environment</li>
            <li id="strategy_title2" style="color: mediumpurple;">4.Select Offloading Strategy</li>
        </ul>
        <div id="content2">
            <div id="c2">
                <div class="strategy-content-div">
                    <div class="strategy-label" style="width: 170px;font-size:18px;width:180px">Offloading Strategy:</div>
                    <div class="strategy-label" style="margin-left: 10px;margin-left: 40px">
                        <select id="strategy">
                            <option value="0"></option>
                            <%--<option value="1">All-in-Fog</option>--%>
                            <option value="1">All-in-Edge</option>
                            <option value="2">All-in-Cloud</option>
                            <option value="3">Simple</option>
                        </select>
                    </div>
                </div>
                <div class="scheduling-div">
                    Scheduling Algorithms:
                    <button class="layui-btn layui-btn-radius layui-btn-primary" id="setting">Setting</button>
                </div>
                <div class="strategy-content-div">
                    <div class="minmin-input">
                        <input id="minmin" name="alg" type="checkbox" value="MINMIN" class="al_check" checked/> MINMIN
                    </div>
                    <div class="minmin-input">
                        <input type="checkbox" name="alg" value="MAXMIN" class="al_check"/> MAXMIN
                    </div>
                    <div class="minmin-input">
                        <input type="checkbox" name="alg" value="FCFS" class="al_check"/> FCFS
                    </div>
                    <div class="round-input">
                        <input type="checkbox" name="alg" value="ROUNDROBIN" class="al_check"/> ROUNDROBIN
                    </div>
                    <div class="minmin-input">
                        <input type="checkbox" name="alg" value="PSO" class="al_check"/> PSO
                    </div>
                    <div class="ga-input">
                        <input type="checkbox" name="alg" value="GA" class="al_check"/> GA
                    </div>
                </div>
                <div class="strategy-content-div">
                    <div class="scheduling-div">Objective:</div>
                    <div class="radio_option">
                        <div class="radio_input">
                            <input id="time" type="radio" value="0" name="radioGroup" checked="checked" value="Time"/>
                            <label for="time"></label>
                            &nbsp;<span>Time</span>
                        </div>
                        <div class="radio_input">
                            <input id="energy" disabled="true" type="radio" value="1" name="radioGroup"/>
                            <label for="energy"></label>
                            &nbsp;<span>Energy</span>
                        </div>
                        <div class="radio_input" style="margin-left:30px;">
                            <input id="cost" disabled="true" type="radio" value="2" name="radioGroup"/>
                            <label for="cost"></label>
                            &nbsp;<span>Cost</span>
                        </div>
                    </div>
                </div>
                <div class="strategy-content-div"></div>
                <div class="strategy-content-div">
                    <div class="deadline-label">Deadline:</div>
                    <div>
                        <input class="deadline-input" type="text" name="deadline" id="deadline"/>
                        <%--<input name="deadline" style="display: none" type="file" id="import-file"/>--%>
                    </div>
                </div>
                <br>
                <div class="mid">
                    <div id="btn2">
                        <button class="action-btn layui-btn layui-btn-radius layui-btn-normal" id="pre2"  style="position: absolute;left: 40%">previous</button>
                        <button class="action-btn layui-btn layui-btn-radius layui-btn-normal" id="complete"  style="position: absolute;right: 40%">complete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--Select Workflow Type选项卡--%>
    <div id="sets3">
        <ul id="nav3">
            <li id="workflow_title3" style="color: mediumpurple;">1.Select Workflow Type</li>
            <li id="document_info3">2.Assign Computing Tasks</li>
            <li id="environment_title3">3.Setting EC Environment</li>
            <li id="strategy_title3">4.Select Offloading Strategy</li>
        </ul>
        <div id="content3">
            <div id="c3">
                <%--planName--%>
                <div class="strategy-content-div">
                    <div class="deadline-label" style="padding-left:31px;font-size:18px;;width:120px"><span style="color: red">*</span>Plan Name:</div>
                    <div>
                        <input class="deadline-input" type="text" name="planName"/>
                    </div>
                </div>
                <!--工作流类型-->
                <div><%-- class="radio_option"--%>
                    <div class="scheduling-div">
                        <input class="radioGroup3" id="selectScience" type="radio" value="selectScience" name="radioGroup2" checked="checked"/>
                        <span class="radioInput"></span>Example Scientific Workflow:
                    </div>
                    <div class="strategy-content-div1">
                        <div class="radio_option" style="margin-left: 55px">
                            <div class="radio_input">
                                <input id="Montage" type="radio" value="Montage" name="radioGroup1" checked="checked"/>
                                <label for="Montage"></label>
                                &nbsp;<span>Montage</span>
                            </div>
                            <div class="radio_input">
                                <input id="CyberShake" type="radio" value="CyberShake" name="radioGroup1"/>
                                <label for="CyberShake"></label>
                                &nbsp;<span>CyberShake</span>
                            </div>
                            <div class="radio_input" style="margin-left:30px;">
                                <input id="Epigenomics" type="radio" value="Epigenomics" name="radioGroup1"/>
                                <label for="Epigenomics"></label>
                                &nbsp;<span>Epigenomics</span>
                            </div>
                            <div class="radio_input" style="margin-left:30px;">
                                <input id="Inspiral" type="radio" value="Inspiral" name="radioGroup1"/>
                                <label for="Inspiral"></label>
                                &nbsp;<span>Inspiral</span>
                            </div>
                            <div class="radio_input" style="margin-left:30px;">
                                <input id="Sipht" type="radio" value="Sipht" name="radioGroup1"/>
                                <label for="Sipht"></label>
                                &nbsp;<span>Sipht</span>
                            </div>
                            <%--<div class="workflow-type">
                                <input id="Montage" name="work" type="checkbox" value="0" class="al_check" checked/> Montage
                            </div>
                            <div class="workflow-type">
                                <input type="checkbox" name="work" value="1" class="al_check"/> CyberShake
                            </div>
                            <div class="workflow-type">
                                <input type="checkbox"  name="work" value="2" class="al_check"/> Epigenomics
                            </div>
                            <div class="workflow-type">
                                <input type="checkbox"  name="work" value="3" class="al_check"/> Inspiral
                            </div>
                            <div class="workflow-type">
                                <input type="checkbox"  name="work" value="4" class="al_check"/> Sipht
                            </div>--%>
                        </div>
                    </div>
                    <!---->
                    <div class="strategy-content-div1">
                        <div class="strategy-label" style="margin-left: 105px;width: 115px">Tasks Number:</div>
                        <div class="strategy-label" style="margin-left:60px">
                            <select id="strategys">
                                <option value="0">1600</option>
                                <option value="1">1800</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <br>
                    <%--自定义工作流style="display: none"--%>
                    <div id="custom1" class="strategy-content-div1">
                        <div class="strategy-label" style="width:200px">
                            <input  class="radioGroup3" id="selectCustom" type="radio" value="selectCustom" name="radioGroup2"/>
                            <span class="radioInput"></span><span style="font-size: 18px">Custom Workflow:</span>
                        </div>
                        <div class="strategy-label">
                            <select id="custom2" disabled>
                                <option value="0"></option>
                            </select>
                        </div>
                        <button id="draw_workflow" class = "layui-btn layui-btn-radius layui-btn-normal" style="position: relative;top:23%;width:126px;height:30px;background:#75dbed;line-height: 1.5;">Draw Workflow</button>
                    </div>
                </div>
            </div>
            <div id="btn3">
                <button class="action-btn layui-btn layui-btn-radius layui-btn-normal" id="next3">next</button>
            </div>
        </div>
    </div>

    <%--Document Information选项卡--%>
    <div id="sets4">
        <ul id="nav4">
            <li id="workflow_title4">1.Select Workflow Type</li>
            <li id="document_info4"  style="color: mediumpurple;">2.Assign Computing Tasks</li>
            <li id="environment_title4">3.Setting EC Environment</li>
            <li id="strategy_title4">4.Select Offloading Strategy</li>
        </ul>
        <div id="content4" class=" layui-container layui-row">
            <div class="layui-col-xs5 layui-row" style="margin-top: 13px;margin-left: 20px">
                <div class="layui-col-xs12">
                    <button id="left_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">Select All</button>
                </div>
                <div id="main_left" class="layui-col-xs5 main_left layui-row">
                    <%--<div class="layui-col-xs3 item noSelect">1</div>
                    <div class="layui-col-xs3 item noSelect">2</div>
                    <div class="layui-col-xs3 item noSelect">3</div>
                    <div class="layui-col-xs3 item noSelect">4</div>
                    <div class="layui-col-xs3 item noSelect">5</div>
                    <div class="layui-col-xs3 item noSelect">6</div>--%>
                </div>
                <div class="layui-col-xs12">
                    <button id="left_viewDag" type="button" class="layui-btn layui-btn-primary layui-btn-sm">View DAG</button>
                </div>
            </div>
            <div class="layui-col-xs2 layui-row" style="margin-left:45px">
                <div id="dagHelpShow" ></div>
                <div class="layui-col-xs12 btn_div">
                <%--<label class="pkls">pi</label>--%>
                    <label class="pkls">RandomPI Algorithm</label>
                    <button id="pi_left" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                    <button id="pi_right" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                </div>
                <div class="layui-col-xs12 btn_div">
                    <%--<label class="pkls">kmp</label>--%>
                    <label class="pkls">KMP Match Algorithm</label>
                    <button id="kmp_left" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                    <button id="kmp_right" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                </div>
                <div class="layui-col-xs12 btn_div">
                    <%--<label class="pkls">levenshtein</label>--%>
                    <label class="pkls">Levenshtein Algorithm</label>
                    <button id="levenshtein_left" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                    <button id="levenshtein_right" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                </div>
                <div class="layui-col-xs12 btn_div">
                    <%--<label class="pkls">selectsort</label>--%>
                    <label class="pkls">SelectSort Algorithm</label>
                    <button id="selectsort_left" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                    <button id="selectsort_right" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                </div>
            </div>
            <div class="layui-col-xs4 layui-row ">
                <div class="layui-col-xs12 layui-row btn_div">
                    <div class="layui-col-xs12 ">
                        <button id="pi_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">Select All</button>
                    </div>
                    <div id="pi" style="border-top: 0px;" class="layui-col-xs12 ">

                    </div>

                </div>
                <div class="layui-col-xs12 layui-row btn_div">
                    <div class="layui-col-xs12 ">
                        <button id="kmp_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">Select All</button>
                    </div>
                    <div id="kmp" style="border-top: 0px;" class="layui-col-xs12 ">

                    </div>
                </div>
                <div class="layui-col-xs12 btn_div">
                    <div class="layui-col-xs12 ">
                        <button id="levenshtein_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">Select All</button>
                    </div>
                    <div id="levenshtein" style="border-top: 0px;" class="layui-col-xs12 ">

                    </div>
                </div>
                <div class="layui-col-xs12 btn_div">
                    <div class="layui-col-xs12 ">
                        <button id="selectsort_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">Select All</button>
                    </div>
                    <div id="selectsort" style="border-top: 0px;" class="layui-col-xs12 ">

                    </div>
                </div>
            </div>
        </div>
        <div class="unassigned">Unassigned Tasks</div>
        <div class="assigned"> Assigned Tasks</div>
        <div id="btn4">
            <button id="pre4" type="button" class="action-btn layui-btn layui-btn-radius layui-btn-normal">previous</button>
            <button id="submit" type="button" class="action-btn layui-btn layui-btn-radius layui-btn-normal">next</button>
        </div>
    </div>
</div>

</body>
</html>