<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%

dim tdkid
tdkid=21
nk=request.QueryString("k")
'key=nk
snk=" and (prod_name like '%"&nk&"%' or prod_detail like '%"&nk&"%' or prod_detailen like '%"&nk&"%' or tips like '%"&nk&"%' or classname like '%"&nk&"%')"
'查看条数
	  set rsnew1=Server.CreateObject("ADODB.Recordset")
	  sqlnew1="select count(*) as cc from [prod] where (classid=16 or classid=17 or classid=18 or classid=19 or classid=24) "
		if nk<>"" then
        			sqlnew1 = sqlnew1+snk
        		end if

rsnew1.Open sqlnew1,conn,1,1
cc=rsnew1("cc")
rsnew1.close
set rsnew1=nothing

'调取数据

	  set rsnew=Server.CreateObject("ADODB.Recordset")
	  sqlnew="select * from [prod] where (classid=16 or classid=17 or classid=18 or classid=19 or classid=24) "
		if nk<>"" then
        			sqlnew = sqlnew+snk
        		end if
	  sqlnew=sqlnew+" order by oid desc,prod_id desc"

rsnew.Open sqlnew,conn,1,1%>
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
<ul class="menu"><a href="news.asp?c=16">活动信息</a><a href="news.asp?c=24" >曼哈顿生活</a><a href="news.asp?c=17" >投资要闻</a><a href="news.asp?c=18" >政策消息</a><a href="news.asp?c=19" >行业资料</a></ul>
</div>
</div>
<!--公司介绍1-->

<div class="part1">
<div class="container">
<div class="newsbar"><span class="newsclass">我们为您找到 <%=cc%> 条与 “<%=nk%>”相关的文章</span></div>
 <ul class="list-news row">
  <%
        if rsnew.bof and rsnew.eof then
        response.write("&nbsp;&nbsp;&nbsp;&nbsp;<a href=news.asp>< 返回新闻栏目</a>")
        else
        rsnew.PageSize=16 '设置页码
        pagecount=rsnew.PageCount '获取总页码
        page=int(request("page")) '接收页码
        if page<=0 then page=1 '判断
        if request("page")="" then page=1
        rsnew.AbsolutePage=page '设置本页页码
        i=0
        do while not rsnew.eof and i<rsnew.PageSize
        %>

                                      <a class="col-md-3 wow fadeInUp" href="<%if rsnew("url")<>"" then %><%=rsnew("url")%><%else%>newsview.asp?id=<%=rsnew("prod_id")%><%end if%>" title="<%=rsnew("prod_name")%>" target="_blank">

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
     %>
<!---->

          </ul>
           <table width="95%" height="25" style="display:none;" border="0" align="center" cellpadding="0" cellspacing="0" borderColorLight=#808080 borderColorDark=#ffffff>
                            <tr class="url_1">
                              <%if rsnew.pagecount > 0 then%>
                              <td width="15%" align="center" valign="middle" >当前页<%=page%>/<%=rsnew.PageCount%></td>
                              <%else%>
                              <td width="15%" align="center" valign="middle" >当前页0/0</td>
                              <%end if%>
                              <td width="70%" align="right" ><a href="?page=1&smallclass=<%=smallclass%>">首页</a>
                                  <%if pre then%>
                                  <a href="?page=<%=page -1%>&smallclass=<%=smallclass%>">上页</a>
                                  <%end if%>
                                <%if last then%>
                                  <a href="?page=<%=page +1%>&smallclass=<%=smallclass%>">下页</a>
                                  <%end if%>
                                  <a href="?page=<%=rsnew.PageCount%>&smallclass=<%=smallclass%>">尾页</a>|转到第
                                <select name="select" onChange="javascript:location=this.options[this.selectedIndex].value;">
                                    <%
          for i = 1 to rsnew.PageCount
          if i = page then%>
                                    <option value="?page=<%=i%>&smallclass=<%=smallclass%>" selected><%=i%></option>
                                    <%else%>
                                    <option value="?page=<%=i%>&smallclass=<%=smallclass%>"><%=i%></option>
                                    <%
          end if
          next
          %>
                                </select>
                                页</td>
                            </tr>
                          </table>
                          <%   	rsnew.close
                                    	set rsnew=nothing%>
</div>
    </div>
        <!--相关推荐-->
        <!--#include file="inc/recommended.asp"-->
<!--#include file="inc/footer.asp"-->
</body>
</html>
