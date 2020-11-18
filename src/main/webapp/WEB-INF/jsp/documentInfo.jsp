<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/2 0002
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Document Information</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/jquery-ui-1.10.4.min.css">
</head>
<body>
Document Info
<%--<div class="layui-container">
    <div class="layui-row main-container">
        <div id="main_left" class="layui-col-xs5 main_left layui-row">
            <div class="layui-col-xs12">
                <button id="left_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">select all</button>
            </div>
            &lt;%&ndash;<div class="layui-col-xs3 item noSelect">1</div>
            <div class="layui-col-xs3 item noSelect">2</div>
            <div class="layui-col-xs3 item noSelect">3</div>
            <div class="layui-col-xs3 item noSelect">4</div>
            <div class="layui-col-xs3 item noSelect">5</div>
            <div class="layui-col-xs3 item noSelect">6</div>&ndash;%&gt;
        </div>
        <div class="layui-col-xs2 main_move layui-row">
            <div class="layui-col-xs12 btn_div">
                <label>pipipipipipi</label>
                <button id="pi_left" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                <button id="pi_right" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                <button id="submit" type="button" class="layui-btn layui-btn-primary layui-btn-sm">submit</button>
            </div>
            <div class="layui-col-xs12 btn_div">
                <label>kmpkmpkmp</label>
                <button id="kmp_left" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                <button id="kmp_right" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
            </div>
            <div class="layui-col-xs12 btn_div">
                <label>levenshtein</label>
                <button id="levenshtein_left" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                <button id="levenshtein_right" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
            </div>
            <div class="layui-col-xs12 btn_div">
                <label>selectsort</label>
                <button id="selectsort_left" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
                <button id="selectsort_right" type="button" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon"></i></button>
            </div>
        </div>
        <div class="layui-col-xs5 main_classify layui-row">
            <div id="pi" class="layui-col-xs12">
                <div class="layui-col-xs12">
                    <button id="pi_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">select all</button>
                </div>
            </div>
            <div id="kmp" class="layui-col-xs12">
                <div class="layui-col-xs12">
                    <button id="kmp_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">select all</button>
                </div>
            </div>
            <div id="levenshtein" class="layui-col-xs12">
                <div class="layui-col-xs12">
                    <button id="levenshtein_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">select all</button>
                </div>
            </div>
            <div id="selectsort" class="layui-col-xs12">
                <div class="layui-col-xs12">
                    <button id="selectsort_selectAll" type="button" class="layui-btn layui-btn-primary layui-btn-sm">select all</button>
                </div>
            </div>
        </div>
    </div>
</div>--%>

<%--<div data-num='2' class="a1">33333</div>--%>
<%--<div data-num='3' class="a1">33333</div>--%>
<%--<div data-num='3' class="a1">33333</div>--%>
<%--<div data-num='3' class="a1">33333</div>--%>

