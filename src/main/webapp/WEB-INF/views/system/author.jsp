<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="../../../resources/js/d3.v3.js"></script>
		<style>
			.bar{
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
			  font:  12px normal "宋体",Arial,Times;
			  fill:  block;
			}
.linetext {
	font-size: 18px ;
	font-family: SimSun;
	fill:#000000;
	fill-opacity:0.0;
}
		</style>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

    
    <title>Recommendation System</title>
    
     <link rel="shortcut icon" href="../../../resources/images/favicon.png" />
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css'  href='../../../resources/css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    
    <link rel='stylesheet' id='responsive-css-css'  href='../../../resources/css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    
    <link rel='stylesheet' id='main-css-css'  href='../../../resources/css/main5152.css?ver=1.0' type='text/css' media='all' />
    

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="header-wrapper">
         <header>
            <div class="container">


                <div class="logo-container">
                       <!-- Website Logo -->
                       <a href="#"  title="Academic CitNet">
                               <img src="../../../resources/images/logo.png" alt="Academic CitNet">
                       </a>
                       <span class="tag-line">Academic Literature Recommendation System</span>
                       <span>
						<button onClick="">
                       		<a href="./year.jsp" title="linian">历年论文统计图</a>
                       </button></span>
               </div>

	
	    </div>
      </header>
     </div>
                <!-- End of Header -->

                <!-- Start of Search Wrapper -->
                <div class="search-area-wrapper">
                        <div class="search-area container">
                                <h3 class="search-header">Author CitNet</h3>
                                <div>
                                	<table width ="100%">
                                		<tr>
                                			<td width ="50%" align="right"><button onClick="">
                       		<a href="./home.jsp" title="wenxian">文献查询</a>
                       </button></td>
                                			<td width ="50%" align="left"><button onClick="">
                       		<a href="./authorhome.jsp" title="author">作者查询</a>
                       </button></td>
                                		</tr>
                                	</table>
								</div>

                                <form id="search-form" class="search-form clearfix" method="post" action="searchauthorcit.action" autocomplete="off">
                                        <input class="search-term required" type="text" id="name" name="name" placeholder="Type your search author here" title="* Please enter a search term!" />
                                        <input class="search-btn" type="submit" value="Search" />
                                        <div id="search-error-container">
                                        	<s:if test ="author == null"> 
                                        	<h3 class="error">*不存在上述作者，请重新输入！</h3>
                                        	</s:if>
                                        </div>
                                </form>
                        </div>
                </div>
                <!-- End of Search Wrapper -->

                <!-- Start of Page Container -->
                <div class="page-container">
                        <div class="container">
                                <div class="row">

                                        <!-- start of page content -->
                                        <div class="span8 page-content">

                                                <!-- Basic Home Page Template -->
                                                <div class="row separator">
                                                        
                                                                <h3>Author CitNet</h3>
                                                                
                                                                       <section class="widget">
                                                        <div class="quick-links-widget" id="div1">
                                                               
                                                               
             <script type="text/javascript">
             <s:iterator value="graph" var="graph">
											var graph = ${graph};
										</s:iterator>
										
             </script>
        <script type="text/javascript">
					var a=document.getElementById("div1");   
					
				  var width = a.clientWidth,
				height = a.clientHeight;

			var color = d3.scale.category20();
			
			var force = d3.layout.force().linkDistance(100).linkStrength(2).charge(-300).size([width, height]);
			
			var svg = d3.select("#div1").append("svg").attr("width", width).attr("height", height);
			
			
			var drag = force.drag()
						.on("dragstart",function(d,i){
							d.fixed = true;    //拖拽开始后设定被拖拽对象为固定
							
						});
			// 背景
			    d3.select("#div1").transition().style("background-color", "white");
			



				var nodes = graph.nodes.slice(),
					links = [],
					bilinks = [];
				
				graph.links.forEach(function(link) {
					var s = nodes[link.source],//源节点
						t = nodes[link.target],//目标节点
						i = {}; // intermediate node 中间节点
				    v = link.value;
					nodes.push(i);
					links.push({
						source: s,
						target: i
					}, {
						source: i,
						target: t
					});
					bilinks.push([s, i, t ,v ]);
				});

						force.nodes(nodes).links(links).start();
						
						var link = svg.selectAll(".link").data(bilinks)
						                  .enter().append("path")
						                  .attr("class","link")
						                  .style("stroke", function(d) { 
						                    //console.log(d);
						                    if(d[3] != null) { 
						                      if(d[3] == "1"){
						                      //  console.log(d[3]);
						                        return color("1");
						                      }else{
						                        return color("2");
						                      }
						                    }; 
						                  });
						
						var node = svg.selectAll(".node").data(graph.nodes)
						                  .enter().append("g")
						                  .attr("class", "node")
						                  .call(force.drag);
				//String.prototype.replaceAll  = function(s1,s2){     
											//return this.replace(new RegExp(s1,"gm"),s2);     
											//}
						      
						var nodes_text = node.append("text")
								.attr("dx", 12)
						        .attr("dy",".35em")
								.attr("class","linetext")
								.text(function(d){
									return d.name;
								});
						
						              //小圆   2.5-7.5
						              node.append("circle").attr("class", "node")
						              .attr("r", function(d){
						                console.log(d.count/2)
						                if(d.count/2<2){
						                  return 2.5;
						                }else{
						                  return d.count/2;
						                }
						              })              
						             .style("fill", function(d) {
						          //      console.log(d);
						          //      return color(d.group);
						              return color(d.count+"")
						              })
						              .attr("fill","red")
						              .on("click",function(d,i){  
							                d3.select(this);
							                   
							           })							         
							           .on("mouseover",function(d,i){  
							                d3.select(this)  
							                  .attr("fill","yellow");
							                 nodes_text.style("fill-opacity",function(node){
												if( node === d){
												return 1.0;
										}
									}); 
							           })  
							           .on("mouseout",function(d,i){  
							                d3.select(this)  
							                  .transition()  
							                  .duration(500);							                 
							                 nodes_text.style("fill-opacity",function(node){
							                 	if (node === d){
							                 		return 0.0;
							                 	}
							                 });
							                  
										}).on("dblclick",function(d,i){
									d.fixed = false;
								})
								.call(drag);
							          
						
						
						//node.append("text")
						//                .attr("dx", 12)
						 //               .attr("dy",".35em")
						 //               .attr("class","linetext")
						  //              .text(function(d) {
						  //              return d.name
						  //            });  
             
           
						
						force.on("tick", function() {
						                link.attr("d", function(d) {
						                  return "M" + d[0].x + "," + d[0].y + "S"
						                      + d[1].x + "," + d[1].y + " "
						                      + d[2].x + "," + d[2].y;
						                });
						                node.attr("transform",function(d) {
						                  return "translate(" + d.x + "," + d.y + ")";
						                });
						              });
						
						        </script>       
                                                                       
                                                                
                                                                
                                                                
                                                                
                                                        </div>
                                                
                                                              
                                                                                
                                                                    
                                              


                                                       
                                                </div>
                                        </div>
                                        <!-- end of page content -->

                                              
                                        
                               


                                        <!-- start of sidebar -->
                                        <aside class="span4 page-sidebar">

                                                <section class="widget">
                                                        <div class="support-widget">
                                                        <h3 class="title">Detial</h3> 
                                                        <s:if test ="author != null">                                                             
                                                        	<s:iterator value="author" var="a">                                                       
																		<h5 class="intro">
																			<span><b>姓  名:</b>${a.name}</span>														
																	    </h5>
																		<h5 class="intro">
																			<span><b>机  构:</b>${a.unit}</span>														
																	    </h5>
																	    <p class="intro">
																			<span><h5>领  域:${a.fields}</h5></span>
																		</p>
																		<p class="intro">
																			<span><h5>H-index:${a.h_index}</h5></span>
																		</p>
																		<p class="intro">
																			<span><h5>G-index:${a.g_index}</h5></span>
																		</p>
																			
																			
																
																	</s:iterator>
																	</s:if>
                                                      
                                                                
                                                                
                                                        </div>
                                                </section>

                                        </aside>
                                        <!-- end of sidebar -->
                                </div>
                        </div>
                </div>
                <!-- End of Page Container -->

                <!-- Start of Footer -->
                <footer id="footer-wrapper">
                        <!-- Footer Bottom -->
                        <div id="footer-bottom-wrapper">
                                <div id="footer-bottom" class="container">
                                        <div class="row">
                                                <div class="span6">
                                                        <p class="copyright">
                                                                Copyright © 2015. All Rights Reserved by Academic CitNet.Collect from 小蔡
                                                        </p>
                                                </div>
                                                <div class="span6">
                                                        <!-- Social Navigation -->
                                                        <ul class="social-nav clearfix">
                                                                <li class="linkedin"><a target="_blank" href="#"></a></li>
                                                                <li class="stumble"><a target="_blank" href="#"></a></li>
                                                                <li class="google"><a target="_blank" href="#"></a></li>
                                                                <li class="deviantart"><a target="_blank" href="#"></a></li>
                                                                <li class="flickr"><a target="_blank" href="#"></a></li>
                                                                <li class="skype"><a target="_blank" href="skype:#?call"></a></li>
                                                                <li class="rss"><a target="_blank" href="#"></a></li>
                                                                <li class="twitter"><a target="_blank" href="#"></a></li>
                                                                <li class="facebook"><a target="_blank" href="#"></a></li>
                                                        </ul>
                                                </div>
                                        </div>
                                </div>
                        </div>
                        <!-- End of Footer Bottom -->

                </footer>
                <!-- End of Footer -->

                <a href="#top" id="scroll-top"></a>

                <!-- script -->


  </body>
</html>
