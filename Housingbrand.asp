<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%
dim tdkid
tdkid=6
%>
<!--#include file="inc/header.asp"-->
    <link rel="stylesheet" href="xgwl/css/3.css"/>
    <style>
    ul.list2 li .pic{margin-top:30px;}
 <!--   ul.list2 li.l1{height:330px;}
         ul.list2 li{height:330px;}-->
</style>
<!--广告图-->
<div class="topbg container">
<!--#include file="inc/searchbar.asp"-->
    <div class="edinfo">
    <span class="edtit">Manhattan View at MiMA</span>
    <span class="edtxt">矗立于纽约中心500英尺高空，以卓越品质定义国际化生活标准</span>
    <a class="xgbtn" href="housingview.asp?id=2"><span>查看详情</span><em class="more-arr tra">&gt;</em></a>
</div>
</div>
<!--引导条-->
<div class="ubar">
<div class="container">
<a href="#" class="fc-red">SCG</a> <em class="more-arr">&gt;</em> <a href="aboutscg.asp">代表项目</a>
<ul class="menu"><a href="housing.asp?<%call seaurl(bc,sc,fj,"11",lb,order,page)%>">在售项目</a><a href="housing.asp?<%call seaurl(bc,sc,fj,"7",lb,order,page)%>">待售项目</a><a href="housingbrand.asp" class="on">代表项目</a></ul>
</div>
</div>
<!--国内代表项目-->
<div class="container part2">
	<div class="tit"><img src="xgwl/img/tit/8.png"><!--<i class="pico pico-tit"></i>国内代表项目<span class="en">/Projects in China </span><a class="more" href="#">更多 <em class="more-arr">&gt;</em></a>--></div>
    <ul class="list2 row">
   <%

      	  set rsnew=Server.CreateObject("ADODB.Recordset")
      	  sqlnew="select * from [prod] where Passed=true and classid=22"
      	  	if bid<>0 then
      			sqlnew = sqlnew+" and bigclassid="&bid
      		end if
      	  sqlnew=sqlnew+" order by oid desc,prod_id desc"

      rsnew.Open sqlnew,conn,1,1%>
      <!---->
       <%
             if rsnew.bof and rsnew.eof then
             response.write("暂无内容")
             else
             rsnew.PageSize=20 '设置页码
             pagecount=rsnew.PageCount '获取总页码
             page=int(request("page")) '接收页码
             if page<=0 then page=1 '判断
             if request("page")="" then page=1
             rsnew.AbsolutePage=page '设置本页页码
             i=0
             do while not rsnew.eof and i<rsnew.PageSize
             %>
              <li class="col-md-3 wow fadeInUp">

                     <div class="pic"><img src="<%=rsnew("prod_pic")%>"></div>
                     <a class="ellipsis tit" title="<%=rsnew("prod_name")%>"><%=rsnew("prod_name")%></a>
                     <span class="txt"><%=left(RemoveHTML(rsnew("prod_detail")),260)%></span>

                 </li>
              <!---->

               <%rsnew.movenext
             	i=i+1
                 loop
             	end if
             	rsnew.close
             	set rsnew=nothing%>
    </ul>
</div>

<!--国外代表项目-->
<div class="container part2">
	<div class="tit"><img src="xgwl/img/tit/9.png"><!--<i class="pico pico-tit"></i>国外代表项目<span class="en">/Overseas Projects </span><a class="more" href="#">更多 <em class="more-arr">&gt;</em></a>--></div>
    <ul class="list2 row">
   <%

      	  set rsnew=Server.CreateObject("ADODB.Recordset")
      	  sqlnew="select * from [prod] where Passed=true and classid=23"
      	  	if bid<>0 then
      			sqlnew = sqlnew+" and bigclassid="&bid
      		end if
      	  sqlnew=sqlnew+" order by oid desc,prod_id desc"

      rsnew.Open sqlnew,conn,1,1%>
      <!---->
       <%
             if rsnew.bof and rsnew.eof then
             response.write("暂无内容")
             else
             rsnew.PageSize=20 '设置页码
             pagecount=rsnew.PageCount '获取总页码
             page=int(request("page")) '接收页码
             if page<=0 then page=1 '判断
             if request("page")="" then page=1
             rsnew.AbsolutePage=page '设置本页页码
             i=0
             do while not rsnew.eof and i<rsnew.PageSize
             %>
              <li class="col-md-3 wow fadeInUp">

                     <div class="pic"><img src="<%=rsnew("prod_pic")%>"></div>
                     <a class="ellipsis tit" title="<%=rsnew("prod_name")%>"><%=rsnew("prod_name")%></a>
                     <span class="txt"><%=left(RemoveHTML(rsnew("prod_detail")),260)%></span>

                 </li>
              <!---->

               <%rsnew.movenext
             	i=i+1
                 loop
             	end if
             	rsnew.close
             	set rsnew=nothing%>
    </ul>
