<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%dim cid

	  set rsnew=Server.CreateObject("ADODB.Recordset")
	  sqlnew="select * from [prod] where classid=12"
	  	if bid<>0 then
			sqlnew = sqlnew+" and bigclassid="&bid
		end if
	  sqlnew=sqlnew+" order by oid desc,prod_id desc"

rsnew.Open sqlnew,conn,1,1%>
<%
dim tdkid
tdkid=10
%>
<!--#include file="inc/header.asp"-->
    <link rel="stylesheet" href="xgwl/css/4.css"/>
<!--广告图-->
<div class="toped container">
<span class="entit">Service & Inquiries</span>
<!--<span class="cntit">———— 服务咨询</span>-->
</div>
<!--引导条-->
<div class="ubar">
<div class="container">
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="services.asp">服务咨询</a> <em class="more-arr">&gt;</em> <a href="services3.asp">财税问答</a>
<ul class="menu"><a href="services2.asp">购置流程</a><a href="services3.asp" class="on">财税问答</a><a href="services4.asp" >贷款咨询</a><a href="services5.asp">移民知识</a><a href="services6.asp">留学置业</a></ul>
</div>
</div>
<!--公司介绍1-->
<div class="part1">
<div class="container">
   <ul class="qa">
   <%
   if rsnew.bof and rsnew.eof then
   response.write("暂无内容")
   else
   rsnew.PageSize=10 '设置页码
   pagecount=rsnew.PageCount '获取总页码
   page=int(request("page")) '接收页码
   if page<=0 then page=1 '判断
   if request("page")="" then page=1
   rsnew.AbsolutePage=page '设置本页页码
   i=0
   do while not rsnew.eof and i<rsnew.PageSize
   %>

   <!--class="b"-->
    <li><p class="q hand"><%=rsnew("prod_name")%></p><div class="a"><%=rsnew("prod_detail")%><div class="qaclose b_h">↑ 收起</div></div></li>
     <%rsnew.movenext
   	i=i+1
       loop
   	end if
   	rsnew.close
   	set rsnew=nothing%>

   </ul>
</div>
    </div>
        <!--相关推荐-->
        <!--#include file="inc/recommended.asp"-->
<!--#include file="inc/footer.asp"-->
</body>
</html>
