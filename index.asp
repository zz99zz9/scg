<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%
dim tdkid
tdkid=1
%>
<!--#include file="inc/header.asp"-->
    <link rel="stylesheet" href="xgwl/css/index.css"/>
<!--广告图-->
<div class="part1 container">
	<div class="ed1 hand">
	<!-------->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators hidden-xs">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
        </ol>

        <!-- Wrapper for slides -->

        <div class="carousel-inner" role="listbox">

                    <%Set prs= Server.CreateObject("ADODB.Recordset")
        psql="select top 5 * From [links] where wid=1 order by oid desc,ID desc"
        prs.open psql,conn,1,1
        i=0%>
        <%do while not prs.eof%>

                    <div class="item <%if i=0 then%>active<%end if%>" onclick="window.location.href='<%=prs("url")%>';">
                                    <img src="<%=prs("file")%>"  alt="...">
                                   <h1><%=prs("stit")%></h1>
                                      <p class="tra hidden-xs"><%=prs("stxt")%></p>
                                  <a href="<%=prs("url")%>" class="tra a hidden-xs"><span>查看详情</span><em class="more-arr">&gt;</em></a>
                                   <em class="bgmask tra"></em>
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

	</div>
	    <%Set prs= Server.CreateObject("ADODB.Recordset")
                psql="select top 1 * From [links] where wid=2 order by oid desc,ID desc"
                prs.open psql,conn,1,1
                i=0%>
                <%do while not prs.eof%>
    <div class="ed2 hand" onclick="window.location.href='<%=prs("url")%>';">

    <img src="<%=prs("file")%>"/>
    <h1><%=prs("stit")%></h1>
        <p class="tra hidden-xs"><%=prs("stxt")%></p>
<a href="<%=prs("url")%>" class="tra a hidden-xs"><span>查看详情</span><em class="more-arr">&gt;</em></a>

<em class="bgmask tra"></em>
</div>
         <%
        	i=i+1

        	     prs.movenext
        	loop
        prs.close
        set prs=nothing
        %>
    <div class="ed2" style='z-index:1;'>
    <!---->
<script src='//player.polyv.net/script/polyvplayer.min.js'></script>
<div id='plv_4c056f31eeb7bbfc95cf0fffd96abc98_4' style='z-index:1;'></div>
<script>
        if(screen.width<700){
var player = polyvObject('#plv_4c056f31eeb7bbfc95cf0fffd96abc98_4').videoPlayer({
    'width':'100%',
  'height':'190',
    'vid' : '4c056f31eeb7bbfc95cf0fffd96abc98_4'
});
}else{
    var player = polyvObject('#plv_4c056f31eeb7bbfc95cf0fffd96abc98_4').videoPlayer({
    'width':'100%',
  'height':'257',
    'vid' : '4c056f31eeb7bbfc95cf0fffd96abc98_4'
});
}

</script>

    <!--<img src="xgwl/img/index/ed3.jpg"/>-->
    </div>
</div>
<!--特别推荐-->
 <!--#include file="inc/recommended.asp"-->
<!--代表项目-->
<div class="container part2">
	<div class="tit"><img src="xgwl/img/tit/1.png"><!--<i class="pico pico-tit"></i>代表项目<span class="en">/KEY PROJECTS</span>--><a class="more hidden-xs" href="housing.asp">更多 <em class="more-arr">&gt;</em></a></div>
    <ul class="list1 row">
    <%

          set rsnew=Server.CreateObject("ADODB.Recordset")
          sqlnew="select top 6 * from [prod] where Passed=true and (classid=23 or classid=22 or classid=21 or classid=20) "

          sqlnew=sqlnew+" order by ioid desc,oid desc,prod_id desc"

      rsnew.Open sqlnew,conn,1,1
       do while not rsnew.eof
        if rsnew("url")<>"" then
           linkss=rsnew("url")
           else
           linkss="housing.asp"
          ' linkss="housingbrandview.asp?id="&rsnew("prod_id")
           end if
           %>
            <li class="col-md-4 wow fadeInUp">
                <span class="cls fc-gold2"><i class="ico-c ico-c<%=rsnew("clbid")%>g"></i><%=showNamef("class_lb",rsnew("clbid"),"cid","cname")%></span>
                <div class="pic"><img src="<%=rsnew("prod_pic")%>" /><a class="bgmask2 tra" href="<%=linkss%>"><p class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></p></a></div>
                <a class="ellipsis tit" href="<%=linkss%>"><%=rsnew("prod_name")%></a>
                <span class="address"><i class="pico pico-addressb"></i><%=rsnew("bigclass")%>，<%=rsnew("smallclass")%></span>
                <span class="ellipsis2 txt"><%=left(RemoveHTML(rsnew("prod_detail")),260)%></span>
            </li>
