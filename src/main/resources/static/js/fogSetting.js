
var cloud_mips_list = [];
var cloud_cost_list = [];
var fog_mips_list = [];
var fog_cost_list = [];
var mobile_mips_list = [];

var cloud_number;
var fog_number;
var mobile_number;


function initFogSetting() {
    // debugger
    var data = parent.$("#parent_cloud_tips").text();
    var json = eval("("+data+")");

    cloud_mips_list = json["cloud_mips_list"];
    cloud_cost_list = json["cloud_cost_list"];
    fog_mips_list = json["fog_mips_list"];
    fog_cost_list = json["fog_cost_list"];
    mobile_mips_list = json["mobile_mips_list"];

    cloud_number = json["cloud_number"];
    fog_number = json["fog_number"];
    mobile_number = json["mobile_number"];

    var cloud_html = '';
    for (var i=0; i<cloud_number; i++) {
        cloud_html += '<div class="container-div" id="cloud"'+ i +'>' +
            '<img class="cloud-img" src="/images/cloudServer.png">\n' +
            '            <div class="cloud-div">' +
            '                <div class="host-div">Host-'+i+'</div>' +
            '                <div class="mips-div">' +
            '                    <div class="mips-title">MIPS</div>' +
            '                    <input id="cloud-mips'+i+'" type="text" value="' + cloud_mips_list[i] + '"/>' +
            '                </div>' +
            '                <div class="cost-div">' +
            '                    <div class="cost-title">Cost</div>' +
            '                    <input id="cloud-cost'+i+'" type="text" value="' + cloud_cost_list[i] + '"/>' +
            '                </div>' +
            '            </div>'
            +'</div>';
        /*$("#cloud"+i).html('<img class="cloud-img" src="/images/cloudServer.png">\n' +
            '            <div class="cloud-div">' +
            '                <div class="host-div">Host-'+i+'</div>' +
            '                <div class="mips-div">' +
            '                    <div class="mips-title">MIPS</div>' +
            '                    <input id="cloud-mips'+i+'" type="text"/>' +
            '                </div>' +
            '                <div class="cost-div">' +
            '                    <div class="cost-title">Cost</div>' +
            '                    <input id="cloud-cost'+i+'" type="text"/>' +
            '                </div>' +
            '            </div>');*/

        /*$("#cloud-mips"+i).val(cloud_mips_list[i]);
        $("#cloud-cost"+i).val(cloud_cost_list[i]);*/
    }
    for (var i = cloud_number; i < Math.ceil(cloud_number/5)*5; i++) {
        cloud_html += '<div class="container-div">' +
            "<img class=\"disabled-img\" src=\"/images/disabled.png\">"
            + '</div>'
    }
    $("#cloudServers").html(cloud_html);

    var fog_html = '';
    for (var i=0; i<fog_number; i++) {
        fog_html += '<div class="container-div" id="fog"'+ i +'>' +
            '<img class="cloud-img" src="/images/fogServer.png">' +
            '            <div class="cloud-div">' +
            '                <div class="host-div">Host-'+i+'</div>' +
            '                <div class="mips-div">' +
            '                    <div class="mips-title">MIPS</div>' +
            '                    <input id="fog-mips'+i+'" type="text" value="' + fog_mips_list[i] + '"/>' +
            '                </div>' +
            '                <div class="cost-div">' +
            '                    <div class="cost-title">Cost</div>' +
            '                    <input id="fog-cost'+i+'" type="text" value="' + fog_cost_list[i] + '"/>' +
            '                </div>' +
            '            </div>'
            + '</div>';
        /*$("#fog"+i).html('<img class="cloud-img" src="/images/fogServer.png">' +
            '            <div class="cloud-div">' +
            '                <div class="host-div">Host-'+i+'</div>' +
            '                <div class="mips-div">' +
            '                    <div class="mips-title">MIPS</div>' +
            '                    <input id="fog-mips'+i+'" type="text"/>' +
            '                </div>' +
            '                <div class="cost-div">' +
            '                    <div class="cost-title">Cost</div>' +
            '                    <input id="fog-cost'+i+'" type="text"/>' +
            '                </div>' +
            '            </div>');*/
        /*$("#fog-mips"+i).val(fog_mips_list[i]);
        $("#fog-cost"+i).val(fog_cost_list[i]);*/
    }
    for (var i = fog_number; i < Math.ceil(fog_number/5)*5; i++) {
        fog_html += '<div class="container-div">' +
            "<img class=\"disabled-img\" src=\"/images/disabled.png\">"
            + '</div>'
    }
    $("#fogNodes").html(fog_html);

    var mobile_html = '';
    for (var i=0; i<mobile_number; i++) {
        mobile_html += '<div class="container-div" id="mobile"'+ i +'>'+
            '<img class="mobile-img" src="/images/mobile.png">' +
            '            <div class="cloud-div">' +
            '                <div class="host-div">Host-'+i+'</div>' +
            '                <div class="mips-div">' +
            '                    <div class="mips-title">MIPS</div>' +
            '                    <input id="mobile-mips'+i+'" type="text" value="' + mobile_mips_list[i] + '"/>' +
            '                </div>' +
            '            </div>'
            +'</div>';
        /*$("#mobile"+i).html('<img class="mobile-img" src="/images/mobile.png">' +
            '            <div class="cloud-div">' +
            '                <div class="host-div">Host-'+i+'</div>' +
            '                <div class="mips-div">' +
            '                    <div class="mips-title">MIPS</div>' +
            '                    <input id="mobile-mips'+i+'" type="text"/>' +
            '                </div>' +
            '            </div>');*/
        //$("#mobile-mips"+i).val(mobile_mips_list[i]);
    }
    for (var i=mobile_number; i< Math.ceil(mobile_number/5)*5; i++) {
        mobile_html += '<div class="container-div">' +
            "<img class=\"disabled-img\" src=\"/images/disabled.png\">"
            + '</div>'
    }
    $("#endDevices").html(mobile_html);

    /*
    <img class="cloud-img" src="/images/cloudServer.jpg">
    <div class="cloud-div">
        <div class="host-div">Host-1</div>
        <div class="mips-div">
            <div class="mips-title">Mips</div>
            <input id="cloud-mips0" type="text"/>
        </div>
        <div class="cost-div">
            <div class="cost-title">Cost</div>
            <input id="cloud-cost0" type="text"/>
        </div>
    </div>
    * */
    // var a = cloud_number/5.0;
    /*for (var i = cloud_number; i < Math.ceil(cloud_number/5)*5; i++) {
        $("#cloud"+i).html("<img class=\"disabled-img\" src=\"/images/disabled.png\">");
    }
    for (var i=fog_number; i < Math.ceil(fog_number/5)*5; i++) {
        $("#fog"+i).html("<img class=\"disabled-img\" src=\"/images/disabled.png\">");
    }
    for (var i=mobile_number; i< Math.ceil(mobile_number/5)*5; i++) {
        $("#mobile"+i).html("<img class=\"disabled-img\" src=\"/images/disabled.png\">");
    }*/
}

