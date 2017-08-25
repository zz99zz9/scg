<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />

<script>
var url=location.href;
//http://scgoverseas.com/
if(url=='http://scgoverseas.com/'){
location.href='http://www.scgoverseas.com/';
}

</script>
<%dim skey
skey=request.QueryString("key")
'lx 在售待售
'lb 豪华公寓
'fj 国家城市
'设置TDK
if tdkid="" then tdkid=1
tdksql="select * From [tdk] where id="&tdkid
Set tdkrs= Server.CreateObject("ADODB.Recordset")
tdkrs.open tdksql,conn,1,1
if tdkrs.bof and tdkrs.eof then
t=SiteTitle
d=siteKey
k=SiteCont
else

t=tdkrs("t")
d=tdkrs("d")
k=tdkrs("k")
if key<>"" and key<>"undefined" then
t=key&"-"&t
d=key&"-"&d
k=key&"-"&k
end if
if nk<>"" and nk<>"undefined" then
t=nk&"-"&t
d=nk&"-"&d
k=nk&"-"&k
end if

    if (lx<>"" and lx<>0) or (lb<>"" and lb<>0) or (fj<>"" and fj<>0) or key<>"" or lx<>0 then
a=showNamef("class_fj",fj,"CID","Cname")
b=showNamef("class_lx",lx,"CID","Cname")
c=showNamef("class_lb",lb,"CID","Cname")
        t=a+b+c+key&"美国纽约房产,美国洛杉矶房产"
        k=a+b+c+key&"美国纽约房产,美国洛杉矶房产"
        d="最新最全的"&a+b+c+key&"房产信息，尽在上海建工海外房产网，SCG海外地产中心是您海外房产投资的第一选择。"
    end if
end if
if title<>"" then
t=title
d=SiteCont
k=siteKey
end if
%>
<title><%=t%></title>
	<meta name="keywords" content="<%=k%>" />
	<meta name="description" content="<%=d%>" />
<link rel="icon" href="icon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="xgwl/css/lib/bootstrap.min.css" />
<link rel="stylesheet" href="xgwl/css/lib/animate.css"/>
<link rel="stylesheet" href="xgwl/css/xgwl.css"/>
<link rel="stylesheet" href="xgwl/css/list.css"/>
<link rel="stylesheet" href="xgwl/css/base.css"/>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="xgwl/css/lib/html5shiv.min.js"></script>
      <script src="xgwl/css/lib/respond.min.js"></script>
    <![endif]-->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?542481775d21fbdf98bf4edd76cda65d";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
</script>
</head>

<body style="overflow-x:hidden;">
<!--导航 navbar-fixed-top-->
<nav class="navbar my-navbar navbar-default" role="navigation">
  <div class="container-fluid container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#example-navbar-collapse"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="/"><img src="xgwl/img/logo.png" /></a> </div>
    <div class="collapse navbar-collapse" id="example-navbar-collapse">
      <ul class="nav navbar-nav XGnav" id=".pc-nav">
        <li class="active XGli"><a href="index.asp" class="s_link">首页</a></li>
        <li class="XGli"><a href="aboutscg.asp" class="s_link on">关于公司 </a></li>
        <li class="dropdown XGli"><a href="housing.asp" class="dropdown-toggle s_link" data-toggle="dropdown">项目介绍</a>
          <ul class="dropdown-menu">
            <li><a href="housing.asp?">在售项目</a></li>
            <li><a href="housing.asp?s=n">待售项目</a></li>
            <li><a href="housingbrand.asp">代表项目</a></li>
          </ul>
        </li>
        <li class="dropdown XGli"><a href="services.asp" class="dropdown-toggle s_link" data-toggle="dropdown">服务咨询</a>
          <ul class="dropdown-menu">
            <!--<li><a href="services1.asp">尚鉴尊享会</a></li>-->
            <li><a href="services2.asp">政策消息</a></li>
            <li><a href="services3.asp">财税问答</a></li>
            <li><a href="services4.asp">贷款咨询</a></li>
            <li><a href="services5.asp">移民知识</a></li>
            <li><a href="services6.asp">购置流程</a></li>
          </ul>
        </li>
        <li class="dropdown XGli"><a href="news.asp" class="dropdown-toggle s_link" data-toggle="dropdown">新闻资讯</a>
          <ul class="dropdown-menu">
            <li><a href="news.asp?c=16">活动信息</a></li>
            <li><a href="news.asp?c=24">曼哈顿生活</a></li>
            <li><a href="news.asp?c=17">投资要闻</a></li>

            <li><a href="news.asp?c=18">留学置业</a></li>
            <li><a href="news.asp?c=19">海外置业</a></li>
          </ul>
        </li>
                <li class="dropdown XGli"><a href="visit.asp" class="dropdown-toggle s_link" data-toggle="dropdown">联系我们</a>
          <ul class="dropdown-menu">
            <li><a href="services1.asp">尚鉴尊享会</a></li>
            <li><a href="salesteam.asp">销售团队</a></li>
            <li><a href="visit.asp">来访预约</a></li>
            <li><a href="javascript:feedback()">在线提问</a></li>
          </ul>
        </li>
      </ul>
      <span class="navbar-tel hidden-xs" ><img src="xgwl/img/400.png" /></span>
        <span class="navbar-search hidden-xs"><!--<input type="text" placeholder="请输入项目关键词" class="navbar-key" value="<%=skey%>"/>--><img src="xgwl/img/mag.png" class="b_h navbar-search-mag" /></span>
    </div>
  </div>
