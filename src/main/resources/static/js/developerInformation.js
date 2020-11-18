$(document).ready(function(){
    /*var map1 = {developer_name:"Xiao Liu", school:"Deakin University", email:"xiao.liu@deakin.edu.au"};
    var map2 = {developer_name:"Lingmin Fan", school:"Anhui University", email:"870138190@qq.com"};
    var map3 = {developer_name:"Jia Xu", school:"Anhui University", email:"xujia_ahu@qq.com"};
    var map4 = {developer_name:"Xuejun Li", school:"Anhui University", email:"xjli@ahu.edu.cn"};
    var map5 = {developer_name:"Lina Gong", school:"Anhui University", email:"Linagln@qq.com"};
    var map6 = {developer_name:"John Grundy", school:"Monash University", email:"john.grundy@monash.edu"};
    var map7 = {developer_name:"Yun Yang", school:"Swinburne University of Technology", email:"yyang@swin.edu.au"};
    var list = [];
    list.push(map1);
    list.push(map2);
    list.push(map3);
    list.push(map4);
    list.push(map5);
    list.push(map6);
    list.push(map7);
    var developer_tb = $("#developer_tb");
    var html = "";
    for(var i = 0; i < list.length; i++){
        var map = list[i];
        var developer_name = map['developer_name'];
        var school = map['school'];
        var email = map['email'];
        // var html = "";
        html += "<tr>";
        html +=     "<td>"+ developer_name +"</td>";
        html +=     "<td>"+ school +"</td>";
        html +=     "<td>"+ email +"</td>";
        html += "</tr>";
    }
    developer_tb.html(html);*/
    $(document).ready(function(){
        $.ajax({
            url:"/getDevelopers",
            type:"POST",
            data:'',
            dataType:'text',
            processData: false,
            cache:false,
            contentType: 'application/json',
            mimeType:"multipart/form-data",
            success:function (res) {
                // console.log(res);
                var developers = eval("("+res+")");
                console.log(developers);
                var developer_tb = $("#developer_tb");
                var html = "";
                for(var i = 0; i < developers.length; i++){
                    var map = developers[i];
                    var developer_name = map['name'];
                    var school = map['university'];
                    var email = map['email'];
                    // var html = "";
                    html += "<tr>";
                    html +=     "<td>"+ developer_name +"</td>";
                    html +=     "<td>"+ school +"</td>";
                    html +=     "<td>"+ email +"</td>";
                    html += "</tr>";
                }
                developer_tb.html(html);
            },
            error:function (res) {
                console.log(res);
            }
        })
    });
});