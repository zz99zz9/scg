<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%dim articleid
articleid=request.QueryString("id")
call SafeRequest(articleid)
sql="select * From [Table_Product] where ArticleID="&articleid
Set rrs= Server.CreateObject("ADODB.Recordset")
rrs.open sql,conn,1,1
if rrs.eof then
Set rrs= Server.CreateObject("ADODB.Recordset")
sql="select * From [Table_Product] order by ArticleID desc"
rrs.open sql,conn,1,1
end if
title=rrs("wz")
siteKey=rrs("Keywords")
SiteCont=rrs("Description")

%>
<!--#include file="inc/header.asp"-->
    <link rel="stylesheet" href="xgwl/css/3view.css"/>
     <link rel="stylesheet" href="xgwl/css/fyed.css"/>
<!--广告图-->

<!--引导条-->
<div class="ubar">
<div class="container">
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="aboutscg.asp">项目介绍</a> <em class="more-arr">&gt;</em> <a href="aboutscg.asp"><%=rrs("entitle")%></a>
<ul class="menu"><a href="housing.asp">在售项目</a><a href="housing.asp">待售项目</a><a href="housingbrand.asp">代表项目</a></ul>
</div>
</div>

<!--菜单栏-->
<div class="part1">
    <div class="container ">
    <div class="row"><!--javascript:document.getElementById('f1').scrollIntoView()javascript:document.getElementById('f3').scrollIntoView()-->
        <ul class="ftab hidden-xs"><a class="flogo"><img src="<%=rrs("DefaultPicUrl2")%>"></a><a href="#f1" class="tra topLink" >概述</a><a href="#f2" class="tra topLink">推荐户型</a><a href="#f3" class="tra topLink">项目特色</a><a class="tra topLink" href="#f4">设施服务</a><a href="#f5" class="tra topLink">位置信息</a><a href="#f6" class="tra topLink">项目图片</a></ul>
    </div>
</div>
</div>
<!--列表图和基本信息-->
<div class="part2" name="f1" id="f1" >
    <div class="container ">
    <div class="row">
        <div class="col-md-6 col-lg-6">
            <ul class="fplist">

            <%Set prs= Server.CreateObject("ADODB.Recordset")
psql="select * From [Table_pic] where pro_id="&rrs("ArticleID")&" order by oid desc,ID desc"
prs.open psql,conn,1,1%>
<%if not(prs.eof and prs.bof) then%>
<li class="li1"><img src="<%=prs("pic_url")%>"></li>
<%i=0
do while not i=4%>
            <li class="<%if i=3 then%>last<%end if%> hidden-xs"><img src="<%=prs("pic_url")%>"></li>
 <%
	i=i+1
	     prs.movenext
	loop
	end if
%>
            </ul><%if rrs("clxid")=11 then%>
            <a href="<%=rrs("link")%>" target="_blank" class="flink hidden-xs"><i class="pico pico-link"></i>查看该项目官方网站</a><%end if%>
            <i class="pico pico-qr2 hidden-xs"><span class="f-qr tra"><i class="r-arr-w"></i><img src="<%=rrs("DefaultPicUrl4")%>"></span></i>
</div>
        <div class="col-md-6 col-lg-6">
        <span class="fname ml40"><%=rrs("entitle")%></span>
        <div class="fline ml40"><span><i class="ico-c ico-c<%=rrs("clbid")%>b"></i><%=rrs("clbname")%></span><span ><i class="pico pico-addressb"></i><%=rrs("bigclassname")%>，<%=rrs("smallclassname")%></span></div>
        <div class="finfo ml40"><span class="b">详细地址：</span><%if Instr(rrs("qt"), "|") then%><%x1=split(rrs("qt"),"|")%><%=x1(0)%><br><%=x1(1)%><%else%><%=rrs("qt")%><%end if%><br>
                     <%if rrs("syq")<>"" then%> <span class="b">产权说明：</span><%=rrs("syq")%><br><%end if%>
                     <%if rrs("hx")<>"" then%>  <span class="b">推荐房型：</span><%=rrs("hx")%><br><%end if%>
                     <span class="linfo"><%=rrs("Product_Id")%></span></div>
                      <%if rrs("clxid")=11 then%>
       <%if rrs("clbid")<>8 then%> <div class="fjgmj ml40">
       <%if rrs("jgjj")>1 then%> <div class="col-md-5 r-line col-xs-6"><span class="fc-red">$<%if rrs("jgjj")<1 then%>0<%end if%><%=rrs("jgjj")%>万起<em class="fz13p fc-gray">(首付10%)</em></span><em>约<%=rrs("jgzj")%>万人民币</em></div><%end if%><div class="col-md-7 pl20 col-xs-6"><%=rrs("mj1")%>～<%=rrs("mj2")%><span class="fz15">㎡ 套内面积</span><em>居室：<%=rrs("hx")%></em></div>
