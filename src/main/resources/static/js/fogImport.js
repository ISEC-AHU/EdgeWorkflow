$(document).ready(function () {
    $('ul li').click(function(){
        $("#chooseInput").val($(this).text());
    });

    $("#submit").click(function () {
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        var fileName = $("#chooseInput").val();
        if (fileName) {
            parent.loadXml(fileName);
            parent.layer.close(index);
        } else {
            parent.layer.close(index);
        }
    });
});