</body>
<script type="text/javascript" src="/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/layui/layui.js"></script>
<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    /*layui.use('element', function(){
        var element = layui.element;

        //…
    });*/
    /*$(document).ready(function(){
        var html = "";
        for(var i = 0; i< 90 ; i++){
            html += "<div class=\"layui-col-xs3 item noSelect\">" + i + "</div>";
        }
        $("#main_left").append(html);

        //work对象点击
        $(document).on("click", ".item", function(){
            if($(this).hasClass("noSelect")){
                $(this).removeClass("noSelect");
                $(this).addClass("isSelect");
            }else{
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
            }

        });

        //pi移动
        $("#pi_left").click(function(){
            $("#pi").find(".isSelect").each(function(){
                $(this).remove();
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
                $("#main_left").append($(this));
                // console.log($(this).text());
            });
        });
        $("#pi_right").click(function(){
            $("#main_left").find(".isSelect").each(function(){
                $(this).remove();
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
                $("#pi").append($(this));
                // console.log($(this).text());
            });
        });

        //kmp移动
        $("#kmp_left").click(function(){
            $("#kmp").find(".isSelect").each(function(){
                $(this).remove();
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
                $("#main_left").append($(this));
                // console.log($(this).text());
            });
        });
        $("#kmp_right").click(function(){
            $("#main_left").find(".isSelect").each(function(){
                $(this).remove();
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
                $("#kmp").append($(this));
                // console.log($(this).text());
            });
        });

        //levenshtein移动
        $("#levenshtein_left").click(function(){
            $("#levenshtein").find(".isSelect").each(function(){
                $(this).remove();
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
                $("#main_left").append($(this));
                // console.log($(this).text());
            });
        });
        $("#levenshtein_right").click(function(){
            $("#main_left").find(".isSelect").each(function(){
                $(this).remove();
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
                $("#levenshtein").append($(this));
                // console.log($(this).text());
            });
        });

        //selectsort移动
        $("#selectsort_left").click(function(){
            $("#selectsort").find(".isSelect").each(function(){
                $(this).remove();
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
                $("#main_left").append($(this));
                // console.log($(this).text());
            });
        });
        $("#selectsort_right").click(function(){
            $("#main_left").find(".isSelect").each(function(){
                $(this).remove();
                $(this).removeClass("isSelect");
                $(this).addClass("noSelect");
                $("#selectsort").append($(this));
                // console.log($(this).text());
            });
        });

        //全选按钮
        $("#left_selectAll").click(function(){

            var item = $("#main_left").find(".item").length;
            var isSelect = $("#main_left").find(".isSelect").length;
            var noSelect = $("#main_left").find(".noSelect").length;
            if(item > isSelect){
                $("#main_left").find(".noSelect").each(function(){
                    $(this).removeClass("noSelect");
                    $(this).addClass("isSelect");
                });
            }
            if(item == isSelect){
                $("#main_left").find(".isSelect").each(function(){
                    $(this).removeClass("isSelect");
                    $(this).addClass("noSelect");
                });
            }
            // console.log(item);
            // console.log(isSelect);
            // console.log(noSelect);
        });
        $("#pi_selectAll").click(function(){

            var item = $("#pi").find(".item").length;
            var isSelect = $("#pi").find(".isSelect").length;
            var noSelect = $("#pi").find(".noSelect").length;
            if(item > isSelect){
                $("#pi").find(".noSelect").each(function(){
                    $(this).removeClass("noSelect");
                    $(this).addClass("isSelect");
                });
            }
            if(item == isSelect){
                $("#pi").find(".isSelect").each(function(){
                    $(this).removeClass("isSelect");
                    $(this).addClass("noSelect");
                });
            }
        });
        $("#kmp_selectAll").click(function(){

            var item = $("#kmp").find(".item").length;
            var isSelect = $("#kmp").find(".isSelect").length;
            var noSelect = $("#kmp").find(".noSelect").length;
            if(item > isSelect){
                $("#kmp").find(".noSelect").each(function(){
                    $(this).removeClass("noSelect");
                    $(this).addClass("isSelect");
                });
            }
            if(item == isSelect){
                $("#kmp").find(".isSelect").each(function(){
                    $(this).removeClass("isSelect");
                    $(this).addClass("noSelect");
                });
            }
        });
        $("#levenshtein_selectAll").click(function(){

            var item = $("#levenshtein").find(".item").length;
            var isSelect = $("#levenshtein").find(".isSelect").length;
            var noSelect = $("#levenshtein").find(".noSelect").length;
            if(item > isSelect){
                $("#levenshtein").find(".noSelect").each(function(){
                    $(this).removeClass("noSelect");
                    $(this).addClass("isSelect");
                });
            }
            if(item == isSelect){
                $("#levenshtein").find(".isSelect").each(function(){
                    $(this).removeClass("isSelect");
                    $(this).addClass("noSelect");
                });
            }
        });
        $("#selectsort_selectAll").click(function(){

            var item = $("#selectsort").find(".item").length;
            var isSelect = $("#selectsort").find(".isSelect").length;
            var noSelect = $("#selectsort").find(".noSelect").length;
            if(item > isSelect){
                $("#selectsort").find(".noSelect").each(function(){
                    $(this).removeClass("noSelect");
                    $(this).addClass("isSelect");
                });
            }
            if(item == isSelect){
                $("#selectsort").find(".isSelect").each(function(){
                    $(this).removeClass("isSelect");
                    $(this).addClass("noSelect");
                });
            }
        });

        //保存按钮
        $("#submit").click(function(){
            var pi = [];
            var kmp = [];
            var levenshtein = [];
            var selectsort = [];
            var workItem = $("#main_left").find(".item").length;
            if(workItem != 0){
                layer.msg("Please assign the task type first!",
                    {icon: 2,offset:['40%', '30%'],time:3000,area:['300px','70px']});
                return;
            }

            $("#pi").find(".item").each(function(){
                var jobId = $(this).text();
                pi.push(jobId);
            });

            $("#kmp").find(".item").each(function(){
                var jobId = $(this).text();
                kmp.push(jobId);
            });

            $("#levenshtein").find(".item").each(function(){
                var jobId = $(this).text();
                levenshtein.push(jobId);
            });

            $("#selectsort").find(".item").each(function(){
                var jobId = $(this).text();
                selectsort.push(jobId);
            });
            console.log(pi);
            console.log(kmp);
            console.log(levenshtein);
            console.log(selectsort);
        });

    });*/

