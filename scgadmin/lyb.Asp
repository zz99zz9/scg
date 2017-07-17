<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start -->
<%
dim i
dim sql,rs

sql="select * From [lyb] where lyqq='0' order by lyid desc"

Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
%>
             <!--成功失败提示-->
<div class="alert" id="alert" style="display:none;">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>栏目内容修改成功。</span>
                              </div>
 
                          <!----> 
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              留言列表
                          </header>
                          
<!--列表开始-->

<!--以后补一个类别切换-->
<form>
<table class="table table-striped border-top table-hover" id="sample_1">
<thead>
          <tr > 

            <th width="60" class=""><strong>姓名</strong></th>
            <th width="70" class=""><strong>电话</strong></th>
            <th width="70"  class="hidden-phone"><strong>邮箱</strong></td>
            <th width="50" class=""><strong>留言时间</strong></th>
            <th width="170"  class="hidden-phone"><strong>内容</strong></th>

           <th width="48" ><strong>操作</strong></th>
          </tr></thead>
          <tbody>
          <%do while not rs.eof%>
          <tr >
            <td class=""><%=rs("lyname")%></td>
            <td class=""><%=rs("lytel")%></td>
            <td class="hidden-phone"><%=rs("lyemail")%></td>
            <td ><%= FormatDateTime(rs("lydate"),2) %></td>
            <td class="hidden-phone"><%=rs("lytext")%></td>

            <td >
<a href="#" class="btn btn-info btn-xs hidden-lg hidden-md hidden-sm">查看详情</a>
              <a href="?lyid=<%=rs("lyid")%>&Action=Del" onClick="return ConfirmDel();" class="btn btn-danger btn-xs">删除</a> </td><!---->
          </tr>
          <%
	i=i+1
	  
	      rs.movenext
	loop
%>
          </tbody>
          </table>
        </table>
</form>
<!--列表结束-->
                      </section>
                  </div>
              </div>

              <!--  page end  -->
          </section>
      </section>
      <!--main content end-->
  </section>

<!--#include file="inc/xgfooter.asp"-->
<!--#include file="inc/windows.asp"-->
<%
action=request.QueryString("Action")
delid=request.QueryString("lyid")
if action="Del" then
conn.execute "delete from [lyb] lyid="&Trim(delid)
response.Redirect("lyb.Asp?sta=del")
end if
%>
  <script type="text/javascript">
//导航菜单



$(".nav6").addClass('active');
$(".nav6-3").addClass('active');

function ConfirmDel()
{
   if(confirm("确定要删除选中的内容吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
}
var sta='<%=request.QueryString("sta")%>';
if(sta=='add'){
			  		$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert span").html("数据添加成功!");
}else if(sta=='mod'){
			  		$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert span").html("数据修改成功!");
}else if(sta=='del'){
			  		$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert span").html("数据删除成功!");
}
console.log(sta);
</script>
<script type="text/javascript" src="xgwl/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="xgwl/assets/data-tables/DT_bootstrap.js"></script>
<script src="xgwl/js/dynamic-table.js"></script>
