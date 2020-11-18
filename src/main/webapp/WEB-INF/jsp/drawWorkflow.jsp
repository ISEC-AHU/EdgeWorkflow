<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/21 0021
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>draw workflow</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/jquery-ui-1.10.4.min.css">
    <link rel="stylesheet" type="text/css" href="/css/drawWorkflow.css">
</head>
<body>
<%--<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">Montage</li>
        <li>CyberShake</li>
        <li>Epigenomics</li>
        <li>Inspiral</li>
        <li>Sipht</li>
        <li>Other</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <%@ include file="DrawWorkflow/montage.jsp"%>
        </div>
        <div class="layui-tab-item">
            <%@include file="DrawWorkflow/cyberShake.jsp"%>
        </div>
        <div class="layui-tab-item">
            <%@include file="DrawWorkflow/epigenomics.jsp"%>
        </div>
        <div class="layui-tab-item">
            <%@include file="DrawWorkflow/inspiral.jsp"%>
        </div>
        <div class="layui-tab-item">
            <%@include file="DrawWorkflow/sipht.jsp"%>
        </div>
        <div class="layui-tab-item">
            <%@include file="DrawWorkflow/other.jsp"%>
        </div>
    </div>
</div>--%>

<%--<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>--%>

<div class="top_bar">
    <div id="Montage" class="selectAlgo">
        <div class="sameline">
            <div id="mProjectPP" class="operate_node mProjectPP" ></div>
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
    </div>

    <div id="CyberShake" class="selectAlgo" hidden>
        <div class="sameline">
            <div id="extsgt" class="operate_node extsgt" ></div>
            <div>ExtractSGT</div>
        </div>
        <div class="sameline">
            <div id="seissyn" class="operate_node seissyn" ></div>
            <div>SeismogramSynthesis</div>
        </div>
        <div class="sameline">
            <div id="zipseis" class="operate_node zipseis" ></div>
            <div>ZipSeis</div>
        </div>
        <div class="sameline">
            <div id="pvco" class="operate_node pvco" ></div>
            <div>PeakValCalcOkaya</div>
        </div>
        <div class="sameline">
            <div id="zippsa" class="operate_node zippsa" ></div>
            <div>ZipPSA</div>
        </div>
    </div>

    <div id="Epigenomics" class="selectAlgo" hidden>
        <div class="sameline">
            <div id="fastQSplit" class="operate_node fastQSplit" ></div>
            <div>fastQSplit</div>
        </div>
        <div class="sameline">
            <div id="filterContams" class="operate_node filterContams" ></div>
            <div>filterContams</div>
        </div>
        <div class="sameline">
            <div id="sol2sanger" class="operate_node sol2sanger" ></div>
            <div>sol2sanger</div>
        </div>
        <div class="sameline">
            <div id="fastq2bfq" class="operate_node fastq2bfq" ></div>
            <div>fastq2bfq</div>
        </div>
        <div class="sameline">
            <div id="map" class="operate_node map" ></div>
            <div>map</div>
        </div>
        <div class="sameline">
            <div id="mapMerge" class="operate_node mapMerge" ></div>
            <div>mapMerge</div>
        </div>
        <div class="sameline">
            <div id="maqIndex" class="operate_node maqIndex" ></div>
            <div>maqIndex</div>
        </div>
        <div class="sameline">
            <div id="pileup" class="operate_node pileup" ></div>
            <div>pileup</div>
        </div>
    </div>
    <div id="Inspiral" class="selectAlgo" hidden>
        <div class="sameline">
            <div id="tmpltbank" class="operate_node tmpltbank" ></div>
            <div>tmpltBank</div>
        </div>
        <div class="sameline">
            <div id="inspiral_node" class="operate_node inspiral" ></div>
            <div>Inspiral</div>
        </div>
        <div class="sameline">
            <div id="thinca" class="operate_node thinca" ></div>
            <div>Thinca</div>
        </div>
        <div class="sameline">
            <div id="trigbank" class="operate_node trigbank" ></div>
            <div>TrigBank</div>
        </div>

    </div>
    <div id="Sipht" class="selectAlgo" hidden>
        <div class="sameline">
            <div id="patser" class="operate_node patser" ></div>
            <div>Patser</div>
        </div>
        <div class="sameline">
            <div id="srna" class="operate_node srna" ></div>
            <div>SRNA</div>
        </div>
        <div class="sameline">
            <div id="synteny" class="operate_node synteny" ></div>
            <div>Blast_synteny</div>
        </div>
        <div class="sameline">
            <div id="paralogues" class="operate_node paralogues" ></div>
            <div>Blast_paralogues</div>
        </div>
        <div class="sameline">
            <div id="transterm" class="operate_node transterm" ></div>
            <div>Transterm</div>
        </div>
        <div class="sameline">
            <div id="motif" class="operate_node motif" ></div>
            <div>RNA_Motif</div>
        </div>
        <div class="sameline">
            <div id="concate" class="operate_node concate" ></div>
            <div>Patser_Concate</div>
        </div>
        <div class="sameline">
            <div id="candidate" class="operate_node candidate" ></div>
            <div>Blast_Candidate</div>
        </div>
        <div class="sameline">
            <div id="annotate" class="operate_node annotate" ></div>
            <div>SRNA_annotate</div>
        </div>
        <div class="sameline">
            <div id="findterm" class="operate_node findterm" ></div>
            <div>Findterm</div>
        </div>
        <div class="sameline">
            <div id="blast" class="operate_node blast" ></div>
            <div>Blast</div>
        </div>
        <div class="sameline">
            <div id="ffnparse" class="operate_node ffnparse" ></div>
            <div>FFN_Parse</div>
        </div>
        <div class="sameline">
            <div id="qrna" class="operate_node qrna" ></div>
            <div>Blast_QRNA</div>
        </div>
        <div class="sameline">
            <div id="transfer" class="operate_node transfer" ></div>
            <div>Last_transfer</div>
        </div>
    </div>

    <div class="buttons operation">
        <div class="layui-btn-group">
            <button id="montage_save" type="button" class="layui-btn">Save</button>
            <button id="montage_reset" type="button" class="layui-btn">Reset</button>
            <button id="montage_back" type="button" class="layui-btn">Back</button>
        </div>
    </div>
    <div class="select_div operation">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <%--<label class="layui-form-label">选择框</label>--%>
                <div id="choseAlgo" class="layui-input-block algo_select">
                    <select name="city" lay-verify="required">
                        <option value="montage">Montage</option>
                        <option value="cybershake">CyberShake</option>
                        <option value="epigenomics">Epigenomics</option>
                        <option value="inspiral">Inspiral</option>
                        <option value="sipht">Sipht</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="panel" class="panel">
    <%--<div id="item_left" class="item"></div>
    <div id="item_right" class="item" style="left:150px;"></div>--%>

</div>
</body>
<script type="text/javascript" src="/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jquery/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="/jquery/jsplumb.min.js"></script>
<script type="text/javascript" src="/jquery/jsplumb.js"></script>
<script type="text/javascript" src="/js/drawWorkflow.js"></script></body>
</html>