
//获取随机数
var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
function generateMixed(n) {
    var res = "";
    for(var i = 0; i < n ; i ++) {
        var id = Math.ceil(Math.random()*35);
        res += chars[id];
    }
    return res;
}

//删除的绝对位置
/*var topDiv = $("#del img").offset().top;    //距离上
var leftDiv = $("#del img").offset().left;    //距离左
$('.sameline .operate_node').draggable({
    proxy:'clone',
    revert:true,
    onStopDrag : function (event){
        var mathR = generateMixed(5);
        $("#panel").append("<div id='"+ this.getAttribute('id') + "_" + mathR +"' class='"+ this.getAttribute("class") +"' style=\"position:absolute;left:"+(event.clientX-40)+"px;top:"+(event.clientY-40)+"px;\"><div>");
        $("#"+this.getAttribute('id') + "_" + mathR).draggable({
            onStopDrag : function (event){
                if(event.clientX > leftDiv && event.clientX < (leftDiv+60) && event.clientY > topDiv && event.clientY < (topDiv+60)){
                    var msg = "您真的确定要删除吗？\n请确认！";
                    if (!confirm(msg)){
                        return;
                    }else{
                        $("#"+this.id).remove();
                    }
                }
            }
        });

    }

});*/

//重置按钮
$("#montage_reset").click(function(){
    $("#panel").html("");
    $("svg").empty();
});

//保存按钮
$("#montage_save").click(function(){

});

//返回按钮
$("#montage_back").click(function(){
    window.location.href = "/";
});

//节点数组 全局变量
var nodeArr = [];



jsPlumb.ready(function () {
    jsPlumb.setContainer('panel');
    var common = {
        isSource: true,
        isTarget: true,
        connector: 'Straight',
        maxConnections: -1,
        endpoint: ['Dot', {
            radius: 3,
            fill: '#ff5722'
        }],
        paintStyle: {
            fill: 'white',
            outlineStroke: 'blue',
            strokeWidth: 1
        },
        hoverPaintStyle: {
            outlineStroke: 'lightblue'
        },
        connectorStyle: {
            outlineStroke: 'green',
            strokeWidth: 1
        },
        connectorHoverStyle: {
            strokeWidth: 1
        }
    }


    /*jsPlumb.addEndpoint('item_left', {
        anchors: ['Right']
    }, common)

    jsPlumb.addEndpoint('item_right', {
        anchor: 'Left'
    }, common)

    jsPlumb.addEndpoint('item_right', {
        anchor: 'Right'
    }, common)*/

    // jsPlumb.draggable('item_right', {containment: 'panel',grid: [10, 10]});

    /*$('#item_left').draggable({
        helper:"clone",
        scope:"ss"
    });
    $('#item_right').draggable({
        helper:"clone",
        scope:"ss"
    });*/


})