</div><%end if%><!--javascript:document.getElementById('f7').scrollIntoView()||javascript:jsqpop()-->
<%if rrs("clbid")<>8 then%><div class="ftools ml40"><a href="#f7" class="tra topLink"><i class="pico pico-jsq"></i>房贷计算器</a><a href="services4.asp"><i class="pico pico-gwb"></i>贷款助手</a></div><%end if%>
<%end if%>
<div class="fbbtn ml40"><a href="javascript:feedback()" class="btn1"><i class="pico pico-qp"></i>在线咨询</a><a href="tel:400-901-6788" class="btn2"><i class="pico pico-dh"></i>400-901-6788</a></div>
<%if rrs("clxid")=11 and rrs("clbid")<>8 then%>
<div class="fsbtn ml40 hidden-xs"><a href="javascript:hlpop()" class="btnl"><i class="pico pico-rmb"></i>即时汇率</a><a href="services2.asp" class="btnl"><i class="pico pico-bj"></i>购房指南</a><a href="visit.asp" class="btnl2" target="_blank"><i class="pico pico-fx"></i>样板房预约参观</a></div>
<%end if%>
</div>
    </div>
    </div>
    </div>
    <!--平面图-->
    <% if rrs("content")<>"" then%>
    <div class="part3" name="f2" id="f2">
        <div class="container ">
        <div class="row">
<div class="tit"><!--<i class="pico pico-tit"></i>平面图<span class="en">/Floor Plan</span>--><img src="xgwl/img/tit/10.png"></div>
<div class="txt"><%=rrs("content")%></div>
<div class="row">
            <%Set prs= Server.CreateObject("ADODB.Recordset")
psql="select * From [f_hxt] where fid="&rrs("ArticleID")&" order by oid desc,ID desc"
prs.open psql,conn,1,1%>
<%if not(prs.eof and prs.bof) then%>
<%i=0
do while not i=4%>
<div class="col-md-6 hxt"><img src="<%=prs("file")%>" class="hxt-pic"><p class="hxt-tit"><%=prs("tit")%></p><p class="hxt-txt"><span class="hxt-jg"><%=prs("jg")%></span><%=prs("txt")%></p><br><br></div>

 <%
	i=i+1
	     prs.movenext
	loop
	end if
%>

</div>
        </div>
        </div>
        </div>
        <%end if%>
            <!--项目特色-->
            <% if rrs("content1")<>"" then%>
            <div class="part4" name="f3" id="f3">
                <div class="container ">
                <div class="row">

        <div class="tit"><!--<i class="pico pico-tit"></i>项目特色<span class="en">/Property Features</span>--><img src="xgwl/img/tit/11.png"></div>
        <div class="txt"><%=rrs("content1")%></div>
<div class="row">
            <%Set prs= Server.CreateObject("ADODB.Recordset")
psql="select * From [f_ts] where fid="&rrs("ArticleID")&" order by oid desc,ID desc"
prs.open psql,conn,1,1%>
<%if not(prs.eof and prs.bof) then%>
<%i=0
do while not prs.eof
if i<2 then ii=6 else ii=4%>

<div class="col-md-<%=ii%> hxt"><img src="<%=prs("file")%>" class="hxt-pic"><p class="hxt-tit"><%=prs("tit")%></p><p class="hxt-txt"><span class="hxt-jg"><%=prs("jg")%></span><%=prs("txt")%></p><br><br></div>

 <%if i=4 then%>
 </div><div class="row">

 <%end if
	i=i+1
	     prs.movenext
	loop
	end if
%>
</div>

<div class="signsjt">* 以上图片均为实景拍摄</div>
                </div>
                </div>
                </div>
                <%end if%>
                    <!--设施服务-->
                    <% if rrs("content2")<>"" then%>
                    <div class="part5" id="f4">
                        <div class="container ">
                        <div class="row">

                <div class="tit"><!--<i class="pico pico-tit"></i>设施服务<span class="en">/Amenities</span>--><img src="xgwl/img/tit/12.png"></div>
                <div class="txt"><%=rrs("content2")%></div>
<div class="row">
            <%Set prs= Server.CreateObject("ADODB.Recordset")
psql="select * From [f_fw] where fid="&rrs("ArticleID")&" order by oid desc,ID desc"
prs.open psql,conn,1,1%>
<%if not(prs.eof and prs.bof) then%>
<%i=0
do while not prs.eof
if i<2 then ii=6 else ii=4%>
<div class="col-md-<%=ii%> hxt"><img src="<%=prs("file")%>" class="hxt-pic"><p class="hxt-tit"><%=prs("tit")%></p><p class="hxt-txt"><span class="hxt-jg"><%=prs("jg")%></span><%=prs("txt")%></p><br><br></div>

 <%if i=4 then%>
 </div><div class="row">

 <%end if
	i=i+1
	     prs.movenext
	loop
	end if