</div>
<!--国外代表项目-->
<div class="container part2">
	<div class="tit"><img src="xgwl/img/tit/6.png"><!--<i class="pico pico-tit"></i>国外房产项目<span class="en">/Overseas Properties </span><a class="more" href="#">更多 <em class="more-arr">&gt;</em></a>--></div>
    <ul class="list2 row">
    <%dim cid

    	  set rsnew=Server.CreateObject("ADODB.Recordset")
    	  sqlnew="select * from [prod] where Passed=true and classid=21"
    	  	if bid<>0 then
    			sqlnew = sqlnew+" and bigclassid="&bid
    		end if
    	  sqlnew=sqlnew+" order by oid desc,prod_id desc"

    rsnew.Open sqlnew,conn,1,1%>
    <!---->
     <%
           if rsnew.bof and rsnew.eof then
           response.write("暂无内容")
           else
           rsnew.PageSize=20 '设置页码
           pagecount=rsnew.PageCount '获取总页码
           page=int(request("page")) '接收页码
           if page<=0 then page=1 '判断
           if request("page")="" then page=1
           rsnew.AbsolutePage=page '设置本页页码
           i=0
           do while not rsnew.eof and i<rsnew.PageSize

           if rsnew("url")<>"" then
           linkss=rsnew("url")
           else
           linkss="housing.asp"
          ' linkss="housingbrandview.asp?id="&rsnew("prod_id")
           end if
           %>
            <li class="col-md-3 wow fadeInUp l1">

                   <div class="pic"><img src="<%=rsnew("prod_pic")%>"><a class="bgmask2 tra" href="<%=linkss%>"><p class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></p></a></div>
                   <a class="ellipsis tit" href="<%=linkss%>" title="<%=rsnew("prod_name")%>"><%=rsnew("prod_name")%></a>
                   <span class=" txt"><%=left(RemoveHTML(rsnew("prod_detail")),260)%></span>
                <a href="<%=linkss%>" class="viewmore fc-red">查看详情 <em class="more-arr tra">&gt;</em></a>
               </li>
            <!---->

             <%rsnew.movenext
           	i=i+1
               loop
           	end if
           	rsnew.close
           	set rsnew=nothing%>

 <!---->

    </ul>
</div>
<!--国内房产项目-->
<div class="container part2">
	<div class="tit"><img src="xgwl/img/tit/7.png"><!--<i class="pico pico-tit"></i>国内房产项目<span class="en">/Projects in China </span><a class="more" href="#">更多 <em class="more-arr">&gt;</em></a>--></div>
    <ul class="list2 row">
   <%

      	  set rsnew=Server.CreateObject("ADODB.Recordset")
      	  sqlnew="select * from [prod] where Passed=true and classid=20"
      	  	if bid<>0 then
      			sqlnew = sqlnew+" and bigclassid="&bid
      		end if
      	  sqlnew=sqlnew+" order by oid desc,prod_id desc"

      rsnew.Open sqlnew,conn,1,1%>
      <!---->
       <%
             if rsnew.bof and rsnew.eof then
             response.write("暂无内容")
             else
             rsnew.PageSize=20 '设置页码
             pagecount=rsnew.PageCount '获取总页码
             page=int(request("page")) '接收页码
             if page<=0 then page=1 '判断
             if request("page")="" then page=1
             rsnew.AbsolutePage=page '设置本页页码
             i=0
             do while not rsnew.eof and i<rsnew.PageSize
             %>
              <li class="col-md-3 wow fadeInUp">

                     <div class="pic"><img src="<%=rsnew("prod_pic")%>"></div>
                     <a class="ellipsis tit" title="<%=rsnew("prod_name")%>"><%=rsnew("prod_name")%></a>
                     <span class=" txt"><%=left(RemoveHTML(rsnew("prod_detail")),260)%></span>

                 </li>
              <!---->

               <%rsnew.movenext
             	i=i+1
                 loop
             	end if
             	rsnew.close
             	set rsnew=nothing%>
    </ul>
</div>



    <!--相关推荐-->
    <!--#include file="inc/recommended.asp"-->
<!--#include file="inc/footer.asp"-->
</body>
</html>

