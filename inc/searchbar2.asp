<div class="container part3">
	<div class="tit"><!--<i class="pico pico-tit"></i>搜索您感兴趣的项目<span class="en">/SEARCH</span>--><img src="xgwl/img/tit/2.png"></div>
    <div class="searchform row"><form action="search.asp" method="post" id="sform">
    <div class="col-md-2"><select class="form-control s-lb">
    <option value="">全部类别</option>
                                  <%set rsclass=Server.CreateObject("ADODB.Recordset")
                                    sqlclass="select * from [class_lb] order by OId desc,cid desc"
                                    rsclass.Open sqlclass,conn,1,1
                                    do while not rsclass.eof %>
                              <option value="<%=rsclass("cid")%>" <%call isselected(lb,rsclass("cid"))%>><%=rsclass("cname")%></option>selected="selected"
                              <%rsclass.movenext
                                loop
                                rsclass.close
                                	set rsclass=nothing%></select></div><div class="col-md-3">
        <select class="form-control s-fj">
        <option value="">全部区域</option>
            <%set rsclass=Server.CreateObject("ADODB.Recordset")
              sqlclass="select * from [class_fj] order by OId desc,cid desc"
              rsclass.Open sqlclass,conn,1,1
              do while not rsclass.eof %>
        <option value="<%=rsclass("cid")%>"  <%call isselected(fj,rsclass("cid"))%>><%=rsclass("cname")%></option>
        <%rsclass.movenext
          loop
          rsclass.close
          	set rsclass=nothing%></select></div>
    <div class="col-md-2">
   <select class="form-control s-lx" >
   <option value="">全部类型</option>
               <%set rsclass=Server.CreateObject("ADODB.Recordset")
                 sqlclass="select * from [class_lx] order by OId desc,cid desc"
                 rsclass.Open sqlclass,conn,1,1
                 do while not rsclass.eof %>
           <option value="<%=rsclass("cid")%>" <%call isselected(lx,rsclass("cid"))%>><%=rsclass("cname")%></option>
           <%rsclass.movenext
             loop
             rsclass.close
             	set rsclass=nothing%></select></div><div class="col-md-5">
    <div class=" input-group">
    <input class="form-control s-key" value="<%=key%>">
    <span class="input-group-btn">
    <button class="btn s-btn" type="button"><i class="pico pico-magw "></i>搜索</button>
    </span>
    </div>
    </div>
    </form></div>
 </div>