%>

</div>
<div class="signsjt">* 以上图片均为实景拍摄</div>
                        </div>
                        </div>
                        </div>
                        <%end if%>
                    <!--位置服务-->
                    <% if rrs("content3")<>"" then%>
                    <div class="part6" id="f5">
                        <div class="container ">
                        <div class="row">

                <div class="tit"><!--<i class="pico pico-tit"></i>位置服务<span class="en">/Location</span>--><img src="xgwl/img/tit/13.png"></div>
                <div class="txt"><%=rrs("content3")%>
                <div class="signsjt">* 以上图片均为实景拍摄</div>
                </div>

                        </div>
                        </div>
                        </div>
                        <%end if%>
                                            <!--项目图片-->
                                            <div class="part7" id="f6">
                                                <div class="container ">
                                                <div class="row">

                                        <div class="tit"><!--<i class="pico pico-tit"></i>项目图片<span class="en">/Photo Gallery</span>--><img src="xgwl/img/tit/14.png"></div>
                                        <div class="txt">
 <!--轮播开始-->
    <div id="sildes" >
      <div class="control">
        <ul class="change">
        </ul>
      </div>
      <div class="thumbWrap">
        <div class="thumbCont">
          <ul>
            <!-- img属性, url=url, text=描述, bigimg=大图, alt=标题   url="http://www.sucaijiayuan.com"-->
            <%Set prs= Server.CreateObject("ADODB.Recordset")
psql="select * From [Table_pic] where pro_id="&rrs("ArticleID")&" order by oid desc,ID desc"
prs.open psql,conn,1,1%>
<%do while not prs.eof%>
            <li>
              <div><img src="<%=prs("pic_url")%>" bigImg="<%=prs("pic_url")%>" ></div>
            </li>
 <%
	i=i+1

	     prs.movenext
	loop
prs.close
set prs=nothing
%>
          </ul>
        </div>
      </div>
    </div>
    <!--轮播结束--></div>
                                                </div>
                                                </div>
                                                </div>
                                            <!--房贷计算器-->
                                            <div class="part8" id="f7" <%if rrs("clbid")=8 then%>style="display:none;"<%end if%>>
                                                <div class="container ">
                                                <div class="row">
<div class="col-md-6 fdjsq fdjsql">
<div class="titline">房贷计算器</div>
<div class="jsqform"><!--<div class="col-sm-3 input-group">

                                                                                                  <span class="input-group-addon">房屋总价</span>
                                                                                                  <input class="form-control" type="text" id="mj1"  placeholder="500,000">
                                                                                                  <span class="input-group-addon">$</span>
                                                          </div>-->
<!--房源总价-->
<div class="row ">
<div class="col-md-4 col-xs-5">贷款总额：</div>
 <div class="input-group col-md-8 col-xs-7">
        <span class="input-group-addon">$</span>
        <input type="text" class="form-control fyzj" placeholder="500,000" value="" id="fyzj" >
    </div>
    </div>
<!--<input class="fyzj" placeholder="$500,000" value="" id="fyzj">--><span class="err"></span>
                   <!--  首付比例：<input class="sfbl" placeholder="30%" value="" id="sfbl"><span class="err"></span>-->
                   <div class="row ">
                     <div class="col-md-4 col-xs-5">贷款期限：</div><!--<input class="dkqx" placeholder="15年" value="" id="dkqx">-->
                      <div class="input-group col-md-8 col-xs-7">
                      <select class="dkqx form-control" id="dkqx"><option value="15">15年</option><option value="20">20年</option><option value="25">25年</option><option value="30">30年</option></select>
                      </div>
                      </div><span class="err"></span>
                     <div class="row ">
                                          <div class="col-md-4 col-xs-5">年 利 率：</div>

                                           <div class="input-group col-md-8 col-xs-7">
                                           <input class="nll form-control" placeholder="4.5" value="" id="nll">
                                           <span class="input-group-addon">%</span>
                                           </div>
                                           </div><span class="err"></span>
                     <a class="jsqbtn hand topLink" href="#jsjg"><i class="pico pico-jsq2"></i>开始计算</a></div>
</div>

