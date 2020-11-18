<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <script type="text/javascript" src="/jquery/jquery.json2xml.js"></script>
    <script type="text/javascript" src="/jquery/jquery.xml2json.js"></script>
    <script type="text/javascript" src="/js/algorithmsSetting.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/algorithmsSetting.css" />
    <link rel="stylesheet" href="/layui/css/layui.css">
    <title></title>
</head>
<body>
<div class="main">
    <div class="left" >
        <ul class="top">
            <li><span style="font-weight:bold;">Algorithms</span></li>
            <li><span>MinMin</span></li>
            <li><span>MaxMin</span></li>
            <li><span>FCFS</span></li>
            <li><span>RoundRobin</span></li>
            <li id="PSO" class="presentation current"><span>PSO</span></li>
            <li id="GA" class="presentation"><span>GA</span></li>
            <li id="Test" class="presentation hidden"><span>Test</span></li>
        </ul>
        <div class="button">
            <input type="file" style="display: none" name="file" id="add_file">
            <%--<button id="add_btn" type="button" class="btn btn-primary layui-btn layui-btn-radius layui-btn-primary">Add Algorithm</button>--%>
            <button id="add_btn" type="button" class="btn btn-primary layui-btn layui-btn-radius layui-btn-primary add_btn">Add Algorithm</button>
        </div>
    </div>
    <div class="right">
        <div id="PSO_div" class="al_div">
            <div style="font-weight:bold;margin:15px 20px;font-size: 1.2em;">PSO Algorithm Parameter Settings</div>
            <div>
                <table class="top">
                    <tr>
                        <td style="width: 150px;">Number of Particles:</td>
                        <td><input id="PSO-particleNum" xmlName="Number_of_Particles" class="auto-fill-input"></td>
                    </tr>
                    <tr>
                        <td>Number of Iterations:</td>
                        <td><input id="PSO-iterateNum" xmlName="Number_of_Iterations" class="auto-fill-input"></td>
                    </tr>
                    <tr>
                        <td>Learning Factor C1:</td>
                        <td><input id="PSO-c1" class="auto-fill-input" xmlName="Learning_Factor_c1"></td>
                    </tr>
                    <tr>
                        <td>Learning Factor C2:</td>
                        <td><input id="PSO-c2" class="auto-fill-input" xmlName="Learning_Factor_c2"></td>
                    </tr>
                    <tr>
                        <td>Inertia Weight:</td>
                        <td><input id="PSO-w" class="auto-fill-input" xmlName="Inertia_Weight"></td>
                    </tr>
                    <tr>
                        <td>Repeated Experiment:</td>
                        <td><input id="PSO-repeat" class="auto-fill-input" xmlName="Repeated_experiment"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="GA_div" style="display: none" class="al_div">
            <div style="font-weight:bold;margin:15px 20px;font-size: 1.2em;">GA Algorithm Parameter Settings</div>
            <div>
                <table class="top">
                    <tr>
                        <td style="width: 150px;">Population Size:</td>
                        <td><input id="GA-popsize" class="auto-fill-input" xmlName="Population_Size"></td>
                    </tr>
                    <tr>
                        <td>Number of Iterations:</td>
                        <td><input id="GA-gmax" class="auto-fill-input" xmlName="Number_of_Iterations"></td>
                    </tr>
                    <tr>
                        <td>Cross Rate:</td>
                        <td><input id="GA-crossoverProb" class="auto-fill-input" xmlName="Cross_Probability"></td>
                    </tr>
                    <tr>
                        <td>Mutation Rate:</td>
                        <td><input id="GA-mutationRate" class="auto-fill-input" xmlName="Mutation_Probability"></td>
                    </tr>
                    <tr>
                        <td>Repeated Experiment:</td>
                        <td><input id="GA-repeat" class="auto-fill-input" xmlName="Repeated_experiment1`"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="Test_div" style="display: none;" class="al_div">
            <div style="font-weight:bold;margin:15px 20px;font-size: 1.2em;">Test Algorithm Parameter Setting</div>
            <div>
                <table class="top">
                    <tr>
                        <td style="width: 150px;">Setting A:</td>
                        <td><input id="Test_A" class="auto-fill-input" xmlName="Population_Size"></td>
                    </tr>
                    <tr>
                        <td>Setting B:</td>
                        <td><input id="Test_B" class="auto-fill-input" xmlName="Number_of_Iterations"></td>
                    </tr>
                    <tr>
                        <td>Setting C:</td>
                        <td><input id="Test_C" class="auto-fill-input" xmlName="Cross_Probability"></td>
                    </tr>
                    <tr>
                        <td>Setting D:</td>
                        <td><input id="Test_D" class="auto-fill-input" xmlName="Mutation_Probability"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="bottom">
            <%--<button type="button" onclick="settingOK()" class="btn btn-primary">setting OK</button>--%>
            <input type="file" style="display: none" name="file" id="file">
            <%--<button id="export_btn" type="button" class="layui-btn layui-btn-radius layui-btn-primary">Export</button>--%>
            <%--<button id="import_btn" type="button" class="layui-btn layui-btn-radius layui-btn-primary">import</button>--%>
            <button id="export_btn" type="button" class="layui-btn layui-btn layui-btn-radius layui-btn-normal">Export</button>
            <button id="import_btn" type="button" class="layui-btn layui-btn layui-btn-radius layui-btn-normal">Import</button>
        </div>
    </div>
</div>
</body>
<style>
    body{
        margin:0;
        padding:0;
    }
</style>
</html>