</script>
<style>
    /*.a1 {
        width: 100px;
        height: 100px;
        background-color: #333;
        color: #fff;
        position: relative;
        margin-top: 50px;
    }

    .a1:after {
        content: attr(data-num);
        line-height: 50px;
        text-align: center;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: red;
        position: absolute;
        top: -20px;
        right: -20px;
    }

    .tt{
        border: #00FF00 1px solid;
    }

    .main-container{
        position: relative;
        width: 100%;
        height: 99%;
    }

    .main_left{
        position: relative;
        height: 100%;
        border-radius:10px 10px 10px 10px;
        border: solid 1px #aab9c3;
        overflow-y: scroll;
    }
    .main_left::-webkit-scrollbar{
        width:0;
    }

    .main_move{
        position: relative;
        height: 100%;
        border-radius:10px 10px 10px 10px;
        !*border: solid 1px #aab9c3;*!
    }

    .main_classify{
        position: relative;
        height: 100%;
        !*border-radius:10px 10px 10px 10px;*!
        !*border: solid 1px #aab9c3;*!
    }
    #pi{
        position: relative;
        height: 25%;
        border-radius:10px 10px 10px 10px;
        border: solid 1px #aab9c3;
        overflow-y: scroll;
    }
    #pi::-webkit-scrollbar{
        width:0;
    }
    #kmp{
        position: relative;
        height: 25%;
        border-radius:10px 10px 10px 10px;
        border: solid 1px #aab9c3;
        overflow-y: scroll;
    }
    #kmp::-webkit-scrollbar{
        width:0;
    }
    #levenshtein{
        position: relative;
        height: 25%;
        border-radius:10px 10px 10px 10px;
        border: solid 1px #aab9c3;
        overflow-y: scroll;
    }
    #levenshtein::-webkit-scrollbar{
        width:0;
    }
    #selectsort{
        position: relative;
        height: 25%;
        border-radius:10px 10px 10px 10px;
        border: solid 1px #aab9c3;
        overflow-y: scroll;
    }
    #selectsort::-webkit-scrollbar{
        width:0;
    }
    .btn_div{
        position: relative;
        height: 25%;
        border-radius:10px 10px 10px 10px;
        !*border: solid 1px #aab9c3;*!
        padding-top: 40%;
        padding-left: 10%;
    }
    .noSelect{
        position: relative;
        border: solid 1px #aab9c3;
        border-radius:10px 10px 10px 10px;
        text-align: center;

        margin: 2px 2px 2px 2px;
        height: 20px;
        width: 20px;

    }
    .isSelect{
        position: relative;
        border: solid 1px #00FF00;
        border-radius:10px 10px 10px 10px;
        text-align: center;
        margin: 2px 2px 2px 2px;
        height: 20px;
        width: 20px;
    }

    #left_selectAll{
        width: 100%;
        border-radius: 10px 10px 0px 0px;
        border: #aab9c3 0px solid;
        border-bottom: #aab9c3 1px solid;
    }
    #pi_selectAll{
        width: 100%;
        border-radius: 10px 10px 0px 0px;
        border: #aab9c3 0px solid;
        border-bottom: #aab9c3 1px solid;
    }
    #kmp_selectAll{
        width: 100%;
        border-radius: 10px 10px 0px 0px;
        border: #aab9c3 0px solid;
        border-bottom: #aab9c3 1px solid;
    }
    #levenshtein_selectAll{
        width: 100%;
        border-radius: 10px 10px 0px 0px;
        border: #aab9c3 0px solid;
        border-bottom: #aab9c3 1px solid;
    }
    #selectsort_selectAll{
        width: 100%;
        border-radius: 10px 10px 0px 0px;
        border: #aab9c3 0px solid;
        border-bottom: #aab9c3 1px solid;
    }*/
</style>
</html>