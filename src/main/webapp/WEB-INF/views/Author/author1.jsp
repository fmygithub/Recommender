<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Author</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../../../resources/css/index2.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">
        <c:if test="${author == null}">
        alert("该用户不存在！");
        window.location = "javascript:history.go(-1);";
        </c:if>

        window.onload = function () {
            var attention = document.getElementById("attention");
            if (${isAttention == true}) {
                attention.textContent = "已关注";
                attention.setAttribute("onClick", "removeAttention();");
            } else {
                attention.textContent = "关注"
                attention.setAttribute("onClick", "addAttention();");
            }
        };

        function addAttention() {
            if (${sessionScope.user != null}) {
                var attention = document.getElementById("attention");
                var aid = document.getElementById("aid").value;
                //添加收藏
                jQuery.ajax({
                            type: 'GET',
                            url: '/attention/addAttention/' + aid,
                            dataType: 'json',
                            success: function (data) {
                                if (data.msg == "success") {
                                    attention.textContent = "已关注";
                                    attention.setAttribute("onClick", "removeAttention();");
                                } else {
                                    alert("关注失败");
                                }
                            },
                            error: function (data) {
                                alert("关注失败");
                            }
                        }
                );
            } else {
                alert("请登录");
            }
        }

        function removeAttention() {
            var attention = document.getElementById("attention");

            var aid = document.getElementById("aid").value;
            //取消收藏
            jQuery.ajax({
                        type: 'GET',
                        url: '/attention/delAttention/' + aid,
                        dataType: 'json',
                        success: function (data) {
                            if (data.msg == "success") {
                                attention.textContent = "关注"
                                attention.setAttribute("onClick", "addAttention();");
                            } else {
                                alert("取消关注失败");
                            }
                        },
                        error: function (data) {
                            alert("取消关注失败");
                        }
                    }
            );
        }
    </script>
</head>
<body>
<div class="header">
    <%@include file="../system/top.jsp" %>