$(document).ready(function(){
    //拖动上部节点
    $('.sameline .operate_node').draggable({
        helper:"clone",
        scope:"ss"
    });

    //拖动下部节点
    $('#panel').droppable({
        scope : "ss",
        drop:function(event, ui){
            var left = parseInt(ui.offset.left - $(this).offset().left);
            var top = parseInt(ui.offset.top - $(this).offset().top);
            var id = ui.draggable[0].id;
            var mathR = generateMixed(5);
            id = id + "_" + mathR;
            var elem = event.toElement;
            var class_arr = elem.getAttribute('class').split(' ');

            $("#panel").append("<div id='"+ id +"' onmouseup='edit(this,event)' class='"+ class_arr[0] +" "+ class_arr[1] +"' style=\"position:absolute;left:"+ left +"px;top:"+ (top+80) +"px;\"><div>");

            // 将节点添加到节点数组中
            var map = {};
            map['selfs'] = id;
            map['parents'] = [];
            map['children'] = [];
            /*map['ID'] = '';
            map['nameSpace'] */
            if(id.indexOf("mProjectPP") >= 0){
                var runtime = 13 + Math.random();
                runtime = changeTwoDecimal_f(runtime);
                var fits_input = 4222080;
                var fits_output = 4100000 + parseInt(Math.random()*10000);

                map['runtime'] = runtime;
                map['fits_input'] = fits_input;
                map['fits_output'] = fits_output;
            }else if(id.indexOf("mDiffFit") >= 0){
                var runtime = 10 + Math.random();
                runtime = changeTwoDecimal_f(runtime);
                var max = 50000;
                var min = 10000;
                var fits_output = 200 + parseInt(Math.random() * 100 + 1);
                var diff_output = parseInt(Math.random() * (max - min + 1) + min);

                map['runtime'] = runtime;
                map['fits_input'] = [];
                map['areafits_input'] = [];
                map['fits_output'] = fits_output;
                map['diff_output'] = diff_output;
            }else if(id.indexOf("mConcatFit") >= 0){
                var runtime = Math.random();
                var fits_list_tbl = 163;
                var max = 1000;
                var min = 100;
                var fitstbl_output = 1000 + parseInt(Math.random() * (max - min + 1) + min);
                map['runtime'] = runtime;
                map['fits_list_tbl'] = fits_list_tbl;
                map['fits'] = [];
                map['diff'] = [];
                map['fitstbl_output'] = fitstbl_output;
            }else if(id.indexOf("mBgModel") >= 0){
                var runtime = changeTwoDecimal_f(Math.random());
                var pimagestbl_input = 670;
                var fitstbl_input = '';
                var max = 1000;
                var min = 100;
                var correctionstbl = 1000 + parseInt(Math.random() * (max - min + 1) + min);
                map['pimagestbl_input'] = pimagestbl_input;
                map['fitstbl_input'] = fitstbl_input;
                map['correctionstbl_output'] = correctionstbl;

            }else if(id.indexOf("mBackground") >= 0){
                var runtime = 10 + Math.random();
                runtime = changeTwoDecimal_f(runtime);
                var correctionstbl_input = '';
                var random = 4100000 + parseInt(Math.random()*10000);
                map['runtime'] = runtime;
                map['fits_input'] = random;
                map['areafits_input'] = random;
                map['fits_output'] = random;
                map['areafits_output'] = random;

            }else if(id.indexOf("mImgTbl") >= 0){
                var runtime = 1 + Math.random();
                runtime = changeTwoDecimal_f(rumtime);
                var max = 5000;
                var min = 1000;
                var newcimagestbl_output = parseInt(Math.random() * (max - min + 1) + min);
                map['runtime'] = runtime;
                map['fits'] = [];
                map['areafits'] = [];
                map['newcimagestbl_output'] = newcimagestbl_output;

            }else if(id.indexOf("mAdd") >= 0){
                var runtime = parseInt(Math.random()*10) + Math.random();
                runtime = changeTwoDecimal_f(runtime);
                var hdr_input = 304;
                var newcimagestbl_input = '';
                var max = 100000000;
                var min = 60000000;
                var mosaic_output = parseInt(Math.random() * (max - min + 1) + min);
            }else if(id.indexOf("mShrink") >= 0){

            }else if(id.indexOf("mJPEG") >= 0){

            }
            nodeArr.push(map);
            console.log(nodeArr)



            //源节点
            var common_source = {
                isSource: true,
                isTarget: false,
                connector: 'Straight',
                maxConnections: -1,
                endpoint: ['Dot', {
                    radius: 3,
                    fill: '#ff5722'
                }],
                connectorOverlays: [
                    ['Arrow', {
                        width: 10,
                        length: 10,
                        location: 1
                    }],
                    ['Label', {
                        label: '',
                        cssClass: '',
                        labelStyle: {
                            color: 'red'
                        },
                        events: {
                            click: function (labelOverlay, originalEvent) {
                                console.log('click on label overlay for :' + labelOverlay.component)
                                console.log(labelOverlay)
                                console.log(originalEvent)
                            }
                        }
                    }]
                ],
                paintStyle: {
                    fill: 'white',
                    outlineStroke: 'blue',
                    strokeWidth: 1
                },
                hoverPaintStyle: {
                    outlineStroke: 'lightblue'
                },
                connectorStyle: {
                    outlineStroke: 'green',
                    strokeWidth: 1
                },
                connectorHoverStyle: {
                    strokeWidth: 1
                }
            };
            //目标节点
            var common_target = {
                isSource: false,
                isTarget: true,
                connector: 'Straight',
                maxConnections: -1,
                endpoint: ['Dot', {
                    radius: 3,
                    fill: '#ff5722'
                }],
                connectorOverlays: [
                    ['Arrow', {
                        width: 10,
                        length: 10,
                        location: 1
                    }],
                    ['Label', {
                        label: '',
                        cssClass: '',
                        labelStyle: {
                            color: 'red'
                        },
                        events: {
                            click: function (labelOverlay, originalEvent) {
                                console.log('click on label overlay for :' + labelOverlay.component)
                                console.log(labelOverlay)
                                console.log(originalEvent)
                            }
                        }
                    }]
                ],
                paintStyle: {
                    fill: 'white',
                    outlineStroke: 'blue',
                    strokeWidth: 1
                },
                hoverPaintStyle: {
                    outlineStroke: 'lightblue'
                },
                connectorStyle: {
                    outlineStroke: 'green',
                    strokeWidth: 1
                },
                connectorHoverStyle: {
                    strokeWidth: 1
                }
            };

            jsPlumb.addEndpoint(id, {
                anchors: ['Top']
            }, common_target);
            jsPlumb.addEndpoint(id, {
                anchors: ['Bottom']
            }, common_source);

            // jsPlumb.draggable(id);
            // $("#" + id).draggable({containment:"parent"});
            jsPlumb.draggable(id , {containment: 'panel',grid: [10, 10]});
            // console.log(event);
            // console.log(ui);
        }
    });
    //连接事件
    jsPlumb.bind("connection", function (connInfo, originalEvent) {
        // console.log(connInfo);
        // console.log(originalEvent);
        // console.log(connInfo.connection.sourceId);
        // console.log(connInfo.connection.sourceId);
        var sourceId = connInfo.connection.sourceId;
        var targetId = connInfo.connection.targetId;
        if (connInfo.connection.sourceId == connInfo.connection.targetId) {
            jsPlumb.detach(connInfo);

            alert("不能连接自己！");
        }else{
            // alert("连接"+connInfo.connection.sourceId+"==="+connInfo.connection.targetId);
        }
        /*var flag = false;
        var item = -1;
        if(nodeArr.length == 0){
            var map = {};
            map['selfs'] = sourceId;
            map['children'] = targetId;
            map['parents'] ='';
            nodeArr.push(map);
        }else{
            for(var i = 0; i < nodeArr.length; i++){
                var selfs = nodeArr[i].selfs;
                var children = nodeArr[i].children;
                if(sourceId == selfs){
                    flag = true;
                    item = i;
                    break;
                }

            }
            if(flag){
                var selfs = nodeArr[item].selfs;
                var children = nodeArr[item].children;
                nodeArr[item].children += " " + targetId;
            }else{
                var map = {};
                map['selfs'] = sourceId;
                map['children'] = targetId;
                map['parents'] ='';
                nodeArr.push(map);
            }
        }*/
        // console.log(getJsonLength(nodeArr));
        for(var i = 0; i < getJsonLength(nodeArr); i++){
            var node = nodeArr[i];
            var selfs = node['selfs'];
            var children = node['children'];
            var parents = node['parents'];

            if(selfs == sourceId){
                children.push(targetId);
            }
            if(selfs == targetId) {
                parents.push(sourceId);
            }
        }
        // console.log(nodeArr);

        /*var map = {};
        map['selfs'] = sourceId;
        map['children'] = targetId;
        map['parents'].append(targetId);
        nodeArr.push(map);*/
        // console.log(nodeArr);
    });

    //选择算法
    /*$("#choseAlgo").click(function(){
        var chosen = $('.layui-this').text();
        layer.msg(chosen);
    });*/
    var currentAlgo = "Montage";
    $('#choseAlgo dd').click(function(){
        var id = $('.layui-this').text();
        if(currentAlgo == id){
            return;
        }
        else{
            console.log(id);
            $('.selectAlgo').hide();
            $('#' + id).show();
            $("#panel").html('');
            console.log(nodeArr);
            nodeArr.splice(0);
            console.log(nodeArr);
            currentAlgo = id;
        }

    });

});