</nav>
<!--pc端二级菜单-->
<div class="pc-nav"></div>
<div class="pc-nav"></div>
<div class="pc-nav">
    <ul class="pc-menu pc-menu3">
    <li class="li31"><a href="housing.asp?lx=11">在售项目</a></li>
    <li class="li32"><a href="housing.asp?lx=7">待售项目</a></li>
    <li class="li33"><a href="housingbrand.asp">代表项目</a></li>
    </ul>
</div>
<div class="pc-nav">
    <ul class="pc-menu pc-menu5">
    
    <li class="li42"><a href="services2.asp">政策消息</a></li>
    <li class="li43"><a href="services3.asp">财税问答</a></li>
        <li class="li44"><a href="services4.asp">贷款咨询</a></li>
        <li class="li45"><a href="services5.asp">移民知识</a></li>
        <!--<li class="li46"><a href="javascript:feedback()">在线提问</a></li>-->
        <li class="li52"><a href="services6.asp">购置流程</a></li>
    </ul>
</div>
<div class="pc-nav">
    <ul class="pc-menu pc-menu5">

    <li class="li51"><a href="news.asp?c=16">活动信息</a></li>
    <li class="li42"><a href="news.asp?c=24">曼哈顿生活</a></li>
    <li class="li52"><a href="news.asp?c=17">投资要闻</a></li>
    <li class="li53"><a href="news.asp?c=18">留学置业</a></li>
    <li class="li54"><a href="news.asp?c=19">海外置业</a></li>

    </ul>
</div>
<div class="pc-nav">
    <ul class="pc-menu pc-menu4">
    <li class="li41"><a href="services1.asp">尚鉴尊享会</a></li>
    <li class="li61"><a href="salesteam.asp">销售团队</a></li>
    <li class="li62"><a href="visit.asp">来访预约</a></li>
    <li class="li46"><a href="javascript:feedback()">在线提问</a></li>
    
    </ul>
</div>
<!--辅助导航 navbar-fixed-top-->
<div class="navbar2 tra">
    <div class=" container">
        <a href="housing.asp" class="fc-gold tra"><i class="ico-nav ico-nav1g"></i>在售项目</a>
        <a href="news.asp?c=16" class=" tra"><i class="ico-nav ico-nav2w"></i>活动信息</a>
        <a href="services3.asp" class=" tra"><i class="ico-nav ico-nav3w"></i>贷款助手</a>
        <a href="javascript:feedback()" class=" tra"><i class="ico-nav ico-nav4w"></i>在线提问</a>
        <a href="visit.asp" class="fc-gold tra"><i class="ico-nav ico-nav5g"></i>来访预约</a>
        <a href="salesteam.asp" class="fc-gold tra"><i class="ico-nav ico-nav6g"></i>销售顾问</a>
    </div>
</div>