<%rsnew.movenext
              i=i+1
                 loop
              rsnew.close
              set rsnew=nothing%>
            </ul>
              <ul class="list2 row" style="display:none;">
               <%
                  	  set rsnew=Server.CreateObject("ADODB.Recordset")
                  	  sqlnew="select * from [prod] where classid=22  order by oid desc,prod_id desc"
                  rsnew.Open sqlnew,conn,1,1%>
                  <!---->
                   <%
i=0
                         do while not rsnew.eof and i<6
                         %>
                          <li class="col-md-4 wow fadeInUp">
                                 <span class="cls fc-gold2"><i class="ico-c ico-c11g"></i>豪华公寓</span>
                                 <div class="pic"><img src="<%=rsnew("prod_pic")%>"></div>
                                 <a class="ellipsis tit" ><%=rsnew("prod_name")%></a>
                                 <span class="ellipsis2 txt"><%=left(RemoveHTML(rsnew("prod_detail")),260)%>......</span>

                             </li>
                          <!---->

                           <%rsnew.movenext
                         	i=i+1
                             loop
                         	rsnew.close
                         	set rsnew=nothing%>
                </ul>
</div>
<!--搜索功能-->
<!--#include file="inc/searchbar2.asp"-->
 <!--服务咨询-->
 <div class=" part4">
    <div class="container">
 	<div class="tit"><!--<i class="pico pico-tit"></i>服务咨询<span class="en">/Service & Inquiries</span>--><img src="xgwl/img/tit/3.png"><a class="more hidden-xs" href="services.asp">更多 <em class="more-arr">&gt;</em></a></div>
 	<ul class="list-ser">
<!-- 	<a href="services6.asp" class=" wow fadeInUp"><span class="pic"><img src="xgwl/img/index/s1.jpg"><em class="tra bgmask"><b class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></b></em></span><p> <i class="arrow-up tra"></i><span class="serline"></span><span class="cname">购置流程</span><span class="ename">Purchase process</span></p></a>-->
 	<a href="news.asp?c=18" class=" wow fadeInUp"><span class="pic"><img src="xgwl/img/index/s2.jpg"><em class="tra bgmask"><b class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></b></em></span><p> <i class="arrow-up tra"></i><span class="serline"></span><span class="cname">留学置业</span><span class="ename">Studying abroad</span></p></a>
 	<a href="news.asp?c=17" class=" wow fadeInUp" ><span class="pic"><img src="xgwl/img/index/s3.jpg"><em class="tra bgmask"><b class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></b></em></span><p> <i class="arrow-up tra"></i><span class="serline"></span><span class="cname">投资要闻</span><span class="ename">Bank Mortgage</span></p></a>
 	<a href="services5.asp" class=" wow fadeInUp" ><span class="pic"><img src="xgwl/img/index/s4.jpg"><em class="tra bgmask"><b class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></b></em></span><p> <i class="arrow-up tra"></i><span class="serline"></span><span class="cname">移民知识</span><span class="ename">EB-5 Information</span></p></a>
 	<a href="services6.asp" class=" wow fadeInUp" ><span class="pic"><img src="xgwl/img/index/s5.jpg"><em class="tra bgmask"><b class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></b></em></span><p> <i class="arrow-up tra"></i><span class="serline"></span><span class="cname">购置流程</span><span class="ename">Process</span></p></a>
</ul>

 	</div>
 </div>
 <!--新闻资讯-->
 <div class="container part5">
 	<div class="tit"><img src="xgwl/img/tit/4.png"><!--<i class="pico pico-tit"></i>新闻资讯<span class="en">/NEWS & PRESS</span>--><a class="more hidden-xs" href="news.asp">更多 <em class="more-arr">&gt;</em></a></div>
 <ul class="list-news row">
  <%
  set rsnew=Server.CreateObject("ADODB.Recordset")
  sqlnew="select * from [prod] where Passed=True and  (classid=16 or classid=17 or classid=18 or classid=19 or classid=24) order by oid desc,prod_id desc"
  rsnew.Open sqlnew,conn,1,1
        if rsnew.bof and rsnew.eof then
        response.write("暂无内容")
        else
        i=0
        do while not rsnew.eof and i<4
        %>
         <!---->
                                      <a class="col-md-3 wow fadeInUp" href="<%if rsnew("url")<>"" then %><%=rsnew("url")%><%else%>newsview.asp?id=<%=rsnew("prod_id")%><%end if%>" target="_blank">

                                              <div class="pic"><img src="<%=rsnew("prod_pic")%>"><p class="tra bgmask" href="#"><b class="xgbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></b></p></div>
                                              <div class="newsbor tra">
                                                  <p class="newstit fc-red fz15p ellipsis ls1"><%=rsnew("prod_name")%></p>
                                                  <p class="newstxt fz15p ellipsis3"><%=left(RemoveHTML(rsnew("prod_detail")),260)%></p>
                                                    <p class="newstime fc-gold2 fz12p"><i class="pico pico-book"></i><%=formatdatetime(rsnew("prod_date"),2)%></p>
                                  </div>
                                          </a>
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

<!--#include file="inc/footer.asp"-->
</body>
</html>
