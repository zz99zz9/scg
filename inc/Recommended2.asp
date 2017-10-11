<div class="parttj" style="padding-top:0;">
    <div class="container ">
<div class="tit"><!--<i class="pico pico-tit"></i>相关推荐<span class="en">/RECommended projects</span>--><img src="xgwl/img/tit/52.png"></div>
    <ul class="list1 row">
    <%set rstj=Server.CreateObject("ADODB.Recordset")
      sql="select top 3 * from [Table_Product] where Passed=true order by OrderId desc,articleid "
      rstj.Open sql,conn,1,1%>
    <%

    if rstj.bof and rstj.eof then
    response.write("暂无内容")
    else
    i=0
       do while not rstj.eof and i<4
    %>
    <% if rstj("clxid")=7 then
     clxid="期房"
    elseif rstj("clxid")=11 then
    clxid="现房"
    else clxid="现房 期房"
     end if%>
      <li class="col-md-4 wow fadeInUp">
             <span class="cls fc-gold2"><i class="ico-c ico-c<%=rstj("clbid")%>g"></i><%=rstj("clbname")%></span>
             <div class="pic"><img src="<%=rstj("defaultpicurl")%>" /><a class="bgmask2 tra" href="housingview.asp?id=<%=rstj("articleid")%>">
<p class="fzy"><%=rstj("Product_Id")%></p>
             <p class="xgbtn tjbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></p></a></div>
             <a class="ellipsis tit" href="housingview.asp?id=<%=rstj("articleid")%>"><%=rstj("entitle")%>&nbsp;<%=rstj("title")%></a>

         </li>
     <!------------>

    <%
    rstj.movenext
    i=i+1
    loop
    end if
    	rstj.close
    	set rstj=nothing%>


        </ul>
    </div>
    </div>