//获取json的长度
function getJsonLength(jsonData) {
    var length =0;
    for(var ever in jsonData) {
        length++;
    }
    return length;
}

// 禁用网页右键事件
$(document).bind("contextmenu",function(e){
    return false;
});
//右键出现编辑菜单
function edit(obj, event){
    $("#editDiv").remove();
    var top = $(obj).offset().top + 30 + 'px';
    var left = $(obj).offset().left + 30 + 'px';
    if(event.button == 2){
        var edit_panel = '<div id="editDiv" class="editDiv " style="position: absolute;left:' + left + ';top:' + top +';">' +
            '<div><button id="editBtn" class="editBtn layui-btn layui-btn-primary layui-btn-xs" value="'+ $(obj).attr('id') +'">Edit</button></div>' +
            '<div><button id="delBtn" class="delBtn layui-btn layui-btn-primary layui-btn-xs" value="'+ $(obj).attr('id') +'">Delete</button></div>' +
            '</div>';
        $('#panel').append(edit_panel);
    }

}

//编辑按钮
$(document).on('click','#editBtn',function(){
    var nodeType = $(this).val().split("_")[0].substring(0);
    layer.open({
        type: 2
        , offset: "140px"
        , title: "Edit"
        , content: "/node_edit?nodetype=" + nodeType
        , skin: 'title-style'
        , area: ['600px', '580px']
        ,cancel: function(){
            // feedSetting();
        }
    });
});