</div>
<div class="wrap">
    <div class="main">
        <input id="aid" type="hidden" value="${author.id}"/>

        <div class="clear"></div>
        <div class="content">
            <table border="0">
                <tr>
                    <td valign="top" colspan="2" class="message_line_3">
                        <c:if test="${author != null}">
                            <div style="float:left;font-weight:bold;"
                                 class="event_detail_title td_word_wrap_455">${author.name}
                            </div>
                        </c:if>
                        <div style="float:right; margin-top:6px;">

                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="20px" height="96" valign="top" style="padding-top: 5px">
                        <img src="../../../resources/images/no.jpg" width="96" height="96" class="my_img">
                    </td>
                    <td class="author_info" width="60px">
                        <br/>
                        <c:if test="${author != null}">
                            <div class="td_word_wrap_410"><h5>机&nbsp;&nbsp;构：&nbsp;&nbsp;${author.unit}</h5></div>
                            <div class="td_word_wrap_410"><h5>领&nbsp;&nbsp;域：&nbsp;&nbsp;${author.fields}</h5></div>
                            <div class="td_word_wrap_410"><h5>H-index：&nbsp;&nbsp;${author.h_index}</h5></div>
                            <div class="td_word_wrap_410"><h5>G-index：&nbsp;&nbsp;${author.g_index}</h5></div>
                        </c:if>
                        <p></p>
                    </td>
                    <td>
                        <button id="attention" style="width: 70px"></button>
                    </td>
                </tr>
            </table>
            <c:forEach items="${paperList}" var="paper">
                <article>
                    <h2><a target="__blank"
                           href="/paper/searchCit?title=${paper.title}">${paper.title}</a></h2>
                    <h4>${paper.author}</h4>
                    <h4>${paper.publish}</h4>
                </article>
            </c:forEach>
            <!--
                当总页数大于1的时候才显示分页功能
            -->
            <c:if test="${pageCount > 1}">
                <table>
                    <tr>
                        <td height="35">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25%" height="29" nowrap="nowrap">
                                        <table width="320" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="44%" class="STYLE1">当前页：${pageNow}/${pageCount}页
                                                </td>

                                                <td width="75%" valign="top" class="STYLE1">
                                                    <div align="right">
                                                        <table width="230" height="20" border="0" cellpadding="0"
                                                               cellspacing="0">
                                                            <tr>
                                                                <td width="50" height="22" valign="middle">
                                                                    <div align="right">
                                                                        <c:if test="${pageNow == 1}">
                                                                            <img src="../../../resources/images/page_back_1.gif"
                                                                                 width="50"
                                                                                 height="20"/>
                                                                        </c:if>
                                                                        <s:if test="${pageNow != 1}">
                                                                            <a href="/author/searchAuthorCit?page=${page - 1}&name=${name}"
                                                                               onclick="canClienk()" id="forward"> <img
                                                                                    src="../../../resources/images/page_back.gif"
                                                                                    width="50" height="20"/>
                                                                            </a>
                                                                        </s:if>
                                                                    </div>
                                                                </td>
                                                                <td width="54" height="22" valign="middle">
                                                                    <div align="right">
                                                                        <c:if test="${pageNow == pageCount}">
                                                                            <img src="../../../resources/images/page_next_1.gif"
                                                                                 width="50"
                                                                                 height="20"/>
                                                                        </c:if>
                                                                        <c:if test="${pageNow != pageCount}">
                                                                            <a href="../system/searchauthorcit.action?page=${page + 1}&name=${name}"
                                                                               onclick="canClienk()" id="next"> <img
                                                                                    src="../../../resources/images/page_next.gif"
                                                                                    width="50" height="20"/>
                                                                            </a>
                                                                        </c:if>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
            </c:if>

        </div>
        <div class="sidebar">
            <div class="add" id="test">
                <table class="search_page_text border_bottom_1px spacing_20">
                    <tr>
                        <td align="left" valign="top" nowrap="nowrap" width="80%">
                            <span class="menu_margin_left title_style" style="float:left;">Coauthor</span>
                        </td>

                    </tr>
                </table>
                <table class="search_page_text border_bottom_1px spacing_20" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td valign="top" class="right_menu_padding" style="padding-top:0px;">
                            <script type="text/javascript" src="../../../resources/js/d3.v3.min.js"></script>
                            <style>
                                .link {
                                    stroke: #999;
                                    stroke-opacity: .6;
                                }

                                .link1 {
                                    stroke: #999;
                                    stroke-opacity: .6;
                                }

                                text {
                                    font: 12px Microsoft YaHei;
                                }

                            </style>
                            <script type="text/javascript">
                                var graph = ${graph};
                            </script>
                            <script>

                                var width = 375,
                                        height = 375

                                var svg = d3.select("div #test")
                                        .append("svg")
                                        .attr("width", width)
                                        .attr("height", height);

                                var force = d3.layout.force()
                                        .gravity(.06)
                                        .distance(140)	//link length
                                        .charge(-600)
                                        .size([width, height]);
                                //var json = JSON.parse('{"links":[{"source":0, "target":1, "value":2}, {"source":0, "target":2, "value":2}, {"source":0, "target":3, "value":2}, {"source":0, "target":4, "value":2}, {"source":0, "target":5, "value":2}, {"source":0, "target":6, "value":2}, {"source":0, "target":7, "value":2}, {"source":0, "target":8, "value":2}, {"source":0, "target":9, "value":2}, {"source":0, "target":10, "value":2}, {"source":0, "target":11, "value":2}, {"source":0, "target":12, "value":2}, {"source":0, "target":13, "value":2}, {"source":0, "target":14, "value":2}, {"source":0, "target":15, "value":2}, {"source":0, "target":16, "value":2}, {"source":0, "target":17, "value":2}],"nodes":[{"id":"cffae4ec-ab26-42a6-9601-207b4fe70208", "name":"Xuelong Li", "group":1, "image":"\/upload\/no.jpg", "count"28.9948974843}, {"id":"604dab13-5f9a-244a-aa6f-a824de55e808", "name":"Xindong Wu", "group":2, "image":"\/upload\/no.jpg", "count"12.2303943956}, {"id":"c333ea38-bb25-4a7e-bbbe-1318b9881a50", "name":"Xin Lu", "group":2, "image":"\/upload\/no.jpg", "count"2.28469647756}, {"id":"5abbdb71-6c83-541d-aabb-b2222747c31b", "name":"Shiming Xiang", "group":2, "image":"\/upload\/no.jpg", "count"3.26169647756}, {"id":"32675b41-7530-4218-a2c7-98d5dccac7b6", "name":"Yanwei Pang", "group":2, "image":"\/upload\/no.jpg", "count"5.8018573684}, {"id":"f67f9981-21a6-4e0d-a387-2a41d8f83719", "name":"Jieping Ye", "group":2, "image":"\/upload\/no.jpg", "count"11.5121400435}, {"id":"ec5883e0-0a31-4e52-b03d-9d9b65358816", "name":"Yuan Yuan", "group":2, "image":"\/upload\/no.jpg", "count"9.43738260262}, {"id":"da0433d5-48e9-14a4-19a6-c5a0e49ad709", "name":"Yi Tang", "group":2, "image":"\/upload\/no.jpg", "count"4.13042544904}, {"id":"5f187ef7-5fed-4618-872a-c7d188bc92a2", "name":"Shuicheng Yan", "group":2, "image":"\/upload\/no.jpg", "count"18.7104422718}, {"id":"5bc28961-80a9-e473-28bf-aa3da68b0a7d", "name":"Luoqing Li", "group":2, "image":"\/upload\/no.jpg", "count"6.63295068326}, {"id":"fe043beb-59c9-4329-bda9-28b2fbf2843b", "name":"Dacheng Tao", "group":2, "image":"\/upload\/no.jpg", "count"8.63684830996}, {"id":"627b5706-67a8-41fc-a077-89b1adee2df7", "name":"Yong Rui", "group":2, "image":"\/upload\/no.jpg", "count"4.64412063254}, {"id":"36", "name":"Lin, S.", "group":2, "image":"\/upload\/no.jpg", "count"3.52843580154}, {"id":"35d18e22-c530-4c8b-9932-5455174d0e59", "name":"Yao Hu", "group":2, "image":"\/upload\/no.jpg", "count"6.27742415498}, {"id":"eb16dd61-0a70-348d-3acc-727dfe2b20b3", "name":"Feiping Nie", "group":2, "image":"\/upload\/no.jpg", "count"7.51384830996}, {"id":"0e340d58-e96c-4b0d-96fc-420c0d7f313a", "name":"Dong Xu", "group":2, "image":"\/upload\/no.jpg", "count"18.537447448}, {"id":"6ae22601-e9aa-4c98-b561-3f92f8659683", "name":"Xiaoou Tang", "group":2, "image":"\/upload\/no.jpg", "count"8.36587289714}, {"id":"16ec4a37-bc88-f45a-fa3f-d5859990d2cd", "name":"Debing Zhang", "group":2, "image":"\/upload\/no.jpg", "count"5.98643580154}]}')
                                //var json = JSON.parse('{"nodes":[{"id":"7364ce2a-abd2-43fe-b524-0ba8f8518bde","name":"Badrul M. Sarwar","group":0,"image":"http:\/\/static.soscholar.com\/upload_image\/\/no-avatar.jpg","count":0},{"id":"2eaded3e-4a8a-40ad-ac3f-e4f732b41b52","name":"Joseph Konstan","group":1,"image":"http:\/\/static.soscholar.com\/AUTHOR_PHOTO\/2eaded3e-4a8a-40ad-ac3f-e4f732b41b52.jpg","count":12},{"id":"e90d525a-b058-4c39-95fc-3c8a77591e71","name":"John Riedl","group":1,"image":"http:\/\/static.soscholar.com\/AUTHOR_PHOTO\/e90d525a-b058-4c39-95fc-3c8a77591e71.jpg","count":12},{"id":"efd65f7c-a3cb-45ca-9761-4695c08824ac","name":"George Karypis","group":1,"image":"http:\/\/static.soscholar.com\/AUTHOR_PHOTO\/efd65f7c-a3cb-45ca-9761-4695c08824ac.jpg","count":9},{"id":"ed2bc707-e8bf-8494-59e1-75c5a7ebff9d","name":"Jean-David Ruvini","group":1,"image":"http:\/\/static.soscholar.com\/upload_image\/\/no-avatar.jpg","count":3},{"id":"222977b1-2c00-4f45-b8e5-d0fce95ef5a3","name":"Jonathan L. Herlocker","group":1,"image":"http:\/\/static.soscholar.com\/upload_image\/\/no-avatar.jpg","count":2},{"id":"59d7a154-33e9-438c-b214-aaa46918f113","name":"Al Borchers","group":1,"image":"http:\/\/static.soscholar.com\/upload_image\/\/no-avatar.jpg","count":2},{"id":"229996a6-d3b6-485b-a566-f5cfba2cd2ae","name":"Joydeep Ghosh","group":1,"image":"http:\/\/static.soscholar.com\/AUTHOR_PHOTO\/229996a6-d3b6-485b-a566-f5cfba2cd2ae.jpg","count":2},{"id":"11f8079e-646d-4339-afcf-cf7b98228381","name":"Eduardo R. Hruschka","group":1,"image":"http:\/\/static.soscholar.com\/upload_image\/\/no-avatar.jpg","count":2},{"id":"32106b80-05b8-e4b1-1b8b-f7c77b35589e","name":"Ayan Acharya","group":1,"image":"http:\/\/static.soscholar.com\/AUTHOR_PHOTO\/32106b80-05b8-e4b1-1b8b-f7c77b35589e.jpg","count":2},{"id":"6558e6d7-44a3-4a51-ad43-85e927667fac","name":"Nathaniel S. Good","group":1,"image":"http:\/\/static.soscholar.com\/upload_image\/\/no-avatar.jpg","count":1}],"links":[{"source":0,"target":1,"value":12},{"source":0,"target":2,"value":12},{"source":0,"target":3,"value":9},{"source":0,"target":4,"value":3},{"source":0,"target":5,"value":2},{"source":0,"target":6,"value":2},{"source":0,"target":7,"value":2},{"source":0,"target":8,"value":2},{"source":0,"target":9,"value":2},{"source":0,"target":10,"value":1}]}');
                                //var json = JSON.parse('{"nodes":[{"id":"cffae4ec-ab26-42a6-9601-207b4fe70208", "name":"Xuelong Li", "group":1, "image":"\/upload\/no.jpg", "count":28.9948974843}, {"id":"604dab13-5f9a-244a-aa6f-a824de55e808", "name":"Xindong Wu", "group":2, "image":"\/upload\/no.jpg", "count":12.2303943956}, {"id":"c333ea38-bb25-4a7e-bbbe-1318b9881a50", "name":"Xin Lu", "group":2, "image":"\/upload\/no.jpg", "count":2.28469647756}, {"id":"5abbdb71-6c83-541d-aabb-b2222747c31b", "name":"Shiming Xiang", "group":2, "image":"\/upload\/no.jpg", "count":3.26169647756}, {"id":"32675b41-7530-4218-a2c7-98d5dccac7b6", "name":"Yanwei Pang", "group":2, "image":"\/upload\/no.jpg", "count":5.8018573684}, {"id":"f67f9981-21a6-4e0d-a387-2a41d8f83719", "name":"Jieping Ye", "group":2, "image":"\/upload\/no.jpg", "count":11.5121400435}, {"id":"ec5883e0-0a31-4e52-b03d-9d9b65358816", "name":"Yuan Yuan", "group":2, "image":"\/upload\/no.jpg", "count":9.43738260262}, {"id":"da0433d5-48e9-14a4-19a6-c5a0e49ad709", "name":"Yi Tang", "group":2, "image":"\/upload\/no.jpg", "count":4.13042544904}, {"id":"5f187ef7-5fed-4618-872a-c7d188bc92a2", "name":"Shuicheng Yan", "group":2, "image":"\/upload\/no.jpg", "count":18.7104422718}, {"id":"5bc28961-80a9-e473-28bf-aa3da68b0a7d", "name":"Luoqing Li", "group":2, "image":"\/upload\/no.jpg", "count":6.63295068326}, {"id":"fe043beb-59c9-4329-bda9-28b2fbf2843b", "name":"Dacheng Tao", "group":2, "image":"\/upload\/no.jpg", "count":8.63684830996}, {"id":"627b5706-67a8-41fc-a077-89b1adee2df7", "name":"Yong Rui", "group":2, "image":"\/upload\/no.jpg", "count":4.64412063254}, {"id":"36", "name":"Lin, S.", "group":2, "image":"\/upload\/no.jpg", "count":3.52843580154}, {"id":"35d18e22-c530-4c8b-9932-5455174d0e59", "name":"Yao Hu", "group":2, "image":"\/upload\/no.jpg", "count":6.27742415498}, {"id":"eb16dd61-0a70-348d-3acc-727dfe2b20b3", "name":"Feiping Nie", "group":2, "image":"\/upload\/no.jpg", "count":7.51384830996}, {"id":"0e340d58-e96c-4b0d-96fc-420c0d7f313a", "name":"Dong Xu", "group":2, "image":"\/upload\/no.jpg", "count":18.537447448}, {"id":"6ae22601-e9aa-4c98-b561-3f92f8659683", "name":"Xiaoou Tang", "group":2, "image":"\/upload\/no.jpg", "count":8.36587289714}, {"id":"16ec4a37-bc88-f45a-fa3f-d5859990d2cd", "name":"Debing Zhang", "group":2, "image":"\/upload\/no.jpg", "count":5.98643580154}],"links":[{"source":0, "target":1, "value":2}, {"source":0, "target":2, "value":2}, {"source":0, "target":3, "value":2}, {"source":0, "target":4, "value":2}, {"source":0, "target":5, "value":2}, {"source":0, "target":6, "value":2}, {"source":0, "target":7, "value":2}, {"source":0, "target":8, "value":2}, {"source":0, "target":9, "value":2}, {"source":0, "target":10, "value":2}, {"source":0, "target":11, "value":2}, {"source":0, "target":12, "value":2}, {"source":0, "target":13, "value":2}, {"source":0, "target":14, "value":2}, {"source":0, "target":15, "value":2}, {"source":0, "target":16, "value":2}, {"source":0, "target":17, "value":2}]}')

                                force
                                        .nodes(graph.nodes)
                                        .links(graph.links)
                                        .start();

                                var link = svg.selectAll(".link")
                                        .data(graph.links)
                                        .enter().append("line")
                                        .attr("class", "link");

                                var node = svg.selectAll(".node")
                                        .data(graph.nodes)
                                        .enter().append("g")
                                        .attr("class", "node")
                                        .call(force.drag);

                                node.append("clipPath")
                                        .attr("id", function (d, i) {
                                            return "clip" + i
                                        })
                                        .append("circle")
                                        .attr("x", -15)
                                        .attr("y", -15)
                                        .attr("r", 15);

                                var color = d3.scale.linear().domain([0, 1]).range(['#2980b9', '#f39c12']);

                                node.append("image")
                                        .attr("xlink:href", function (d) {
                                            return d.image;
                                        })
                                        .attr("clip-path", function (d, i) {
                                            return "url(#clip" + i + ")";
                                        })
                                        .style("cursor", "pointer")
                                        .attr("x", -15)
                                        .attr("y", -15)
                                        .attr("width", 30)
                                        .attr("height", 30);


                                //图片上的圆
                                node.append("circle")
                                        .style("cursor", "pointer")
                                        .attr("x", -15)
                                        .attr("y", -15)
                                        .attr("r", 15)
                                        .attr("stroke-width", function (d) {
                                            return d.group == 1 ? 2 : 2;
                                        })
                                        .attr("stroke", function (d) {
                                            return color(d.group);
                                        })
                                        .attr("fill", "transparent")
                                        .on("click", function (d) {
                                            location.href = "/author/searchAuthorCit?name=" + d.name;
                                        });

                                node.append("text")
                                        .style("cursor", "pointer")
                                        .attr("dx", -20)
                                        .attr("dy", 30)
                                        .text(function (d) {
                                            return d.name
                                        });

                                force.on("tick", tick);
                                function tick() {
                                    link.attr("x1", function (d) {
                                        d.source.x = width / 2 - 11;
                                        return d.source.x;
                                    })
                                            .attr("y1", function (d) {
                                                d.source.y = height / 2 - 7;
                                                return d.source.y;
                                            }
                                    )
                                            .attr("x2", function (d) {
                                                return d.target.x;
                                            })
                                            .attr("y2", function (d) {
                                                return d.target.y;
                                            });

                                    node.attr("transform", function (d) {
                                        if (d.index == 0) {//中央节点固定位置
                                            d.x = width / 2 - 11;
                                            d.y = height / 2 - 7;
                                        }
                                        return "translate(" + d.x + "," + d.y + ")";
                                    });
                                };

                            </script>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="recent">
                <h3>Keywords</h3>
                <ul>
                    <li><a href="#">${ak.keyword1}</a></li>
                    <li><a href="#">${ak.keyword2}</a></li>
                    <li><a href="#">${ak.keyword3}</a></li>
                    <li><a href="#">${ak.keyword4}</a></li>
                    <li><a href="#">${ak.keyword5}</a></li>
                    <li><a href="#">${ak.keyword6}</a></li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="f-menu" style="position:fixed;bottom:0;left: 20%; right:20% ; text-align: center; ">
        <div class="clear"></div>
        <div class="copy">Copyright © 2015. All Rights Reserved by Academic CitNet.Collect from 小蔡</div>
    </div>
</div>
</body>
</html>
