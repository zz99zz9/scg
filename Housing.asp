<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->

<%dim bc,sc,fj,lx,lb,order,page
bc=request.QueryString("bc")
sc=request.QueryString("sc")
fj=request.QueryString("fj")
lx=request.QueryString("lx")
lb=request.QueryString("lb")
order=request.QueryString("order")
page=request.QueryString("page")
if bc="" then bc=0
if sc="" then sc=0
if fj="" then fj=0
if lx="" then lx=0
if lb="" then lb=0
if page="" then page=1
if order="" then order=0

%>
<%
dim tdkid
tdkid=3

if lx=11 then tdkid=4
if lx=7 then tdkid=5
%>
<%set rs=Server.CreateObject("ADODB.Recordset")
  sql="select * from [Table_Product] where Passed=true"
if bc<>0 and bc<>"" then sql=sql+" and bigclassid="&bc
if sc<>0 and sc<>"" then sql=sql+" and smallclassid="&sc
if fj<>0 and fj<>"" then sql=sql+" and cfjid='"&fj&"'"
if lx<>0 and lx<>"" then sql=sql+" and clxid='"&lx&"'"
if lb<>0 and lb<>"" then sql=sql+" and clbid='"&lb&"'"
  sql=sql+" order by "
  select case order
  	case 0
  	sql=sql+"Elite,"
  	case 1
  	sql=sql+"jgzj desc,"
  	case 2
  	sql=sql+"jgjj desc,"
  	case 3
  	sql=sql+"updatetime desc,"
  	case 4
  	sql=sql+"jgzj,"
  	case 5
  	sql=sql+"jgjj,"
  	case 6
  	sql=sql+"updatetime,"
  end select
  sql=sql+"OrderId desc,articleid desc"
  'response.write sql
  rs.Open sql,conn,1,1%>
<!--#include file="inc/header.asp"-->
    <link rel="stylesheet" href="xgwl/css/3.css"/>
<!--广告图-->
<div class="topbg ">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox" >
<%Set prs= Server.CreateObject("ADODB.Recordset")
        psql="select top 3 * From [links] where wid=3 order by oid desc,ID desc"
        prs.open psql,conn,1,1
        i=0%>
        <%do while not prs.eof%>
          <div class="item <%if i=0 then%>active<%end if%> " style="height:520px;background:url('<%=prs("file")%>') center top;">
            <div class="container">
              <div class="edinfo hidden-xs ">
         <span class="edtit"><%=prs("stit")%></span>
                       <span class="edtxt"><%=prs("stxt")%></span>
                 <a class="xgbtn" href="<%=prs("url")%>"><span>查看详情</span><em class="more-arr tra">&gt;</em></a>
                   </div>
               </div>
          </div>
         <%
        	i=i+1
        	     prs.movenext
        	loop
        prs.close
        set prs=nothing
        %>
        </div>


        <!-- Controls
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>-->
    </div>

<div class="container"><!--#include file="inc/searchbar.asp"--></div>


</div>
<!--引导条-->
<div class="ubar">
<div class="container">
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="housing.asp">项目介绍</a><%if lx<>0 then%> <em class="more-arr">&gt;</em> <a href="search.asp?lx=<%=lx%>"><%if lx=7 then%>待<%else%>在<%end if%>售项目</a><%end if%>
<ul class="menu"><a href="search.asp?lx=11" <%call ison(lx,11)%>>在售项目</a><a href="search.asp?lx=7" <%call ison(lx,7)%>>待售项目</a><a href="housingbrand.asp">代表项目</a></ul>
</div>
</div>
<!--国家分类-->
<div class="part1">
    <div class="container ">
    <div class="row Country TAB_CLICKa hidden-xs">
    <%set rsclass=Server.CreateObject("ADODB.Recordset")
      sqlclass="select * from [class_fj] order by OId desc,cid desc"
      rsclass.Open sqlclass,conn,1,1
      do while not rsclass.eof %>
<a <%call ison(fj,rsclass("cid"))%> href="?<%call seaurl(bc,sc,rsclass("cid"),lx,lb,order,page)%>"><img src="<%=rsclass("cfile")%>"><span class="tra"><%=rsclass("cname")%></span></a>
<%rsclass.movenext
  loop
  rsclass.close
  	set rsclass=nothing%>
    </div>
    <div class="horder">
    <ul class="order"><a <%call ison(order,0)%> href="search.asp?<%call seaurl(bc,sc,fj,lx,lb,0,page)%>">默认排序</a><a <%call ison(order,1)%> <%call ison(order,2)%>  href="search.asp?<%call seaurl(bc,sc,fj,lx,lb,1,page)%>">按价格排序</a><!--<a href="search.asp?<%call seaurl(bc,sc,fj,lx,lb,3,page)%>" <%call ison(order,3)%> <%call ison(order,4)%>>按时间排序</a>--></ul>
<div class="pages"><a href="#">&lt;</a> 1/1 <a href="#">&gt;</a></div>
</div>
<ul class="list1 row">
<%
if rs.bof and rs.eof then
response.write("暂无内容")
else
rs.PageSize=10 '设置页码
pagecount=rs.PageCount '获取总页码
page=int(page) '接收页码
if page<=0 then page=1 '判断
if request("page")="" then page=1
rs.AbsolutePage=page '设置本页页码
i=0
do while not rs.eof and i<rs.PageSize
%>
<% if rs("clxid")=7 then
 clxid="期房"
elseif rs("clxid")=11 then
clxid="现房"
else clxid="现房 期房"
 end if%>
  <li class="col-md-4 wow fadeInUp">
         <span class="cls fc-gold2"><i class="ico-c ico-c<%=rs("clbid")%>g"></i><%=rs("clbname")%></span>
         <div class="pic"><img src="<%=rs("defaultpicurl")%>" /><a class="bgmask2 tra" href="housingview.asp?id=<%=rs("articleid")%>"><p class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></p></a></div>
         <a class="ellipsis tit" href="housingview.asp?id=<%=rs("articleid")%>"><%=rs("entitle")%></a>
         <span class="ellipsis2 txt"><%=rs("Product_Id")%></span>
     <span class="address"><i class="pico pico-addressb"></i><%=rs("bigclassname")%>，<%=rs("smallclassname")%><br><div class="ellipsis" title="<%=rs("qt")%>"><%x1=split(rs("qt"),"|")%><%=x1(0)%></div></span>
     <div class="row row2">
     <%mystr=split(rs("ctdid"),",")
       for i=0 to ubound(mystr)
       if i<4 and mystr(i)<>"" then
       %>
       <span class="col-xs-4 "><em class="trait"><%call Showtd(mystr(i))%></em></span>
     <% end if
      next
       %>


 </div>
 <div class="row">
 <div class="price col-xs-12"><%if rs("clxid")=997 then%><em class="tit fc-red">$<%=rs("jgjj")%></em>万起（约<%=formatNumber((rs("jgjj")*6.8871),0,-1)%>万人民币）<%end if%><a class="pbtn hidden-xs b_h" href="housingview.asp?id=<%=rs("articleid")%>">查看详情 <em class="more-arr tra">&gt;</em></a></div>
 </div>
     </li>
 <!------------>

<%
rs.movenext
i=i+1
loop
end if
	rs.close
	set rs=nothing%>


    </ul>
</div>
</div>
<!--房源列表-->
<div class="part2">
    <div class="container ">
    <div class="row">

    </div>
</div>
</div>
    <!--相关推荐-->
    <!--#include file="inc/recommended.asp"-->
<!--#include file="inc/footer.asp"-->
</body>
</html>
