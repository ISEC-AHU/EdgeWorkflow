<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/8 0008
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Montage</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/jquery-ui-1.10.4.min.css">
    <link rel="stylesheet" type="text/css" href="/css/DrawWorkflow/montage.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<%--<body>
    &lt;%&ndash;工作流模板&ndash;%&gt;
    &lt;%&ndash;<div>
        <iframe src="http://localhost:2333/#/" width="100%" height="100%" scrolling="no" frameborder="0"></iframe>
    </div>&ndash;%&gt;
    montage workflow
    <div class="container">
        <header class="htmleaf-header">
            <h1>实现svg拖拽的js插件-svg.draggable.js <span>An extension for the svg.js library to make elements draggable</span></h1>
            <div class="htmleaf-links">
                <a class="htmleaf-icon icon-home" href="http://www.htmleaf.com/" title="jQuery之家" target="_blank"><span> jQuery之家</span></a>
                <a class="htmleaf-icon icon-arrow-right3" href="http://www.htmleaf.com/html5/SVG/201501311304.html" title="返回下载页" target="_blank"><span> 返回下载页</span></a>
            </div>
        </header>
        <div class="content bgcolor-8">
            <div id="drawing"></div>
        </div>
    </div>



</body>--%>
    <body>
        <div class="top_bar">
                <div class="sameline">
                    <div id='mProjectPP' class="operate_node mProjectPP" ></div>
                    <div>mProjectPP</div>
                </div>
                <div class="sameline">
                    <div id='mDiffFit' class="operate_node mDiffFit" ></div>
                    <div>mDiffFit</div>
                </div>
                <div class="sameline">
                    <div id='mConcatFit' class="operate_node mConcatFit" ></div>
                    <div>mConcatFit</div>
                </div>
                <div class="sameline">
                    <div id='mBgModel' class="operate_node mBgModel" ></div>
                    <div>mBgModel</div>
                </div>
                <div class="sameline">
                    <div id='mBackground' class="operate_node mBackground" ></div>
                    <div>mBackground</div>
                </div>
                <div class="sameline">
                    <div id='mImgTbl' class="operate_node mImgTbl" ></div>
                    <div>mImgTbl</div>
                </div>
                <div class="sameline">
                    <div id='mAdd' class="operate_node mAdd" ></div>
                    <div>mAdd</div>
                </div>
                <div class="sameline">
                    <div id='mShrink' class="operate_node mShrink" ></div>
                    <div>mShrink</div>
                </div>
                <div class="sameline">
                    <div id='mJPEG' class="operate_node mJPEG" ></div>
                    <div>mJPEG</div>
                </div>
                <div class="sameline">
                    <div id="del" title="移到这里删除"><img src="/images/del.png"></div>
                </div>

               <div class="buttons">
                   <div class="layui-btn-group">
                       <button id="montage_save" type="button" class="layui-btn">保存</button>
                       <button id="montage_reset" type="button" class="layui-btn">重置</button>
                   </div>
               </div>
        </div>
        <div id="panel" class="panel">
            <div id="item_left" class="item"></div>
            <div id="item_right" class="item" style="left:150px;"></div>
        </div>
    </body>
<script type="text/javascript" src="/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jquery/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="/jquery/jsplumb.min.js"></script>
<script type="text/javascript" src="/js/DrawWorkflow/montage.js"></script>
</html>
