<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%--<%@page import="com.opensymphony.xwork2.ActionContext" %>--%>
<%--<%@taglib uri="/struts-tags" prefix="s" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Paper</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="../../../resources/js/d3.v3.min.js"></script>
    <style>
        .bar {
            display: inline-block;
            width: 20px;
            height: 75px;
            margin-right: 2px;
            background-color: teal;
        }

        .node {
            /*  stroke: #fff;
              stroke-width: 1.5px;*/
        }

        .link {
            /*  fill: none;
              stroke: #bbb;*/
            fill: none;
            /*  stroke: #666;*/
            stroke-width: 0.5px;
        }

        text {
            pointer-events: none;
            /*  font: 12px normal;*/
            font: 12px normal "宋体", Arial, Times;
            fill: block;
        }

        .linetext {
            font-size: 18px;
            font-family: SimSun;
            fill: #000000;
            /* fill-opacity:0.0; */
        }
    </style>
    <script type="text/javascript">
        <c:if test="${cur_paper == null}">
        alert("查询无果");
        window.location = "javascript:history.go(-1);";
        </c:if>

        window.onload = function () {
            var collect = document.getElementById("collect");
            if (${isCollect == true}) {
                collect.setAttribute("src", "../../../resources/images/2.png");
                collect.setAttribute("onClick", "removeCollect();");
            } else {
                collect.setAttribute("src", "../../../resources/images/1.png");
                collect.setAttribute("onClick", "addCollect();");
            }
        };

        function addCollect() {
            if (${sessionScope.user != null}) {
                var collect = document.getElementById("collect");
                var pid = document.getElementById("pid").value;
                //添加收藏
                jQuery.ajax({
                            type: 'GET',
                            url: '/favorites/addFavorites/' + pid,
                            dataType: 'json',
                            success: function (data) {
                                if (data.msg == "success") {
                                    collect.setAttribute("src", "../../../resources/images/2.png");
                                    collect.setAttribute("onClick", "removeCollect();");
                                } else {
                                    alert("收藏失败");
                                }
                            },
                            error: function (data) {
                                alert("收藏失败");
                            }
                        }
                );
            } else {
                alert("请登录");
            }
        }

        function removeCollect() {
            var collect = document.getElementById("collect");

            var pid = document.getElementById("pid").value;
            //取消收藏
            jQuery.ajax({
                        type: 'GET',
                        url: '/favorites/delFavorites/' + pid,
                        dataType: 'json',
                        success: function (data) {
                            if (data.msg == "success") {
                                collect.setAttribute("src", "../../../resources/images/1.png");
                                collect.setAttribute("onClick", "addCollect();");
                            } else {
                                alert("取消收藏失败");
                            }
                        },
                        error: function (data) {
                            alert("取消收藏失败");
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
        <input type="hidden" id="pid" value="${cur_paper.pid}"/>
        <div class="content">
            <!-- 找出文献题目  -->
            <c:if test="${cur_paper != null}">
                <article>
                    <h2 style="width: 500px">
                        <a target="__blank" href="#">${cur_paper.title}</a>
                    </h2>

                    <div style="margin-top: -60px;margin-right: 10px; width: 40px; height:40px; float: right">
                        <img id="collect" width="40px" height="40px"
                             src="../../../resources/images/2.png" alt="collection"
                             onclick="removeCollect(this);">
                    </div>
                </article>
            </c:if>

            <!-- 找出文献作者  -->
            <c:if test="${authors != null}">
                <h3>AUTHOR:</h3>
                <c:forEach items="${authors}" var="a">
                    <article1>
                        <h4><a target="__blank" href="/author/searchAuthorCit?name=${a.name}">${a.name}</a>
                        </h4>
                        <h6>${a.unit}</h6>
                    </article1>
                </c:forEach>
            </c:if>
            <!-- 找出文献作者end  -->

            <!-- 找出文献其他信息  -->
            <c:if test="${cur_paper  != null }">
                <article>
                    <h3>PUBLISH:</h3><h4>${cur_paper.publish}</h4>

                    <h3>ABSTRACT:</h3>

                    <h3>${cur_paper.summary}</h3>
                </article>
            </c:if>
            <!-- 找出文献其他信息end  -->

            <c:if test="${citPapers != null}">
                <c:forEach items="${citPapers}" var="cPaper" varStatus="cp">
                    <font color="blue" size="4">Reference:(${cp.count})</font>

                    <h2>
                        &nbsp;&nbsp;${cPaper.title}
                    </h2>
                    <h4>
                        Author:${cPaper.author}
                    </h4>
                </c:forEach>
            </c:if>

            <%--当总页数大于1的时候才显示分页功能--%>
            <c:if test="${pageCount > 1}">
                <table style="margin-bottom: 60px">
                    <tr>
                        <td height="35">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25%" height="29" nowrap="nowrap">
                                        <table width="320" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="44%" class="STYLE1">当前页：${pageNow}/${pageCount}页
                                                </td>
                                            </tr>
                                        </table>
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
                                                            <c:if test="${pageNow != 1}">
                                                                <a href="/paper/searchCit?pageNow=${pageNow - 1}&title=${cur_paper.title}"
                                                                   onclick="canClienk()" id="forward"> <img
                                                                        src="../../../resources/images/page_back.gif"
                                                                        width="50" height="20"/>
                                                                </a>
                                                            </c:if>
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
                                                                <a href="/paper/searchCit?pageNow=${pageNow + 1}&title=${cur_paper.title}"
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
            </c:if>
        </div>
        <div class="sidebar">
            <div class="add" id="copaper">
                <h3>Reference Graph</h3>
                <script type="text/javascript">
                    var graph = ${graph};
                    //alert(graph)
                </script>
                <script type="text/javascript">
                    var width = 350, height = 375;
                    var svg = d3.select("div #copaper")
                            .append("svg")
                            .attr("width", width)
                            .attr("height", height);

                    var color = d3.scale.category20();

                    var force = d3.layout.force().linkDistance(60).linkStrength(2).gravity(0.2).charge(-300).size([width, height]);

                    //var svg = d3.select("#copaper").append("svg").attr("width", width).attr("height", height);
                    var drag = force.drag()
                            .on("dragstart", function (d, i) {
                                d.fixed = true;    //拖拽开始后设定被拖拽对象为固定
                            });
                    // 背景
                    d3.select("#copaper").transition().style("background-color", "#ffffeb");
                    var nodes = graph.nodes.slice(),
                            links = [],
                            bilinks = [];

                    graph.links.forEach(function (link) {
                        var s = nodes[link.source],//源节点
                                t = nodes[link.target],//目标节点
                                i = {}; // intermediate node 中间节点
                        var v = link.value;
                        nodes.push(i);
                        links.push({
                            source: s,
                            target: i
                        }, {
                            source: i,
                            target: t
                        });
                        bilinks.push([s, i, t, v]);
                    });

                    force.nodes(nodes).links(links).start();

                    var link = svg.selectAll(".link").data(bilinks)
                            .enter().append("path")
                            .attr("class", "link")
                            .style("stroke", function (d) {
                                //console.log(d);
                                if (d[3] != null) {
                                    if (d[3] == "1") {
                                        //  console.log(d[3]);
                                        return color("1");
                                    } else {
                                        return color("2");
                                    }
                                }
                            });

                    var node = svg.selectAll(".node").data(graph.nodes)
                            .enter().append("g")
                            .attr("class", "node")
                            .call(force.drag);

                    var nodes_text = node.append("text")
                            .attr("dx", 12)
                            .attr("dy", ".35em")
                            .attr("class", "linetext")
                            .text(function (d) {
                                return d.name;
                            });

                    //小圆   2.5-7.5
                    node.append("circle").attr("class", "node")
                            .attr("r", function (d) {
                                console.log(d.count / 2)
                                if (d.count / 2 < 2) {
                                    return 2.5;
                                } else {
                                    return d.count / 2;
                                }
                            })
                            .style("fill", function (d) {
                                console.log(d);
                                return color(d.group);
                                return color(d.count + "")
                            })
                            .on("dblclick", function (d, i) {
                                d.fixed = false;
                            })
                            .call(drag);

                    force.on("tick", function () {
                        link.attr("d", function (d) {
                            return "M" + d[0].x + "," + d[0].y + "S"
                                    + d[1].x + "," + d[1].y + " "
                                    + d[2].x + "," + d[2].y;
                        });
                        node.attr("transform", function (d) {
                            return "translate(" + d.x + "," + d.y + ")";
                        });
                    });

                </script>

            </div>
            <div class="recent">
                <%--这块列出与文献相似的文献列表--%>
                <h3>Similar Paper</h3>
                <ul>
                    <c:forEach items="${similarPapers}" var="sp" varStatus="sps">
                        <li>${sps.index + 1}&nbsp;&nbsp;
                            <a target="__blank" href="/paper/searchCit?title=${sp.title}">${sp.title}</a>
                        </li>
                    </c:forEach>

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