$(document).ready(function () {

    initFogSetting();

    $("#import-btn").click(function () {
        layer.open({
            type: 2
            , title: "Select Setting File"
            , content: "/fogImport"
            , skin: 'title-style'
            , area: ['400px', '300']
        });
    });

    $(":input").on('blur',function(){
        var data = parent.$("#parent_cloud_tips").text();
        var json = eval("("+data+")");
        var input_id = $(this).attr('id');
        var input_value = $(this).val();
        var index = parseInt(input_id.substr(input_id.length-1, 1));
        var list_type = input_id.substr(0, input_id.length-1);
        if (list_type == 'cloud-mips') {
            cloud_mips_list[index] = parseInt(input_value);
            json["cloud_mips_list"] = cloud_mips_list;
        }
        if (list_type == 'cloud-cost') {
            cloud_cost_list[index] = parseFloat(input_value);
            json["cloud_cost_list"] = cloud_cost_list;
        }
        if (list_type == 'fog-mips') {
            fog_mips_list[index] = parseInt(input_value);
            json["fog_mips_list"] = fog_mips_list;
        }
        if (list_type == 'fog-cost') {
            fog_cost_list[index] = parseFloat(input_value);
            json["fog_cost_list"] = fog_cost_list;
        }
        if (list_type == 'mobile-mips') {
            mobile_mips_list[index] = parseInt(input_value);
            json["mobile_mips_list"] = mobile_mips_list;
        }
        parent.$('#parent_cloud_tips').text(JSON.stringify(json));
    })
});

function loadXml(fileName) {
    $.ajax({
        type:"get",
        url:"xml/environment-setting/"+fileName,
        dataType:"xml",
        timeout:1000,
        cache:false,
        success:function(xml){
            var data = parent.$("#parent_cloud_tips").text();
            var json = eval("("+data+")");
            $(xml).find("Cloud").each(function(){
                cloud_number = $(this).attr("hostnum");
                cloud_bandwidth = $(this).attr("bandwidth");
                json["cloud_number"] = parseInt(cloud_number);
                json["cloud_bandwidth"] = parseInt(cloud_bandwidth);
                cloud_mips_list = [];
                cloud_cost_list = [];
                $(this).find("host").each(function (i) {
                    var mips = $(this).attr("MIPS");
                    var cost = $(this).attr("cost");
                    cloud_mips_list[i] = parseInt(mips);
                    cloud_cost_list[i] = parseFloat(cost);
                });
                json["cloud_mips_list"] = cloud_mips_list;
                json["cloud_cost_list"] = cloud_cost_list;
            });
            $(xml).find("FogNode").each(function(){
                fog_number = $(this).attr("hostnum");
                var fog_bandwidth = $(this).attr("bandwidth");
                json["fog_number"] = parseInt(fog_number);
                json["fog_bandwidth"] = parseInt(fog_bandwidth);
                fog_mips_list = [];
                fog_cost_list = [];
                $(this).find("host").each(function (i) {
                    var mips = $(this).attr("MIPS");
                    var cost = $(this).attr("cost");
                    fog_mips_list[i] = parseInt(mips);
                    fog_cost_list[i] = parseFloat(cost);
                });
                json["fog_mips_list"] = fog_mips_list;
                json["fog_cost_list"] = fog_cost_list;
            });
            $(xml).find("EndDevice").each(function(){
                mobile_number = $(this).attr("hostnum");
                var mobile_bandwidth = $(this).attr("bandwidth");
                json["mobile_number"] = parseInt(mobile_number);
                json["mobile_bandwidth"] = parseInt(mobile_bandwidth);
                mobile_mips_list = [];
                mobile_cost_list = [];
                $(this).find("host").each(function (i) {
                    var mips = $(this).attr("MIPS");
                    var cost = $(this).attr("cost");
                    mobile_mips_list[i] = parseInt(mips);
                    mobile_cost_list[i] = parseFloat(cost);
                });
                json["mobile_mips_list"] = mobile_mips_list;
                json["mobile_cost_list"] = mobile_cost_list;
            });
            parent.$('#parent_cloud_tips').text(JSON.stringify(json));
            initFogSetting();
        }
    });
}
