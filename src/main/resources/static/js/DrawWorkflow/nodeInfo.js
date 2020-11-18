//nodeInfo.js

$(document).ready(function(){
    var nodeType = '';
    //获取节点类型
    $.ajax({
        url:"/getnodeType",
        type:"POST",
        data:"",
        dataType:"text",
        async:false,
        contentType:"application/json",
        success:function (res) {
            console.log(res);
            $(".items").hide();
            $("." + res).show()
            nodeType = res;
        },
        error:function(res){
            layer.msg("Failed to obtain user information!");
        }
    });
    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引



//给父页面传值
    $('#node_save').on('click', function(){
        parent.layer.tips('Look here', '#parentIframe', {time: 5000});
        parent.layer.close(index);
    });
//关闭iframe
    $('#node_close').click(function(){

        parent.layer.msg('您将标记 [ ' + '111' + ' ] 成功传送给了父窗口');
        parent.layer.close(index);
    });

});
