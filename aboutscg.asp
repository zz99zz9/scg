<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%
dim tdkid
tdkid=2
%>
<!--#include file="inc/header.asp"-->
    <link rel="stylesheet" href="xgwl/css/2.css"/>
<!--广告图-->
<div class="toped container">
<!--<span class="entit">about US</span>---->
<span class=" entit fz35p ls8">建筑，成就美好生活</span>
</div>
<!--引导条-->
<div class="ubar">
<div class="container">
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="aboutscg.asp">关于公司</a>
<ul class="menu"><a href="javascript:document.getElementById('f1').scrollIntoView()">集团介绍</a><a href="javascript:document.getElementById('f2').scrollIntoView()">公司介绍</a><a href="javascript:document.getElementById('f3').scrollIntoView()">海外地产中心</a></ul>
</div>
</div>
<!--公司介绍1-->
<div class="part1" id="f1">
    <div class="container ">
    <div class="row">
    <div class="col-md-6 text">
    <span class="cntit">上海建工集团</span>
    <span class="entit">Shanghai Construction Group (SCG)</span>
    <p class="abouttxt"><% call sHowInfo(1)%></p>
    <a href="http://www.scg.com.cn/" target="_blank" class="fc-red weblink"><i class="pico pico-link"></i>访问官网</a>
</div>
    <div class="col-md-6 wow bounceInRight" style="padding-top:50px;"><script src="//player.polyv.net/script/polyvplayer.min.js"></script>
                                            	<div id="plv_4c056f31ee0d762dbcfbbe7c264e9cd5_4">
                                            	</div>
                                            <script>
                                            var player = polyvObject('#plv_4c056f31ee0d762dbcfbbe7c264e9cd5_4').videoPlayer({
                                                'width':'585',
                                              'height':'330',
                                                'vid' : '4c056f31ee0d762dbcfbbe7c264e9cd5_4'
                                            });
                                            </script><!--<img src="xgwl/img/2/pic1.jpg">--></div>
    </div>
</div>
</div>
<!--公司介绍2-->
<div class="part2 " id="f2">
    <div class="container ">
    <div class="row">
        <div class="col-md-6 wow bounceInLeft"><img src="xgwl/img/2/pic2.jpg"></div>
    <div class="col-md-6 text">
    <span class="cntit">上海建工美洲公司</span>
    <span class="entit">Shanghai Construction America Group (SCGA)</span>
    <p class="abouttxt"><% call sHowInfo(2)%></p>
    <a href="http://www.scgamerica.com/" target="_blank" class="fc-red weblink"><i class="pico pico-link"></i>访问官网</a>
</div>

    </div>
</div>
</div>
<!--公司介绍3-->
<div class="part3" id="f3">
    <div class="container ">
    <div class="row">
    <div class="col-md-12 text-c"><span class="cntit">上海建工海外地产中心</span></div>
    <div class="col-md-12 text-c"><span class="entit">Shanghai Construction Group Overseas Real Estate Center</span></div>
    <div class="col-md-12 text-c"><p class="abouttxt"><% call sHowInfo(9)%></p></div>
       <div class="col-md-12"> <div class="titline"><span class="stit">上海建工海外地产中心</span><br><span class="btit">四大服务版块</span></div></div>
       <div class="col-md-3 four"><img src="xgwl/img/2/bg1.png"><em class="titbor">上海建工海外地产体验</em><!--<em class="tith"></em>--><em class="titl"></em><p class="txt">海外项目全景介绍<br>海外案场视频连线 <br>VR  眼镜实景看房<br> 直飞海外看房之旅</p></div>
        <div class="col-md-3 four"><img src="xgwl/img/2/bg2.png"><em class="titbor">前期专业评估优选项目</em><!--<em class="tith"></em>--><em class="titl"></em><p class="txt">专业团队项目评估
                                                                                                                                           <br>房源信息真实展现
                                                                                                                                           <br>海外投资规划设计
                                                                                                                                           <br>海外优质项目推荐</p></div>
       <div class="col-md-3 four"><img src="xgwl/img/2/bg3.png"><em class="titbor">专业税务法务贷款服务</em><!--<em class="tith"></em>--><em class="titl"></em><p class="txt">税务服务
                                                                                                                                           <br>法务服务
                                                                                                                                          <br>银行服务</p></div>
        <div class="col-md-3 four"><img src="xgwl/img/2/bg4.png"><em class="titbor">完善便捷售后管理方案</em><!--<em class="tith"></em>--><em class="titl"></em><p class="txt">房屋管理
                                                                                                                                           <br>租赁服务
                                                                                                                                           <br>生活服务</p></div>
    </div>
    </div>
    </div>
    <!--相关推荐-->
    <!--#include file="inc/recommended.asp"-->
<!--#include file="inc/footer.asp"-->
</body>
</html>
