<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%dim bc,sc,fj,lx,lb,order,page
bc=request.QueryString("bc")
sc=request.QueryString("sc")
fj=request.QueryString("fj")
key=request.QueryString("key")
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
<%set rs=Server.CreateObject("ADODB.Recordset")
  sql="select * from [Table_Product] where Passed=true"
if bc<>0 and bc<>"" then sql=sql+" and bigclassid="&bc
if sc<>0 and sc<>"" then sql=sql+" and smallclassid="&sc
if fj<>0 and fj<>"" then sql=sql+" and cfjid='"&fj&"'"
if lx<>0 and lx<>"" then sql=sql+" and clxid='"&lx&"'"
if lb<>0 and lb<>"" then sql=sql+" and clbid='"&lb&"'"
if key<>"" and key<>"undefined" then sql=sql+ " and (entitle like '%"&key&"%' or Product_Id like '%"&key&"%' or content1 like '%"&key&"%')"
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
    <style>body{background:#fff;}</style>
<!--广告图-->

</div>
<!--引导条-->
<div class="ubar">
<div class="container">
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="housing.asp">项目搜索</a><%if lx<>0 then%> <em class="more-arr">&gt;</em> <a href="housing.asp?lx=<%=lx%>"><%if lx=7 then%>待<%else%>在<%end if%>售项目</a><%end if%>
<ul class="menu"><a href="housing.asp?lx=11" <%call ison(lx,11)%>>在售项目</a><a href="housing.asp?lx=7" <%call ison(lx,7)%>>待售项目</a><a href="housingbrand.asp">代表项目</a></ul>
</div>
</div>

<!--国家分类-->

<div class="part1">
    <div class="container ">
    <div class="sskey" style="display:none;"><%=key%></div>
    <!--搜索功能-->
    <!--#include file="inc/searchbar2.asp"-->
    <%
    if rs.bof and rs.eof then
    //response.write("暂无内容")
    else
    rs.PageSize=10 '设置页码
    pagecount=rs.PageCount '获取总页码
    page=int(page) '接收页码
    if page<=0 then page=1 '判断
    if request("page")="" then page=1
    rs.AbsolutePage=page '设置本页页码
    i=0

    %>
<%if rs.bof and rs.eof then%>
<div class="nothing">
<span> 抱歉，没找到<%if key<>"undefined" and key<>"" then%>与“<b class="fc-red"><%=key%></b>”<%end if%>相关的项目<br>
      您可以进行在线咨询或拨打我们的VIP电话咨询：</span>
      <div class="fbbtn ml40"><a href="javascript:feedback()" class="btn1"><i class="pico pico-qp"></i>在线咨询</a><a href="tel:400-901-6788" class="btn2"><i class="pico pico-dh"></i>400-901-6788</a></div>

</div>
<%else%>
    <div class="horder">
    <ul class="order"><a <%call ison(order,0)%> href="search.asp?<%call seaurl(bc,sc,fj,lx,lb,0,page)%>">默认排序</a><a <%call ison(order,1)%> <%call ison(order,2)%>  href="search.asp?<%call seaurl(bc,sc,fj,lx,lb,1,page)%>">按价格排序</a><!--<a href="search.asp?<%call seaurl(bc,sc,fj,lx,lb,3,page)%>" <%call ison(order,3)%> <%call ison(order,4)%>>按时间排序</a>--></ul>
<div class="pages"><a href="#">&lt;</a> 1/1 <a href="#">&gt;</a></div>
</div>
<%end if%>
<ul class="list1 row">

<%
    do while not rs.eof and i<rs.PageSize
 if rs("clxid")=7 then
 clxid="期房"
elseif rs("clxid")=11 then
clxid="现房"
else clxid="现房 期房"
 end if%>
 <li class="col-md-4 wow fadeInUp">
         <span class="cls fc-gold2"><i class="ico-c ico-c<%=rs("clbid")%>g"></i><%=rs("clbname")%></span>
         <div class="pic"><img src="<%=rs("defaultpicurl")%>" /><a class="bgmask2 tra" href="housingview.asp?id=<%=rs("articleid")%>"><p class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></p></a></div>
         <a class="ellipsis tit" href="housingview.asp?id=<%=rs("articleid")%>"><%=rs("entitle")%>&nbsp;<%=rs("title")%></a>
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
     <div class="price col-xs-12"><%if rs("clxid")=700 then%><em class="tit fc-red">$<%=rs("jgjj")%></em>万起（约<%=formatNumber((rs("jgjj")*6.8871),0,-1)%>万人民币）<%end if%><a class="pbtn b_h" href="housingview.asp?id=<%=rs("articleid")%>">查看详情 &gt;</a></div>
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
<!--相关推荐-->
<!--#include file="inc/recommended.asp"-->


<!--#include file="inc/footer.asp"-->
</body>
</html>
