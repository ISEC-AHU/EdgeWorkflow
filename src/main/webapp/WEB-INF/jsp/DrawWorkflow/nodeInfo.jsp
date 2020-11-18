<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/27 0027
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>nodeInfo</title>
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/DrawWorkflow/nodeInfo.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/DrawWorkflow/nodeInfo.css">
</head>
<body>
<div class="items mProjectPP">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="13.55" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">hdr-size_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="304" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">fits-size_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="4152942" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">output_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="4152942" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
</div>
<div class="items mDiffFit">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="10.80" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">hdr-size_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="304" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">fits-size_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="4150670" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">fits-size_out</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="4174190" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">fittxt-output_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="275" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">diff_output_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="214654" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
</div>
<div class="items mConcatFit">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="0.48" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">tbl_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="163" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <%--mdifffit的diff 和fit信息--%>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">tbl_out</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="1259" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
</div>
<div class="items mBgModel">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="0.77" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">pimages.tbl-size_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="670" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">fits.tbl_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="1259" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">corrections.tbl_output</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="212" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
</div>
<div class="items mBackground">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="10.81" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">corrections.tbl_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="212" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">input_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="4146170" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">output_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="4146170" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
</div>
<div class="items mImgTbl">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="1.48" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">tbl_input_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="670" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <%--mBackground节点信息--%>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">newtbl_output_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="1516" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
</div>
<div class="items mAdd">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="2.40" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">hdr-size_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="304" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">newtbl_input</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="1516" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">mosaic_output_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="49036914" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
</div>
<div class="items mShrink">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="3.45" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">mosaic_input_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="49036914" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">shrunken_output_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="1962261" autocomplete="off" class="layui-input node_input">
        </div>
    </div>

</div>
<div class="items mJPEG">
    <div class="layui-form-item">
        <label class="layui-form-label node_label">runtime</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="0.35" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">shrunken_input_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="1962261" autocomplete="off" class="layui-input node_input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label node_label">shrunkenjpg_output_size</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="required" placeholder="181372" autocomplete="off" class="layui-input node_input">
        </div>
    </div>

</div>
<div class="layui-btn-group">
    <button id="node_save" type="button" class="layui-btn layui-btn-radius layui-btn-primary">Save Change</button>
    <button id="node_reset" type="button" class="layui-btn layui-btn-radius layui-btn-primary">Reset</button>
    <button id="node_close" type="button" class="layui-btn layui-btn-radius layui-btn-primary">Close</button>
</div>
</body>
</html>
