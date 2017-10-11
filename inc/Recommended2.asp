<style>
.trait{color:#bfa062;border:1px solid #bfa062;text-align:center;display:block;line-height:30px;height:30px;font-size:13px;width:100%;border-radius:4px;margin-top:15px;}
ul.list1 li .tjbtn{margin-top:0 !important;}
</style>
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
             <p class="xgbtn tjbtn"><span>查看详情</span><em class="more-arr tra">&gt;</em></p></a></div>
             <a class="ellipsis tit" href="housingview.asp?id=<%=rstj("articleid")%>"><%=rstj("entitle")%>&nbsp;<%=rstj("title")%></a>
        
     <span class="address"><i class="pico pico-addressb"></i><%=rstj("bigclassname")%>，<%=rstj("smallclassname")%><br><div class="ellipsis" title="<%=rstj("qt")%>"><%x1=split(rstj("qt"),"|")%><%=x1(0)%></div></span>
 <span class="ellipsis2 txt"><%=rstj("Product_Id")%></span>
 <div class="row">
 <div class="price col-xs-12"><%if rstj("clxid")=997 then%><em class="tit fc-red">$<%=rstj("jgjj")%></em>万起（约<%=formatNumber((rstj("jgjj")*6.8871),0,-1)%>万人民币）<%end if%></div>
 </div>
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