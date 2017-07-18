<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<%dim cid
cid=request.QueryString("c")
if cid="" then cid=0
select case cid
case 16
tdkid=14
case 24
tdkid=20
case 17
tdkid=15
case 18
tdkid=16
case 19
tdkid=17
case 0
tdkid=13
end select
	  set rsnew=Server.CreateObject("ADODB.Recordset")
	  if cid<>0 then
	  call SafeRequest(cid)
	  sqlnew="select * from [prod] where classid="&cid
	  else
	  sqlnew="select * from [prod] where classid=16 or classid=17 or classid=18 or classid=19 or classid=24 "
	  end if
	  	if bid<>0 then
			sqlnew = sqlnew+" and bigclassid="&bid
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
<ul class="menu"><a href="news.asp?c=16" <%call ison(cid,16)%>>活动信息</a><a href="news.asp?c=24" <%call ison(cid,24)%>>曼哈顿生活</a><a href="news.asp?c=17" <%call ison(cid,17)%>>投资要闻</a><a href="news.asp?c=18" <%call ison(cid,18)%>>政策消息</a><a href="news.asp?c=19" <%call ison(cid,19)%>>行业资料</a></ul>
</div>
</div>
<!--公司介绍1-->
<%if cid=16 then
xlname="活动信息"
elseif  cid=17 then
       xlname="投资要闻"
       elseif  cid=18 then
              xlname="政策消息"
              elseif  cid=19 then
                            xlname="行业资料"
                               elseif  cid=24 then
                         xlname="曼哈顿生活"
                            else
                            xlname="全部新闻"
                            end if%>
<div class="part1">
<div class="container">
<div class="newsbar"><span class="newsclass"><%=xlname%></span><span class="col-md-2"><!--<select onchange="window.location=this.value;" class="form-control "><option value="news.asp" >全部新闻</option><option value="news.asp?c=16" <%if cid=16 then%>selected = "selected"<%end if%>>活动信息</option><option value="news.asp?c=17" <%if cid=17 then%>selected = "selected"<%end if%>>投资要闻</option><option value="news.asp?c=18" <%if cid=18 then%>selected = "selected"<%end if%>>政策消息</option><option value="news.asp?c=19" <%if cid=19 then%>selected = "selected"<%end if%>>行业资料</option></select>--></span><ul class="view"><!--<a href="news.asp?c=<%=cid%>" class="view1 on"></a><a href="news2.asp?c=<%=cid%>" class="view2 b_h"></a>--></ul></div>
 <ul class="list-news row">
  <%
        if rsnew.bof and rsnew.eof then
        response.write("暂无内容")
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
                                                  <p class="newstxt fz15p ellipsis3"><%=left(RemoveHTML(rsnew("prod_detailen")),260)%></p>
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
          <!--pages s-->
          <style>
          .pages{color:#898989;}
          .pages a{padding:5px 13px;border:1px solid #ebebeb;color:#898989;margin-right:10px;}
          .pages select{border:1px solid #ebebeb;}
</style>
           <table width="95%" height="25"  border="0" align="center" cellpadding="0" cellspacing="0" class="pages wow fadeInUp">
                            <tr class="url_1">
                              <%if rsnew.pagecount > 0 then%>
                              <td width="15%" align="left" valign="middle" >当前页<%=page%>/<%=rsnew.PageCount%></td>
                              <%else%>
                              <td width="15%" align="left" valign="middle" >当前页0/0</td>
                              <%end if%>
                              <td width="70%" align="right" ><%if page>1 then%><a href="?page=1&c=<%=cid%>">首页</a>

                                  <a href="?page=<%=page -1%>&c=<%=cid%>">上一页</a>
                                  <%end if%>
                                <%if rsnew.PageCount<>1 and page<>rsnew.PageCount then%>
                                  <a href="?page=<%=page +1%>&c=<%=cid%>">下一页</a>

                                  <a href="?page=<%=rsnew.PageCount%>&c=<%=cid%>">尾页</a>
                                  <%end if%>|转到第
                                <select name="select" onChange="javascript:location=this.options[this.selectedIndex].value;">
                                    <%
          for i = 1 to rsnew.PageCount
          if i = page then%>
                                    <option value="?page=<%=i%>&c=<%=cid%>" selected><%=i%></option>
                                    <%else%>
                                    <option value="?page=<%=i%>&c=<%=cid%>"><%=i%></option>
                                    <%
          end if
          next
          %>
                                </select>
                                页</td>
                            </tr>
                          </table>
                          <!--pages e-->
                          <%   	rsnew.close
                                    	set rsnew=nothing%>
</div>
    </div>
        <!--相关推荐-->
        <!--#include file="inc/recommended.asp"-->
<!--#include file="inc/footer.asp"-->
</body>
</html>
