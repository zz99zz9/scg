<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%dim cid

	  set rsnew=Server.CreateObject("ADODB.Recordset")
	  sqlnew="select * from [prod] where classid=15"
	  	if bid<>0 then
			sqlnew = sqlnew+" and bigclassid="&bid
		end if
	  sqlnew=sqlnew+" order by oid desc,prod_id desc"

rsnew.Open sqlnew,conn,1,1%>
<%
dim tdkid
tdkid=12
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
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="services.asp">服务咨询</a> <em class="more-arr">&gt;</em> <a href="services5.asp">移民知识</a>
<ul class="menu"><a href="services6.asp">购置流程</a><a href="services1.asp">尚鉴尊享会</a><a href="services3.asp">财税问答</a><a href="services4.asp">贷款咨询</a><a href="services5.asp" class="on">移民知识</a><a href="services2.asp">政策消息</a></ul>
</div>
</div>
<!--公司介绍1-->
<div class="part1">
<div class="container">
    <ul class="list-news2 row ">

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
        <!---->
        <li><div class="pic col-md-4"><a href="servicesview.asp?id=<%=rsnew("prod_id")%>" class="b_w"><img src="<%=rsnew("prod_pic")%>"></a></div><div class="text col-md-8"><a class="tit fc-red ellipsis" href="servicesview.asp?id=<%=rsnew("prod_id")%>"><%=rsnew("prod_name")%></a><p class="txt"><%=left(RemoveHTML(rsnew("prod_detail")),206)%>...</p>
            <a class="xgbtn2" href="servicesview.asp?id=<%=rsnew("prod_id")%>"><span>查看详情</span><em class="more-arr tra">&gt;</em></a>&nbsp;<a class="xgbtn2 wyzx" href="javascript:feedback()"><i class="pico pico-qp2"></i><span>我要咨询</span></a>
            </div>
        <div class="c "></div>
            </li>
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
