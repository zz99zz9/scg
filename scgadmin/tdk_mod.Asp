
<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <!-- page start -->

                            <!--成功失败提示-->
<div class="alert" id="alert" style="display:none;">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>栏目内容修改成功。</span>
                              </div>
 
                          <!----> 
              <div class="row ">
                  <div class="col-lg-12">
                      <section class="panel pb50">
                          <header class="panel-heading mb50">
                              信息修改
                          </header>
                      <form name="myform" id="myform">    
                      <%
Dim PID
ID=Trim(Request.QueryString("ID"))
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [tdk] where id="&ID,conn,1,3
if oRs.Eof then
'无数据
End if
%>
<!--国家分类开始-->

  <!--国家分类结束-->
    <div class="form-group row">
    <label for="name" class="col-sm-2 control-label text-right xglab">栏目名称</label>
    <div class="col-sm-7 row">
     <div class="col-sm-12">
      <input type="text" name="name" class="form-control" id="name" value="<%=oRs("name")%>">
      </div>
    </div>
  </div>
<div class="form-group row">
    <label for="title" class="col-sm-2 control-label text-right xglab">Title</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="title" class="form-control" id="title" placeholder="请输入推广标题" value="<%=oRs("t")%>">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="keywords" class="col-sm-2 control-label text-right xglab">Keywords</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="keywords" class="form-control" id="keywords" placeholder="推广关键词之间请用,号将其隔开"  value="<%=oRs("k")%>">
      </div>
    </div>
  </div>
<div class="form-group row">
    <label for="description" class="col-sm-2 control-label text-right xglab">Description</label>
    <div class="col-sm-7 row">
    <div class="col-sm-12">
      <input type="text" name="description" class="form-control" id="description" placeholder="推广描述"  value="<%=oRs("d")%>">
      </div>
    </div>
  </div>

<div class="form-group row">
    <label for="Oid" class="col-sm-2 control-label text-right xglab">排序ID</label>
    <div class="col-sm-7 row">
    <div class="col-sm-2">
      <input type="text" name="Oid" class="form-control" id="Oid" value="<%=oRs("oid")%>" placeholder="数字越大排序越靠前" >
      </div>
    </div>
</div>

<div class="row">
<div class="col-lg-offset-2 col-lg-7">
<button class="btn btn-danger save" type="button" style="margin:15px auto;">保存</button>
<input id="action" value="mod" type="hidden">
<input id="id" value="<%=oRs("id")%>" type="hidden">
</div>
  </div>
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
  <script type="text/javascript">
//导航菜单
$(".nav1").addClass('active');
$(".nav1-4").addClass('active');

</script>
<script type="text/javascript" src="ajax/tdk.js"></script>
