
<!--#include file="inc/xgheader.asp"-->
<%tablename="links"
wid=request.QueryString("c")
              call SafeRequest(wid)%>
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
                                  <strong>操作成功！</strong> <span>产品类别修改成功。</span>
                              </div>
 
                          <!----> 
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                          广告及链接列表 <button data-toggle="modal" class="btn btn-success mod"  data-action="add" data-wid="<%=wid%>" ><i class="icon-picture"></i> 添加新链接</button>

                          </header>
                          
<!--列表开始-->

<div id="tablee"></div>
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
$(".nav8").addClass('active');
$(".nav8-<%=wid%>").addClass('active');

$(document).ready(function(e) {
	var tablename="<%=tablename%>";
   defalutlist("list","<%=wid%>");
});

</script>
<script type="text/javascript" src="ajax/links.js"></script>
