<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%pro_id=request.QueryString("id")
call SafeRequest(pro_id)
set rsnew=Server.CreateObject("ADODB.Recordset")
sql="select * from [prod] where prod_id="&pro_id
rsnew.Open sql,conn,1,1

Counter=rsnew("Counter")+1
update="UPDATE [prod] SET [counter]="&Counter&" WHERE prod_id="&pro_id
conn.execute update
if rsnew("title2")<>"" then
title=rsnew("title2")
else
title=rsnew("prod_name")
end if
if rsnew("keywords")<>"" then siteKey=rsnew("keywords")
if rsnew("description")<>"" then SiteCont=rsnew("description")%>
<!--#include file="inc/header.asp"-->
    <link rel="stylesheet" href="xgwl/css/5.css"/>
<!--广告图-->
<div class="toped container">
<span class="entit">News & Press</span>
<!--<span class="cntit">———— 新闻资讯</span>-->
</div>
<!--引导条-->
<div class="ubar">
<div class="container">
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="news.asp">新闻资讯</a>
<ul class="menu"><a href="news.asp?c=16">活动信息</a><a href="news.asp?c=24">曼哈顿生活</a><a href="news.asp?c=17">投资要闻</a><a href="news.asp?c=18">政策消息</a><a href="news.asp?c=19">行业资料</a></ul>
</div>
</div>
<!--公司介绍1-->
<div class="part1">
<div class="container">
<div class="ntit"><%=rsnew("prod_name")%></div>
<div class="ntime"><%=formatdatetime(rsnew("prod_date"),2)%>    |    <%=rsnew("classname")%></div>
<!-- sharebar button begin -->
<div class="bshare-custom icon-medium"><div class="bsPromo bsPromo2"></div><a title="分享到微信" class="bshare-weixin" href="javascript:void(0);"></a><a title="分享到新浪微博" class="bshare-sinaminiblog" href="javascript:void(0);"></a><a title="分享到Facebook" class="bshare-facebook" href="javascript:void(0);"></a><a title="分享到Twitter" class="bshare-twitter" href="javascript:void(0);"></a><a title="分享到QQ好友" class="bshare-qqim" href="javascript:void(0);"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count" style="float: none;">51.7K</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
<!-- sharebar button end -->
<div class="ninfo"><%=RemoveHTML(rsnew("prod_detailen"))%></div>
<div class="ntxt"><%=replace(rsnew("prod_detail"),"[立即报名]","<a href='javascript:feedback("&pro_id&")' class='bmbtn'>立即报名活动</a>")%>

</div>
<div class="tips" style="font-size:14px;">

<%
if rsnew("tips")<>"" then
response.write"标签："
mystr=rsnew("tips")
mystr=replace(mystr,"，",",")
mystr=split(mystr,",")
for i=0 to ubound(mystr)
'if i>0 then response.write" \ "
response.write "<a href='newssearch.asp?k="&mystr(i)&"' class='tipsinfo' target='_blank'>"&mystr(i)&"</a>"
next
end if  %>
</div>
                  	<div class="pn"><%call sHowDxNewsPN(rsnew("classid"),pro_id)%></div>
                  	<div class="nbottom"><span class="p">
                  	<!-- sharebar button begin -->
                    <div class="bshare-custom icon-medium"><div class="bsPromo bsPromo2"></div><a title="分享到微信" class="bshare-weixin" href="javascript:void(0);"></a><a title="分享到新浪微博" class="bshare-sinaminiblog" href="javascript:void(0);"></a><a title="分享到Facebook" class="bshare-facebook" href="javascript:void(0);"></a><a title="分享到Twitter" class="bshare-twitter" href="javascript:void(0);"></a><a title="分享到QQ好友" class="bshare-qqim" href="javascript:void(0);"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count" style="float: none;">51.7K</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
                    <!-- sharebar button end window.print()-->
                    <a class="pint" href="javascript:printme('.part1')"><i class="pico pico-pint"></i>打印本页</a>
</span><span class="n nzz">本文来源：上海建工海外地产中心    |    编辑：SCG</span></div>
</div>
                      <%
                  		rsnew.close
                  	set rsnew=nothing%>
    </div>

  <!--底部二维码-->

  <div class="peq">
<div class="feq"><img src="xgwl/img/qr2.gif"><br>扫一扫，获取更多地产资讯</div>
</div>
    <!--相关推荐-->
    <!--#include file="inc/recommended.asp"-->
<!--#include file="inc/footer.asp"-->
</body>
</html>
