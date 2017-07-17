<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%
dim tdkid
tdkid=19
%>
<!--#include file="inc/header.asp"-->
    <link rel="stylesheet" href="xgwl/css/6.css"/>
<!--广告图-->
<div class="toped container">
<span class="entit">Contact us</span>
<!--<span class="cntit">———— 联系我们</span>-->
</div>
<!--引导条-->
<div class="ubar">
<div class="container">
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="salesteam.asp">联系我们</a> <em class="more-arr">&gt;</em> <a href="visit.asp">来访预约</a>
<ul class="menu"><a href="services1.asp">尚鉴尊享会</a><a href="salesteam.asp">销售团队</a><a href="visit.asp" class="on">来访预约</a><a href="javascript:feedback()">在线提问</a></ul>
</div>
</div>
<!--公司介绍1-->
<div class="part2">
<div class="container">
<div class="row contactmain">

    <div class="col-md-6 ">
    <div class="rfeedback">
    <img src="xgwl/img/6/topright.png" class="rarr">
    <div class="titbg">来访预约</div>
    <div class="txt">收到您的预约后，我们会第一时间联系您</div>
    <div class="form">
    <form>
    <input class="int vname" placeholder="您的姓名 Your name">
    <p class="p err"></p>
    <input class="int vtel" placeholder="您的电话 Your phone number">
     <p class="p err"></p>
     <input class="int vmail" placeholder="您的邮箱 Your e-mail address">
      <p class="p err"></p>
      <textarea class="int2 vcontect"  placeholder="填写备注 Message"></textarea>
            <p class="p err"></p>
            <div class="fbtn vbtn hand">立即预约</div>
</form>
</div>
</div></div>
<div class="col-md-6 ">
        <div class="laddress">
            <div class="tit">上海建工海外地产中心欢迎您的到来</div>
             <div class="txt"><i class="pico pico-addressg"></i><span class="txtt">地址：</span>中国上海市小木桥路681号上海外经大厦25层  <a href="javascript:map(1)" class="hidden-xs">[地图]</a></div>
             <div class="txt"><i class="pico pico-telg"></i><span class="txtt">电话：</span>86-21-6073 7686</div>

             <!-- <div class="txt"><i class="pico pico-faxg"></i><span class="txtt">传真：</span>86-21-6195 2778</div>
               <div class="txt"><i class="pico pico-mailg"></i><span class="txtt">E-mail：</span> info@scgamerica.com</div>-->
                <div class="txt"><i class="pico pico-tel2g"></i><span class="txtt">贵宾专线：</span><span class="b">400-901-6788</span> <img src="xgwl/img/cn.png">           <br class="hidden-lg hidden-md hidden-sm"> +1-212-789-0000 <img src="xgwl/img/en.png"></div>
                 <div class="txt"><i class="pico pico-time"></i><span class="txtt">工作时间：</span>周一到周五&nbsp;9：00～18：00&nbsp;(双休日看房需预约)</div>
                <div class="map" id="map"><iframe src="map1.html" width="100%" height="100%" frameborder="0" scrolling="no">
                                          </iframe><!--<img src="xgwl/img/temp/map.jpg">--></div>
</div></div>
    </div>
</div>
    </div>
      <!--底部二维码--

      <div class="peq">
    <div class="feq"><img src="xgwl/img/qr2.gif"><br>扫一扫，获取更多地产资讯</div>
    </div>
        <!--相关推荐-->
        <!--#include file="inc/recommended.asp"-->
<!--#include file="inc/footer.asp"-->
<script>
/* $(document).ready(function(){
$(".map2").load('map1.html');
})*/
</script>
</body>
</html>