//删除按钮
$(document).on('click','#delBtn',function(){
    var id = $(this).val();
    console.log(id);
    console.log(nodeArr);
    jsPlumb.remove(id);
    // 删除数组中父子节点的关系
    for(var i = 0; i < getJsonLength(nodeArr); i++){
        var node = nodeArr[i];
        var selfs = node['selfs'];

        var children = node['children'];
        var parents = node['parents'];
        console.log(children);
        console.log(parents);
        for(var j = 0 ; j < children.length; j++){
            var child = children[j];
            if(child == id){
                nodeArr[i]['children'].splice(j,1);
            }
        }
        for(var k = 0; k < parents.length; k++){
            var parent = parents[k];
            if(parent == id){
                nodeArr[i]['parents'].splice(k,1);
            }
        }
    }
    //数组中删除节点
    for(var i = 0; i < nodeArr.length; i++){
        var node = nodeArr[i];
        var selfs = node['selfs'];
        if(selfs == id){
            nodeArr.splice(i,1);
        }
    }
    // console.log(nodeArr);

});

//点击其他位置，删除编辑菜单
$('#panel').click(function(){
    $("#editDiv").remove();
});

/*document.oncontextmenu = function(){return false};     //禁止鼠标右键菜单显示
var res = document.getElementById('panel');      //找到id为box的div
document.body.onmouseup = function(e){     //在body里点击触发事件
    if(e.button===2){       //如果button=1（鼠标左键），button=2（鼠标右键），button=0（鼠标中间键）
        console.log(e);     //将传进去的参数打印出来
        console.log(e.offsetY);     //打印出鼠标点击的Y轴坐标
        console.log(e.offsetX);     //打印出鼠标点击的X轴坐标
        res.style.top = e.offsetY+'px';     //鼠标点击时给div定位Y轴
        res.style.left = e.offsetX+'px';    //鼠标点击时给div定位X轴
        res.style.display = 'block';        //显示div盒子
    }else{
        res.style.display = 'none';         //否则不显示div盒子
    }

}*/

function changeTwoDecimal_f(x) {
    var f_x = parseFloat(x);
    if (isNaN(f_x)) {
        alert('function:changeTwoDecimal->parameter error');
        return false;
    }
    var f_x = Math.round(x * 100) / 100;
    var s_x = f_x.toString();
    var pos_decimal = s_x.indexOf('.');
    if (pos_decimal < 0) {
        pos_decimal = s_x.length;
        s_x += '.';
    }
    while (s_x.length <= pos_decimal + 2) {
        s_x += '0';
    }
    return s_x;
}






















