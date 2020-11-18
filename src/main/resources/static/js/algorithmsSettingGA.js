function settingOK() {
    $.ajax({
        url:"/algorithmsSetting/setGA",
        type:"post",
        data:$("#inputForm").serialize(),
        dataType:"json",
        success:function (data) {
            if(data.result==1){
                alert("Setting success!");
            }
        },
        error:function () {
            alert("Setting error!");
        }
    });
}
//下载GA
function download() {
    location.href="/algorithmsSetting/downloadGA";
}
//上传GA
function upload() {
    var formData = new FormData();
    formData.append("file",$('#file')[0].files[0])
    $.ajax({
        url:"/algorithmsSetting/uploadGA",
        type:"POST",
        data:formData,
        dataType:"json",
        processData: false,			//对数据不做处理
        cache:false,      				//上传文件不需要缓存
        contentType: false,
        mimeType:"multipart/form-data",
        success:function (data) {
            alert("import success!");
            location.reload();
        },
        error:function () {
            alert("import error!");
        }
    })
}