<div class="col-md-6 fdjsq fdjsqr ">
<div id="jsjg"></div>
<div class="titline">计算结果</div>
<div class="jsjg">
<div class="jgline">贷款总额：<span class="jsjgz outdkze">$ 150,000</span></div>
<div class="jgline">贷款期限：<span class="jsjgz outdkqx">15年</span></div>
<!--<div class="jgline">支付利息：<span class="jsjgz">$ 2,000</span></div>-->
<div class="jgline">每月还款：<span class="jsjgz myhk outmyhk">$ 5,000</span></div>
</div>
</div>
                                                </div>
                                                </div>
                                                </div>


          <!--房贷计算器-->
        <div class="part10">
        <div class="container ">
        <div class="row">您有任何问题可以马上咨询我们，有专业顾问为您耐心解答
        <div class="fbbtn hidden-xs"><a href="javascript:feedback()" class="btn1"><i class="pico pico-qp"></i>在线咨询</a><a href="tel:400-901-6788" class="btn2"><i class="pico pico-dh"></i>400-901-6788</a></div>
        <div class="fbeq"><img src="xgwl/img/qr2.gif"><br>扫一扫，获取更多地产资讯</div>
        </div>
        </div>
        </div>
        <!--相关推荐-->
                    <!--#include file="inc/recommended.asp"-->
                            <!--房贷计算器-->
                            <div class="jsqpop"><span class="popclose pico b_h pclose" onclick="hlpopclose()"></span>
                                    <span class="tit">房贷计算器</span>
                                          	 <span class="txt">本计算结果仅供参考，请以实际贷款为准。<br><br></span>
                                          	   <iframe src="calculator.html" width="100%" height="500" frameborder="0">
                                                    您的浏览器不支持iframe，请升级
                                                </iframe>
                                          	 </div>
        <!--汇率-->
        <div class="hlpop"><span class="popclose pico b_h pclose" onclick="hlpopclose()"></span>
                <span class="tit">即时汇率</span>
                      	 <span class="txt">本汇率表仅供参考，请以实际交易汇率为准。<br><br></span>
        <div class="hltable">

        <table class=" table table-striped"><tbody><tr>
        								<th>货币</th>
        								<th>现钞买入</th>
        								<th>现钞卖出</th>
        								<th>中行折算价</th>
        							</tr><tr><td>美元</td><td>682.0000</td><td>690.2700</td><td>687.9600</td></tr><tr><td>欧元</td><td>704.4700</td><td>732.0000</td><td>731.0200</td></tr><tr><td>港币</td><td>87.9200</td><td>88.9700</td><td>88.6900</td></tr><tr><td>日元</td><td>5.9968</td><td>6.2312</td><td>6.2519</td></tr><tr><td>英镑</td><td>821.4300</td><td>853.5400</td><td>855.1400</td></tr><tr><td>澳大利亚元</td><td>489.0000</td><td>508.1000</td><td>510.2000</td></tr><tr><td>加拿大元</td><td>492.6600</td><td>512.4200</td><td>509.3100</td></tr><tr><td>泰国铢</td><td>18.7000</td><td>20.0400</td><td>19.3400</td></tr><tr><td>新加坡元</td><td>466.7500</td><td>484.9800</td><td>483.9900</td></tr><tr><td>瑞典克朗</td><td>71.7700</td><td>74.6500</td><td>74.3200</td></tr><tr><td>瑞士法郎</td><td>658.6900</td><td>684.4400</td><td>683.8400</td></tr><tr><td>丹麦克朗</td><td>94.6700</td><td>98.4700</td><td>98.0100</td></tr><tr><td>挪威克朗</td><td>77.3700</td><td>80.4800</td><td>80.3300</td></tr><tr><td>林吉特</td><td></td><td></td><td>157.1300</td></tr><tr><td>菲律宾比索</td><td>13.3800</td><td>14.5600</td><td>13.8300</td></tr><tr><td>新西兰元</td><td>466.9700</td><td>491.1600</td><td>484.1400</td></tr><tr><td>卢布</td><td>9.9500</td><td>11.0900</td><td>10.6100</td></tr><tr><td>澳门元</td><td>83.2900</td><td>89.2900</td><td>86.1700</td></tr><tr><td>新台币</td><td>20.7500</td><td>22.3800</td><td>21.4700</td></tr><tr><td>韩国元</td><td>0.5605</td><td>0.6068</td><td>0.5837</td></tr><tr><td>南非兰特</td><td>43.7800</td><td>51.3800</td><td>47.7300</td></tr></tbody></table>
                                    </div>
        </div>
<!--#include file="inc/footer.asp"-->
<script src="xgwl/js/lib/slides-1.1.1-min.js" type="text/javascript"></script>
<script>
/**/
$(function(){
	$('#sildes').olvSlides(
		{
			thumb:true,
			thumbPage:true,
			thumbDirection:"Y",
			effect:'fade'

		}
	);
})
    //  $(this).parents("ul").find(".li1 img").attr("src", newimg);

$('a').mouseover(function(){
var url=$(this).attr("href");
$(this).attr("title",url);
})

</script>
</body>
</html>
