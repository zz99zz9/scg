 <div class="seabar">
    <span class="seatit">搜索您感兴趣的项目</span>
    <label>类型</label>
    <select class="form-control s-lb">
    <option value="">全部类型</option>
        <%set rsclass=Server.CreateObject("ADODB.Recordset")
          sqlclass="select * from [class_lb] order by OId desc,cid desc"
          rsclass.Open sqlclass,conn,1,1
          do while not rsclass.eof %>
    <option value="<%=rsclass("cid")%>" <%call isselected(lb,rsclass("cid"))%>><%=rsclass("cname")%></option>selected="selected"
    <%rsclass.movenext
      loop
      rsclass.close
      	set rsclass=nothing%></select>

<label>区域</label>
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
      	set rsclass=nothing%></select>
<label>状态</label>
        <select class="form-control s-lx" >
        <option value="">全部状态</option>
            <%set rsclass=Server.CreateObject("ADODB.Recordset")
              sqlclass="select * from [class_lx] order by OId desc,cid desc"
              rsclass.Open sqlclass,conn,1,1
              do while not rsclass.eof %>
        <option value="<%=rsclass("cid")%>" <%call isselected(lx,rsclass("cid"))%>><%=rsclass("cname")%></option>
        <%rsclass.movenext
          loop
          rsclass.close
          	set rsclass=nothing%></select>
          	<input class="s-key" value="" type="hidden">
    <button class="s-btn"><i class="pico pico-magw"></i>搜索</button>
</div>