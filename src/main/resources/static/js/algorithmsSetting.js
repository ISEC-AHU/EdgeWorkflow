$(document).ready(function () {
    {
        var tabs = ['GA','PSO','Test'];
        // var al_type = '${al_type}';
        var al_type = '';
        // tabChange($("#"+al_type));

        var data = parent.$("#parent_cloud_tips").text();
        var json = eval("("+data+")");
        var pso_json = json["PSO"];
        var ga_json = json["GA"];
        $.ajax({
            url:"/getAlType",
            type:"POST",
            // data:"",
            dataType:"text",
            async: false,
            contentType: "application/json",
            success:function (res) {
                // console.log(res);
                al_type = res;
                tabChange($("#"+al_type));
            },
            error:function () {
                // alert("import error!");
            }
        });
    }

    $(".auto-fill-input").each(function () {
        var id = $(this).attr("id");
        if (id.indexOf("PSO") != -1) {
            $("#" + id).val(pso_json[id]);
        }
        if (id.indexOf("GA") != -1) {
            $("#" + id).val(ga_json[id]);
        }
    });

    $(".auto-fill-input").on('blur', function () {
        var data = parent.$("#parent_cloud_tips").text();
        var json = eval("(" + data + ")");
        var id = $(this).attr("id");
        if (id.indexOf("PSO") != -1) {
            pso_json[id] = $("#" + id).val();
            json["PSO"] = pso_json;
        }
        if (id.indexOf("GA") != -1) {
            ga_json[id] = $("#" + id).val();
            json["GA"] = ga_json;
        }
        parent.$('#parent_cloud_tips').text(JSON.stringify(json));
    });

    function tabChange(ele) {
        $(ele).siblings('li').removeClass('current');
        $(ele).addClass('current');
        var id = $(ele).attr("id");
        for (var i=0; i<tabs.length; i++) {
            $("#"+tabs[i]+"_div").hide();
        }
        $("#"+id+"_div").show();
    }

    $(".presentation").click(function() {
        tabChange(this);
    });

    function fake_click(obj) {
        var ev = document.createEvent("MouseEvents");
        ev.initMouseEvent(
            "click", true, false, window, 0, 0, 0, 0, 0
            , false, false, false, false, 0, null
        );
        obj.dispatchEvent(ev);
    }

    function export_raw(name, data) {
        var urlObject = window.URL || window.webkitURL || window;

        var export_blob = new Blob([data]);

        var save_link = document.createElementNS("http://www.w3.org/1999/xhtml", "a")
        save_link.href = urlObject.createObjectURL(export_blob);
        save_link.download = name;
        fake_click(save_link);
    }

    $("#export_btn").click(function () {
        var id = $(".current").attr("id");
        var json = new Object();
        $(".auto-fill-input").each(function () {
            if ($(this).attr("id").indexOf(id) != -1) {
                var xmlName = $(this).attr("xmlName");
                json[xmlName] = $(this).val();
            }
        });
        var xml_content = $.json2xml(json);
        var reg = /root/g;
        xml_content = xml_content.replace(reg, id);
        var head = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        xml_content = head + xml_content;
        var mydate = new Date();
        var name = id + mydate.toLocaleString() + ".xml";
        export_raw(name, xml_content);
    });

    $("#import_btn").click(function () {
        return $('#file').click();
    });

    $("#file").change(function () {
        var formData = new FormData();
        formData.append("file",$('#file')[0].files[0])
        $.ajax({
            url:"/alImport",
            type:"POST",
            data:formData,
            dataType:"json",
            processData: false,			//对数据不做处理
            cache:false,      				//上传文件不需要缓存
            contentType: false,
            mimeType:"multipart/form-data",
            success:function (data) {
                for(var key in data){
                    for (var k in data[key]) {
                        $("#"+k).val(data[key][k]);
                    }
                }
            },
            error:function () {
                // alert("import error!");
            }
        })
    });

    //Add Algorithm按钮
    $("#add_btn").click(function(){
        $("#Test").removeClass("hidden");
        $("#Test_A").val("1");
        $("#Test_B").val("1");
        $("#Test_C").val("1");
        $("#Test_D").val("1");
    });
});
