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
pro_id=request.QueryString("pro_id")
if pro_id="" then
sql="select * From [Table_Product] order by ArticleID desc"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
pro_id=rs("ArticleID")
rs.close
set rs=nothing
end if
call SafeRequest(pro_id)
'call isnumber(pro_id)
sql="select * From [Table_Pic] where pro_id="&pro_id&" order by oid desc,id desc"

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
                              <a href="pro_list.asp" class="btn btn-success"><i class="icon-chevron-left"></i> 返回楼盘列表</a>  
                          </header>
                          
                          <div class="row panel-body text-center">
                          <h4><%call showpictit(pro_id)%></h4>
                         </div>
                          
<!--列表开始-->
<div class="row panel-body " id="tablee">

<!---->    <div class="col-sm-6 col-md-3 col-lg-2 piclist">
    <span class="editer"><div class="editerbor rbor"><input value="1" type="text" id="" class="form-control int"><input value="1" type="hidden" class="picid"><span class="txt">排序权重</span><a class="txt2 btn btn-xs btn-success hide">保 存</a></div><div class="editerbor"><a class="icon-remove b_h" href="#"></a><span class="txt">删除图片</span></div></span>
        <a href="#" class="thumbnail">
            <img src="../jll/img/temp/lb1-1.jpg">
        </a>
    </div>

        <div class="col-sm-6 col-md-3 col-lg-2 piclist">
        <form name="form1" id="form1" method="post" action="pro_pic_upload.asp?proid=<%=pro_id%>" enctype="multipart/form-data" >
        <input type="file" name="file1" id="file1" class="hide">
        <input type="text" name="proid" id="proid" value="<%=pro_id%>" class="hide">
        </form>
    <p class="addpic" ><i class="icon-picture" ></i><span>添加图片</span></p>
<i class="thumbnail">
            <img src="../xgwl/img/122.gif">
</i>
    </div>
</div>
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
delid=request.QueryString("ArticleID")
if action="Del" then
conn.execute "delete from [Table_Pic] where Id="&Trim(delid)
response.Redirect("Pro_List.Asp?sta=del")
end if
%>
  <script type="text/javascript">
//导航菜单
$(".nav3").addClass('active');
$(".nav3-1").addClass('active');
$(document).ready(function(e) {
	console.log(<%=pro_id%>); 
  defaultlist(<%=pro_id%>);
 
});


//修改排序时出现保存按钮
$(".piclist .editer .editerbor .int").focus(function(){
	$(this).parents(".editerbor").find(".txt:first").addClass("hide");
	$(this).parents(".editerbor").find(".txt2").removeClass("hide");
//	$(this).next().addClass("hide");
//	$(this).parents(".editerbor").find(".txt2").removeClass("hide");
});
$(".piclist .editer .editerbor .txt2").click(function(){
	var cid=$(this).parents(".editerbor").find(".picid").val();
	var cv=$(this).parents(".editerbor").find(".int").val();
	console.log(cid+":"+cv);
	});
	//删除当前图片
$(".piclist .editer .editerbor .icon-remove").click(function(){
	var cid=$(this).parents(".editer").find(".picid").val();
	console.log("del:"+cid);
	console.log("当前项目id:"+cid);
});
function ConfirmDel()
{
   if(confirm("确定要删除吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
}

</script>

<script type="text/javascript" src="ajax/pic_list.js"></script>
